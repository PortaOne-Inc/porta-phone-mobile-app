import {
  Controller,
  Delete,
  Get,
  Param,
  Put,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';
import { ApiBearerAuth, ApiOkResponse, ApiQuery } from '@nestjs/swagger';
import { SplashAssetsService } from './splash-assets.service';
import {
  UpsertSplashAssetDto,
  UpsertSplashAssetSchema,
} from './dto/upsert-splash-asset.dto';
import { FirebaseAuthGuard } from '../../../auth/guard/firebase-auth.guard';
import {
  CloudAnyUpload,
  CloudFormFields,
  UploadedAnyFiles,
} from '../../../../common/interceptors/deco';
import { CloudFile } from '../../../../common/interceptors/cloud-functions-multipart.interceptor';
import { GetSplashAssetDto, GetSplashAssetZ } from './dto/get-splash-asset.zod';

@Controller('applications/:applicationId/themes/:themeId/splash-asset')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
export class SplashAssetsController {
  constructor(private readonly service: SplashAssetsService) {}

  @Get()
  @ApiQuery({ name: 'withValidation', required: false, type: Boolean })
  @ApiQuery({ name: 'includeUrl', required: false, type: Boolean })
  @ApiQuery({ name: 'urlTtlSec', required: false, type: Number })
  @ApiOkResponse({ type: GetSplashAssetDto })
  async get(
    @Req() req: any,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @Query('withValidation') withValidation?: string,
    @Query('includeUrl') includeUrl?: string,
    @Query('urlTtlSec') urlTtlSec?: string,
  ) {
    const uid: string = req.user.uid;

    const raw = await this.service.get(appId, themeId, {
      withValidation: withValidation === 'true',
      includeUrl: includeUrl === 'true',
      urlTtlSec: urlTtlSec ? Number(urlTtlSec) : undefined,
      uid,
    });

    const flat =
      'entity' in (raw as any)
        ? {
            ...(raw as any).entity,
            ...((raw as any).urls ? { urls: (raw as any).urls } : {}),
            ...((raw as any).validation
              ? { validation: (raw as any).validation }
              : {}),
            ...((raw as any).android12Validation
              ? { android12Validation: (raw as any).android12Validation }
              : {}),
          }
        : raw;

    return GetSplashAssetZ.parse(flat);
  }

  @Put('upload-batch')
  @CloudAnyUpload()
  async upsertWithUploadBatch(
    @Req() req: any,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @UploadedAnyFiles()
    files: Record<string, CloudFile[] | CloudFile | undefined>,
    @CloudFormFields() fields: Record<string, string>,
  ) {
    const uid: string = req.user.uid;
    console.log('files keys:', Object.keys(files ?? {}), 'fields:', fields);

    const targetsMap = fields['targets']
      ? (JSON.parse(fields['targets']) as Record<string, 'splash' | 'android12Splash'>)
      : {};
    const dtoRaw = fields['dto'];
    const dto: UpsertSplashAssetDto = dtoRaw
      ? UpsertSplashAssetSchema.parse(JSON.parse(dtoRaw))
      : {};
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
    @Req() req: any,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
  ) {
    const uid: string = req.user.uid;
    return this.service.remove(uid, appId, themeId);
  }

  @Get('constraints-defaults')
  getConstraintsDefaults() {
    return this.service.getConstraintsDefaults();
  }
}
