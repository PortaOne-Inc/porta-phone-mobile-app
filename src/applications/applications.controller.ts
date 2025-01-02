import {
  Body,
  Controller,
  Delete,
  Get,
  HttpException,
  HttpStatus,
  Param,
  Post,
  Put,
  UseGuards,
} from '@nestjs/common';
import { ApplicationsService } from './applications.service';
import { Application } from '../common/entities/application/application';
import { Roles } from '../auth/guard/roles.decorator';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard'; // Adjust path as needed

@ApiTags('applications')
@Controller('applications')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
@Roles('admin', 'user')
export class ApplicationsController {
  constructor(private readonly applicationsService: ApplicationsService) {}

  @Post()
  async createApplication(
    @Body() applicationDto: Application,
  ): Promise<Application | null> {
    const newApplication =
      await this.applicationsService.createApplication(applicationDto);
    if (!newApplication) {
      throw new HttpException(
        'Failed to create application',
        HttpStatus.BAD_REQUEST,
      );
    }
    return newApplication;
  }

  @Get(':id')
  async findApplicationById(
    @Param('id') id: string,
  ): Promise<Application | null> {
    const application = await this.applicationsService.findApplicationById(id);
    if (!application) {
      throw new HttpException('Application not found', HttpStatus.NOT_FOUND);
    }
    return application;
  }

  @Put(':id')
  async updateApplication(
    @Param('id') id: string,
    @Body() applicationDto: Application,
  ): Promise<Application | null> {
    const updatedApplication = await this.applicationsService.updateApplication(
      id,
      applicationDto,
    );
    if (!updatedApplication) {
      throw new HttpException(
        'Failed to update application',
        HttpStatus.NOT_FOUND,
      );
    }
    return updatedApplication;
  }

  @Delete(':id')
  @Roles('admin', 'user')
  async removeApplication(@Param('id') id: string): Promise<void | null> {
    await this.applicationsService.removeApplication(id);
  }

  @Get()
  async listApplications(): Promise<Application[] | null> {
    const applications = await this.applicationsService.listApplications();
    if (!applications) {
      throw new HttpException(
        'Failed to list applications',
        HttpStatus.BAD_REQUEST,
      );
    }
    return applications;
  }
}
