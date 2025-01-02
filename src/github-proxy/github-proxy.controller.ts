import {
  Controller,
  Post,
  Body,
  HttpException,
  HttpStatus,
  Get,
  Param,
  UseGuards,
} from '@nestjs/common';
import { GithubProxyService } from './github-proxy.service';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';
import { Roles } from '../auth/guard/roles.decorator';

@ApiTags('github-proxy')
@Controller('github-proxy')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
@Roles('admin', 'user')
export class GithubProxyController {
  constructor(private readonly githubProxyService: GithubProxyService) { }

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
}
