// src/features/feature-access/feature-access.controller.ts
import {
  Controller,
  Get,
  Put,
  Delete,
  Param,
  Body,
  UseGuards,
} from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { FeatureAccessService } from './feature-access.service';
import { UpsertFeatureAccessDto } from './dto/upsert-feature-access.dto';
import { FirebaseAuthGuard } from '../../../auth/guard/firebase-auth.guard';

@ApiTags('feature-access')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
@Controller('applications/:applicationId/feature-access')
export class FeatureAccessController {
  constructor(private readonly service: FeatureAccessService) {}

  @Get()
  list(@Param('applicationId') appId: string) {
    return this.service.list(appId);
  }

  @Get('by-theme/:themeId')
  getByTheme(
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
  ) {
    return this.service.getByTheme(appId, themeId);
  }

  @Put('by-theme/:themeId')
  upsertByTheme(
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @Body() dto: UpsertFeatureAccessDto,
  ) {
    return this.service.upsertByTheme(appId, themeId, {
      status: dto.status,
      config: dto.config,
      expectedVersion: dto.expectedVersion,
    });
  }

  @Delete('by-theme/:themeId')
  deleteByTheme(
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
  ) {
    return this.service.deleteByTheme(appId, themeId);
  }
}
