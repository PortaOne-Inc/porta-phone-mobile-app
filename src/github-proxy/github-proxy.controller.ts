import {
  Controller,
  Post,
  Body,
  HttpException,
  HttpStatus,
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
    try {
      return await this.githubProxyService.dispatchWorkflow(inputs);
    } catch (error) {
      throw new HttpException(
        { message: error.message, status: HttpStatus.INTERNAL_SERVER_ERROR },
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  @Get('workflow-runs')
  async getWorkflowRuns(): Promise<any> {
    try {
      return await this.githubProxyService.getWorkflowRuns();
    } catch (error) {
      throw new HttpException(
        { message: error.message, status: HttpStatus.INTERNAL_SERVER_ERROR },
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  @Get('workflow-runs/:runId')
  async getWorkflowRunById(@Param('runId') runId: string): Promise<any> {
    try {
      return await this.githubProxyService.getWorkflowRunById(runId);
    } catch (error) {
      throw new HttpException(
        { message: error.message, status: HttpStatus.INTERNAL_SERVER_ERROR },
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  @Get('workflow-runs/:runId/logs')
  async getWorkflowRunLogs(@Param('runId') runId: string): Promise<any> {
    try {
      return await this.githubProxyService.getWorkflowRunLogs(runId);
    } catch (error) {
      throw new HttpException(
        { message: error.message, status: HttpStatus.INTERNAL_SERVER_ERROR },
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  @Get('phone-branches')
  async getPhoneBranches(): Promise<any> {
    try {
      return await this.githubProxyService.getPhoneBranches();
    } catch (error) {
      throw new HttpException(
        { message: error.message, status: HttpStatus.INTERNAL_SERVER_ERROR },
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
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
    // Input validation
    if (!branch) {
      throw new HttpException(
        {
          message: 'The branch query parameter is required.',
          status: HttpStatus.BAD_REQUEST,
        },
        HttpStatus.BAD_REQUEST,
      );
    }

    try {
      const appVersion = await this.githubProxyService.getAppVersion(branch);
      return { app_version: appVersion };
    } catch (error) {
      throw new HttpException(
        { message: error.message, status: HttpStatus.INTERNAL_SERVER_ERROR },
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }
}
