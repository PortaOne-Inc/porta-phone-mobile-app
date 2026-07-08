import {
  Body,
  Controller,
  Delete,
  Get,
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
import { ApiBearerAuth, ApiQuery, ApiTags } from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';
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
  constructor(private readonly applicationsService: ApplicationsService) {}

  @Post()
  async createApplication(
    @CurrentUser() user: Principal,
    @Body() applicationDto: Application,
  ): Promise<Application> {
    return this.applicationsService.createApplication(user.uid, applicationDto);
  }

  @Get()
  @Roles('admin', 'user')
  async listApplications(
    @CurrentUser() user: Principal,
  ): Promise<Application[]> {
    return this.applicationsService.listApplications(user.uid);
  }

  @Get(':id')
  async findApplicationById(
    @CurrentUser() user: Principal,
    @Param('id') id: string,
  ): Promise<Application> {
    return this.applicationsService.findApplicationById(user.uid, id);
  }

  @Put(':id')
  async updateApplication(
    @CurrentUser() user: Principal,
    @Param('id') id: string,
    @Body() applicationDto: Application,
  ): Promise<Application> {
    return this.applicationsService.updateApplication(
      user.uid,
      id,
      applicationDto,
    );
  }

  @Delete(':id')
  @Roles('admin', 'user')
  async removeApplication(
    @CurrentUser() user: Principal,
    @Param('id') id: string,
  ): Promise<void> {
    await this.applicationsService.removeApplication(user.uid, id);
  }

  @Get(':id/environment')
  async getApplicationEnvironment(
    @CurrentUser() user: Principal,
    @Param('id') id: string,
  ): Promise<Record<string, string | boolean | number>> {
    return this.applicationsService.getApplicationEnvironment(user.uid, id);
  }

  @Put(':id/environment')
  @ApiQuery({
    name: 'expectedVersion',
    type: Number,
    required: false,
    description: 'Optimistic-locking version guard',
  })
  async updateApplicationEnvironment(
    @CurrentUser() user: Principal,
    @Param('id') id: string,
    @Body() environmentData: Record<string, string | boolean | number>,
    @Query('expectedVersion') expectedVersion?: string,
  ): Promise<Application> {
    return this.applicationsService.updateApplicationEnvironment(
      user.uid,
      id,
      environmentData,
      expectedVersion !== undefined ? Number(expectedVersion) : undefined,
    );
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
