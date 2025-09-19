import {
  Body,
  Controller,
  Delete,
  Get,
  HttpException,
  HttpStatus,
  Param,
  Patch,
  Post,
  Put,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';
import { ApplicationsService } from './applications.service';
import { Application } from './entities/application';
import { Roles } from '../auth/guard/roles.decorator';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';
import { ThemesService } from '../themes/themes.service';
import {
  ResolveThemeQueryDto,
  UpdateThemeBindingsDto,
} from './dto/applications.dto';

@ApiTags('applications')
@Controller('applications')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
@Roles('admin', 'user')
export class ApplicationsController {
  constructor(
    private readonly applicationsService: ApplicationsService,
    private readonly themesService: ThemesService,
  ) {}

  @Post()
  async createApplication(
    @Req() request,
    @Body() applicationDto: Application,
  ): Promise<Application | null> {
    const userId = request.user.uid;
    const newApplication = await this.applicationsService.createApplication(
      userId,
      applicationDto,
    );
    if (!newApplication) {
      throw new HttpException(
        'Failed to create application',
        HttpStatus.BAD_REQUEST,
      );
    }
    return newApplication;
  }

  @Get()
  @Roles('admin', 'user')
  async listApplications(@Req() request): Promise<Application[] | null> {
    const userId = request.user.uid;
    const applications =
      await this.applicationsService.listApplications(userId);
    if (!applications) {
      throw new HttpException(
        'Failed to list applications',
        HttpStatus.BAD_REQUEST,
      );
    }
    return applications;
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
  async removeApplication(
    @Req() req,
    @Param('id') id: string,
  ): Promise<void | null> {
    const uid: string = req.user?.uid ?? '';
    const themes = await this.themesService
      .getThemesByApplicationId(id, uid)
      .catch(() => []);
    for (const t of themes ?? []) {
      await this.themesService
        .deleteTheme(uid, id, (t as any).id, { purgeOrphanAssets: true })
        .catch(() => undefined);
    }

    await this.applicationsService.removeApplication(id);
  }

  @Get(':id/environment')
  async getApplicationEnvironment(
    @Param('id') id: string,
  ): Promise<Record<string, string | boolean | number> | null> {
    const environment =
      await this.applicationsService.getApplicationEnvironment(id);
    if (!environment) {
      throw new HttpException(
        'Environment not found or application does not exist',
        HttpStatus.NOT_FOUND,
      );
    }
    return environment;
  }

  @Put(':id/environment')
  async updateApplicationEnvironment(
    @Param('id') id: string,
    @Body() environmentData: Record<string, string | boolean | number>,
  ): Promise<Application | null> {
    const updatedApplication =
      await this.applicationsService.updateApplicationEnvironment(
        id,
        environmentData,
      );
    if (!updatedApplication) {
      throw new HttpException(
        'Failed to update environment',
        HttpStatus.NOT_FOUND,
      );
    }
    return updatedApplication;
  }

  @Patch(':id/theme-bindings')
  async updateThemeBindings(
    @Param('id') appId: string,
    @Body() dto: UpdateThemeBindingsDto,
  ) {
    return this.applicationsService.updateThemeBindings(appId, dto);
  }

  @Get(':id/resolve-theme')
  async resolveTheme(
    @Param('id') appId: string,
    @Query() query: ResolveThemeQueryDto,
  ) {
    return this.applicationsService.resolveThemeIdForBuild(appId, query.env);
  }
}
