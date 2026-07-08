import {
  BadGatewayException,
  BadRequestException,
  HttpException,
  Injectable,
  Logger,
} from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import * as yaml from 'js-yaml';

@Injectable()
export class GithubProxyService {
  private readonly logger = new Logger(GithubProxyService.name);
  private readonly GITHUB_API_BASE_URL =
    'https://api.github.com/repos/WebTrit/webtrit_phone_builder/actions';
  private readonly GITHUB_WEBTRIT_PHONE_URL =
    'https://api.github.com/repos/WebTrit/webtrit_phone';

  constructor(private readonly configService: ConfigService) {}

  /** Build fresh headers each request (token may refresh). */
  private buildHeaders(extra?: Record<string, string>) {
    const token = this.configService.get<string>('GITHUB_TOKEN') ?? '';
    return {
      Accept: 'application/vnd.github+json',
      Authorization: `Bearer ${token}`,
      'X-GitHub-Api-Version': '2022-11-28',
      'User-Agent': 'webtrit-configurator/1.0',
      ...extra,
    };
  }

  /**
   * Inputs that older clients still send but the builder workflow no longer
   * accepts. Forwarding them verbatim makes GitHub reject the dispatch with
   * `422 Unexpected inputs provided`, which we surface as a 500 and break the
   * build flow. Strip them for backward compatibility.
   *
   * TODO(tech-debt): temporary compatibility shim. Once outdated clients are
   * gone (give it a few releases — watch for the "Dropped deprecated dispatch
   * input" warnings below to stop appearing), remove this list and the
   * stripping logic in dispatchWorkflow.
   */
  private static readonly DEPRECATED_DISPATCH_INPUTS = ['callkeepSourceBranch'];

  async dispatchWorkflow(inputs: any): Promise<any> {
    const url = `${this.GITHUB_API_BASE_URL}/workflows/build_phone.yml/dispatches`;

    const sanitizedInputs = { ...(inputs ?? {}) };
    for (const key of GithubProxyService.DEPRECATED_DISPATCH_INPUTS) {
      if (key in sanitizedInputs) {
        delete sanitizedInputs[key];
        this.logger.warn(
          `Dropped deprecated dispatch input "${key}" sent by an outdated client`,
        );
      }
    }

    const data = { ref: 'main', inputs: sanitizedInputs };

    try {
      const res = await fetch(url, {
        method: 'POST',
        headers: this.buildHeaders({ 'Content-Type': 'application/json' }),
        body: JSON.stringify(data),
      });

      if (!res.ok) {
        const body = await safeText(res);
        throw new Error(
          `POST ${url} failed: ${res.status} ${res.statusText}${
            body ? ` - ${body}` : ''
          }`,
        );
      }

      // GitHub may return 204 No Content for dispatch
      const maybeJson = await safeJson(res);
      return (
        maybeJson || {
          message: 'Workflow dispatched successfully',
          status: res.status,
        }
      );
    } catch (error: any) {
      this.logger.error(`Error dispatching workflow: ${error.message}`);
      if (error instanceof HttpException) throw error;
      throw new BadGatewayException(
        `Error dispatching workflow: ${error.message}`,
      );
    }
  }

  async getWorkflowRuns(): Promise<any> {
    const url = `${this.GITHUB_API_BASE_URL}/workflows/build_phone.yml/runs`;

    try {
      const res = await fetch(url, { headers: this.buildHeaders() });
      if (!res.ok) {
        const body = await safeText(res);
        throw new Error(
          `GET ${url} failed: ${res.status} ${res.statusText}${
            body ? ` - ${body}` : ''
          }`,
        );
      }
      return await res.json();
    } catch (error: any) {
      this.logger.error(`Error fetching workflow runs: ${error.message}`);
      if (error instanceof HttpException) throw error;
      throw new BadGatewayException(
        `Error fetching workflow runs: ${error.message}`,
      );
    }
  }

  async getWorkflowRunById(runId: string): Promise<any> {
    const url = `${this.GITHUB_API_BASE_URL}/runs/${runId}`;

    try {
      const res = await fetch(url, { headers: this.buildHeaders() });
      if (!res.ok) {
        const body = await safeText(res);
        throw new Error(
          `GET ${url} failed: ${res.status} ${res.statusText}${
            body ? ` - ${body}` : ''
          }`,
        );
      }
      return await res.json();
    } catch (error: any) {
      this.logger.error(`Error fetching workflow run by ID: ${error.message}`);
      if (error instanceof HttpException) throw error;
      throw new BadGatewayException(
        `Error fetching workflow run by ID: ${error.message}`,
      );
    }
  }

