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
import { CurrentUser, Principal } from '../../../auth/current-user.decorator';

@ApiTags('feature-access')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
@Controller('applications/:applicationId/feature-access')
export class FeatureAccessController {
  constructor(private readonly service: FeatureAccessService) {}

  @Get()
  list(@CurrentUser() user: Principal, @Param('applicationId') appId: string) {
    return this.service.list(user.uid, appId);
  }

  @Get('by-theme/:themeId')
  getByTheme(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
  ) {
    return this.service.getByTheme(user.uid, appId, themeId);
  }

  @Put('by-theme/:themeId')
  upsertByTheme(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @Body() dto: UpsertFeatureAccessDto,
  ) {
    return this.service.upsertByTheme(user.uid, appId, themeId, {
      status: dto.status,
      config: dto.config,
      expectedVersion: dto.expectedVersion,
    });
  }

  @Delete('by-theme/:themeId')
  deleteByTheme(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
  ) {
    return this.service.deleteByTheme(user.uid, appId, themeId);
  }
}
