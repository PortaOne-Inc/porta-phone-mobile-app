import {
  BadRequestException,
  Controller,
  Delete,
  Get,
  Param,
  Put,
  Query,
  UseGuards,
} from '@nestjs/common';
import { ApiBearerAuth, ApiQuery } from '@nestjs/swagger';
import { z } from 'zod';

import { FirebaseAuthGuard } from '../../../auth/guard/firebase-auth.guard';
import { CurrentUser, Principal } from '../../../auth/current-user.decorator';
import { LaunchAssetsService, OutputTarget } from './launch-assets.service';

import {
  CloudAnyUpload,
  CloudFormFields,
  UploadedAnyFiles,
} from '../../../../common/interceptors/deco';
import { CloudFile } from '../../../../common/interceptors/cloud-functions-multipart.interceptor';
import {
  ConstraintsDefaults,
  UpsertLaunchAssets,
  UpsertLaunchAssetsSchema,
} from './dto/defaults.dto';

@Controller('applications/:applicationId/themes/:themeId/launch-assets')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
export class LaunchAssetsController {
  constructor(private readonly service: LaunchAssetsService) {}

  /** Get current config (with optional URLs + validation). */
  @Get()
  @ApiQuery({ name: 'includeUrl', required: false, type: Boolean })
  @ApiQuery({ name: 'urlTtlSec', required: false, type: Number })
  @ApiQuery({ name: 'withValidation', required: false, type: Boolean })
  get(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @Query('includeUrl') includeUrl?: string,
    @Query('urlTtlSec') urlTtlSec?: string,
    @Query('withValidation') withValidation?: string,
  ) {
    const uid = user.uid;
    return this.service.get(uid, appId, themeId, {
      includeUrl: includeUrl === 'true',
      urlTtlSec: urlTtlSec ? Number(urlTtlSec) : undefined,
      withValidation: withValidation === 'true',
    });
  }

  @Put('upload-batch')
  @CloudAnyUpload()
  async upsertWithUploadBatch(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @UploadedAnyFiles()
    files: Record<string, CloudFile[] | CloudFile | undefined>,
    @CloudFormFields() fields: Record<string, string>,
  ) {
    const uid = user.uid;

    const targetsMap = fields['targets']
      ? (JSON.parse(fields['targets']) as Record<string, OutputTarget>)
      : {};

    const dtoRaw = fields['dto'] ? JSON.parse(fields['dto']) : {};
    const dto: UpsertLaunchAssets = UpsertLaunchAssetsSchema.parse(dtoRaw);

    return this.service.upsertWithFiles(
      uid,
      appId,
      themeId,
      dto,
      files,
      targetsMap,
    );
  }

  /** Delete config (optionally cleaning up artifacts in service) */
  @Delete()
  remove(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
  ) {
    const uid = user.uid;
    return this.service.remove(uid, appId, themeId);
  }

  /** Public endpoint: shared platform constraints defaults */
  @Get('constraints-defaults')
  async getConstraintsDefaults(): Promise<ConstraintsDefaults> {
    return this.service.getConstraintsDefaults();
  }
}