  /**
   * GitHub returns a ZIP (and often a redirect to a signed URL). We follow redirects (default)
   * and return the raw Buffer so the controller can stream or forward it.
   */
  async getWorkflowRunLogs(runId: string): Promise<Buffer> {
    const url = `${this.GITHUB_API_BASE_URL}/runs/${runId}/logs`;

    try {
      const res = await fetch(url, { headers: this.buildHeaders() });
      if (!res.ok) {
        const body = await safeText(res);
        throw new Error(
          `GET ${url} failed: ${res.status} ${res.statusText}${
            body ? ` - ${body}` : ''
          }`,
        );
      }
      const ab = await res.arrayBuffer();
      return Buffer.from(ab);
    } catch (error: any) {
      this.logger.error(`Error fetching workflow run logs: ${error.message}`);
      if (error instanceof HttpException) throw error;
      throw new BadGatewayException(
        `Error fetching workflow run logs: ${error.message}`,
      );
    }
  }

  async getPhoneBranches(): Promise<any[]> {
    const perPage = 100;
    let page = 1;
    let allBranches: any[] = [];

    try {
      while (true) {
        const url = `${this.GITHUB_WEBTRIT_PHONE_URL}/branches?per_page=${perPage}&page=${page}`;
        const res = await fetch(url, { headers: this.buildHeaders() });

        if (!res.ok) {
          const body = await safeText(res);
          throw new Error(
            `GET ${url} failed: ${res.status} ${res.statusText}${
              body ? ` - ${body}` : ''
            }`,
          );
        }

        const branches = (await res.json()) ?? [];
        allBranches = allBranches.concat(branches);

        const linkHeader = res.headers.get('link');
        if (!linkHeader || !linkHeader.includes('rel="next"')) break;
        page++;
      }
      return allBranches;
    } catch (error: any) {
      this.logger.error(`Error fetching branches: ${error.message}`);
      if (error instanceof HttpException) throw error;
      throw new BadGatewayException(
        `Error fetching branches: ${error.message}`,
      );
    }
  }

  /**
   * Retrieve the app_version from pubspec.yaml in the specified branch.
   */
  async getAppVersion(branch: string): Promise<string> {
    if (!branch) {
      throw new BadRequestException('The branch query parameter is required.');
    }
    const filePath = 'pubspec.yaml';

    try {
      const fileData = await this.getFileFromBranch(branch, filePath);

      if (!fileData || !fileData.content) {
        throw new Error(
          `File '${filePath}' not found or empty in branch '${branch}'.`,
        );
      }

      const decodedContent = Buffer.from(fileData.content, 'base64').toString(
        'utf-8',
      );

      const parsedYaml = yaml.load(decodedContent) as any;

      if (
        !parsedYaml ||
        typeof parsedYaml !== 'object' ||
        !parsedYaml.app_version
      ) {
        throw new Error(
          `app_version not found in '${filePath}' on branch '${branch}'.`,
        );
      }

      return parsedYaml.app_version as string;
    } catch (error: any) {
      this.logger.error(
        `Error retrieving app_version from branch '${branch}': ${error.message}`,
      );
      if (error instanceof HttpException) throw error;
      throw new BadGatewayException(
        `Error retrieving app_version from branch '${branch}': ${error.message}`,
      );
    }
  }

  /**
   * Retrieve a specific file from the root of a selected branch in the webtrit_phone repository.
   */
  async getFileFromBranch(branch: string, filePath: string): Promise<any> {
    const url = `${this.GITHUB_WEBTRIT_PHONE_URL}/contents/${encodeURIComponent(
      filePath,
    )}?ref=${encodeURIComponent(branch)}`;

    try {
      const res = await fetch(url, { headers: this.buildHeaders() });
      if (!res.ok) {
        const body = await safeText(res);
        throw new Error(
          `GET ${url} failed: ${res.status} ${res.statusText}${
            body ? ` - ${body}` : ''
          }`,
        );
      }
      // GitHub returns JSON with base64 `content` for file endpoints
      return await res.json();
    } catch (error: any) {
      this.logger.error(
        `Error fetching file '${filePath}' from branch '${branch}': ${error.message}`,
      );
      if (error instanceof HttpException) throw error;
      throw new BadGatewayException(
        `Error fetching file '${filePath}' from branch '${branch}': ${error.message}`,
      );
    }
  }
}

/** Helpers */
async function safeText(res: Response): Promise<string | null> {
  try {
    return await res.text();
  } catch {
    return null;
  }
}

async function safeJson(res: Response): Promise<any | null> {
  try {
    // Some endpoints (e.g., dispatch) return 204
    if (res.status === 204) return null;
    return await res.json();
  } catch {
    return null;
  }
}
