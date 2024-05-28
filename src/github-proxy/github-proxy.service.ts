import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import axios from 'axios';

@Injectable()
export class GithubProxyService {
  private readonly logger = new Logger(GithubProxyService.name);
  private readonly GITHUB_API_BASE_URL = 'https://api.github.com/repos/WebTrit/webtrit_phone_builder/actions';
  private readonly HEADERS = {
    'Accept': 'application/vnd.github+json',
    'Authorization': `Bearer ${this.configService.get<string>('GITHUB_TOKEN')}`,
    'X-GitHub-Api-Version': '2022-11-28',
    'Content-Type': 'application/json',
  };

  constructor(private readonly configService: ConfigService) {
    this.HEADERS['Authorization'] = `Bearer ${this.configService.get<string>('GITHUB_TOKEN')}`;
  }

  async dispatchWorkflow(inputs: any): Promise<any> {
    const url = `${this.GITHUB_API_BASE_URL}/workflows/build_phone.yml/dispatches`;
    const data = { ref: 'main', inputs };

    try {
      const response = await axios.post(url, data, { headers: this.HEADERS });
      return response.data || { message: 'Workflow dispatched successfully', status: response.status };
    } catch (error) {
      this.logger.error(`Error dispatching workflow: ${error.message}`);
      if (error.response) {
        this.logger.error(`Error response data: ${JSON.stringify(error.response.data)}`);
      }
      throw new Error(`Error dispatching workflow: ${error.message}`);
    }
  }

  async getWorkflowRuns(): Promise<any> {
    const url = `${this.GITHUB_API_BASE_URL}/workflows/build_phone.yml/runs`;

    try {
      const response = await axios.get(url, { headers: this.HEADERS });
      return response.data;
    } catch (error) {
      this.logger.error(`Error fetching workflow runs: ${error.message}`);
      if (error.response) {
        this.logger.error(`Error response data: ${JSON.stringify(error.response.data)}`);
      }
      throw new Error(`Error fetching workflow runs: ${error.message}`);
    }
  }

  async getWorkflowRunById(runId: string): Promise<any> {
    const url = `${this.GITHUB_API_BASE_URL}/runs/${runId}`;

    try {
      const response = await axios.get(url, { headers: this.HEADERS });
      return response.data;
    } catch (error) {
      this.logger.error(`Error fetching workflow run by ID: ${error.message}`);
      if (error.response) {
        this.logger.error(`Error response data: ${JSON.stringify(error.response.data)}`);
      }
      throw new Error(`Error fetching workflow run by ID: ${error.message}`);
    }
  }

  async getWorkflowRunLogs(runId: string): Promise<any> {
    const url = `${this.GITHUB_API_BASE_URL}/runs/${runId}/logs`;

    try {
      const response = await axios.get(url, { headers: this.HEADERS });
      return response.data;
    } catch (error) {
      this.logger.error(`Error fetching workflow run logs: ${error.message}`);
      if (error.response) {
        this.logger.error(`Error response data: ${JSON.stringify(error.response.data)}`);
      }
      throw new Error(`Error fetching workflow run logs: ${error.message}`);
    }
  }
}
