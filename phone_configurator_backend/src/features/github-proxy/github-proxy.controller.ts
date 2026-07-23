import {
  Controller,
  Post,
  Body,
  Get,
  Param,
  UseGuards,
  Query,
} from '@nestjs/common';
import { GithubProxyService } from './github-proxy.service';
import {
  ApiBearerAuth,
  ApiOperation,
  ApiQuery,
  ApiTags,
} from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';
import { Roles } from '../auth/guard/roles.decorator';

@ApiTags('github-proxy')
@Controller('github-proxy')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
@Roles('admin', 'user')
export class GithubProxyController {
  constructor(private readonly githubProxyService: GithubProxyService) {}

  @Post('dispatch-workflow')
  async dispatchWorkflow(@Body() inputs: any): Promise<any> {
    return this.githubProxyService.dispatchWorkflow(inputs);
  }

  @Get('workflow-runs')
  async getWorkflowRuns(): Promise<any> {
    return this.githubProxyService.getWorkflowRuns();
  }

  @Get('workflow-runs/:runId')
  async getWorkflowRunById(@Param('runId') runId: string): Promise<any> {
    return this.githubProxyService.getWorkflowRunById(runId);
  }

  @Get('workflow-runs/:runId/logs')
  async getWorkflowRunLogs(@Param('runId') runId: string): Promise<any> {
    return this.githubProxyService.getWorkflowRunLogs(runId);
  }

  @Get('phone-branches')
  async getPhoneBranches(): Promise<any> {
    return this.githubProxyService.getPhoneBranches();
  }

  @Get('app-version')
  @ApiOperation({
    summary: 'Get app_version from pubspec.yaml in a specified branch',
  })
  @ApiQuery({
    name: 'branch',
    type: String,
    description: 'Name of the branch to fetch app_version from',
    required: true,
  })
  async getAppVersion(
    @Query('branch') branch: string,
  ): Promise<{ app_version: string }> {
    const appVersion = await this.githubProxyService.getAppVersion(branch);
    return { app_version: appVersion };
  }
}
