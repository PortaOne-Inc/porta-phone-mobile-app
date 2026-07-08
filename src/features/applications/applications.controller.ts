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
  UseGuards,
} from '@nestjs/common';
import { ApplicationsService } from './applications.service';
import { Application } from './entities/application';
import { Roles } from '../auth/guard/roles.decorator';
import { CurrentUser, Principal } from '../auth/current-user.decorator';
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
    @CurrentUser() user: Principal,
    @Body() applicationDto: Application,
  ): Promise<Application | null> {
    const newApplication = await this.applicationsService.createApplication(
      user.uid,
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
  async listApplications(
    @CurrentUser() user: Principal,
  ): Promise<Application[] | null> {
    const applications = await this.applicationsService.listApplications(
      user.uid,
    );
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
    @CurrentUser() user: Principal,
    @Param('id') id: string,
  ): Promise<Application | null> {
    return this.applicationsService.findApplicationById(user.uid, id);
  }

  @Put(':id')
  async updateApplication(
    @CurrentUser() user: Principal,
    @Param('id') id: string,
    @Body() applicationDto: Application,
  ): Promise<Application | null> {
    const updatedApplication = await this.applicationsService.updateApplication(
      user.uid,
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
    @CurrentUser() user: Principal,
    @Param('id') id: string,
  ): Promise<void | null> {
    const themes = await this.themesService
      .getThemesByApplicationId(id, user.uid)
      .catch(() => []);
    for (const t of themes ?? []) {
      await this.themesService
        .deleteTheme(user.uid, id, (t as any).id, { purgeOrphanAssets: true })
        .catch(() => undefined);
    }

    await this.applicationsService.removeApplication(user.uid, id);
  }

  @Get(':id/environment')
  async getApplicationEnvironment(
    @CurrentUser() user: Principal,
    @Param('id') id: string,
  ): Promise<Record<string, string | boolean | number> | null> {
    return this.applicationsService.getApplicationEnvironment(user.uid, id);
  }

  @Put(':id/environment')
  async updateApplicationEnvironment(
    @CurrentUser() user: Principal,
    @Param('id') id: string,
    @Body() environmentData: Record<string, string | boolean | number>,
  ): Promise<Application | null> {
    const updatedApplication =
      await this.applicationsService.updateApplicationEnvironment(
        user.uid,
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
    @CurrentUser() user: Principal,
    @Param('id') appId: string,
    @Body() dto: UpdateThemeBindingsDto,
  ) {
    return this.applicationsService.updateThemeBindings(user.uid, appId, dto);
  }

  @Get(':id/resolve-theme')
  async resolveTheme(
    @CurrentUser() user: Principal,
    @Param('id') appId: string,
    @Query() query: ResolveThemeQueryDto,
  ) {
    return this.applicationsService.resolveThemeIdForBuild(
      user.uid,
      appId,
      query.env,
    );
  }
}
