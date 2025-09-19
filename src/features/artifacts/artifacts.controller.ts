import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';
import { ApiBearerAuth, ApiQuery } from '@nestjs/swagger';
import { ArtifactsService } from './artifacts.service';
import { CreateArtifactDto } from './dto/create-artifact.dto';
import { UpdateArtifactDto } from './dto/update-artifact.dto';
import {
  CloudFileUpload,
  CloudFormFields,
  UploadedCloudFile,
} from '../../common/interceptors/deco';
import { CloudFile } from '../../common/interceptors/cloud-functions-multipart.interceptor';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';

@Controller('applications/:applicationId/themes/:themeId/artifacts')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
export class ArtifactsController {
  constructor(private readonly service: ArtifactsService) {}

  /** List artifacts for a theme (optionally by kind) */
  @Get()
  @ApiQuery({ name: 'includeUrl', required: false, type: Boolean })
  @ApiQuery({ name: 'urlTtlSec', required: false, type: Number })
  @ApiQuery({ name: 'kind', required: false, type: String })
  list(
    @Req() req: any,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @Query('includeUrl') includeUrl?: string,
    @Query('urlTtlSec') urlTtlSec?: string,
    @Query('kind') kind?: string,
  ) {
    const uid = req.user.uid as string;
    return this.service.findAll(uid, appId, themeId, {
      includeUrl: includeUrl === 'true',
      urlTtlSec: urlTtlSec ? Number(urlTtlSec) : undefined,
      kind,
    });
  }

  /** Get single artifact (with optional signed URL) */
  @Get(':id')
  @ApiQuery({ name: 'includeUrl', required: false, type: Boolean })
  @ApiQuery({ name: 'urlTtlSec', required: false, type: Number })
  getOne(
    @Req() req: any,
    @Param('id') id: string,
    @Query('includeUrl') includeUrl?: string,
    @Query('urlTtlSec') urlTtlSec?: string,
  ) {
    const uid = req.user.uid as string;
    return this.service.findOne(uid, id, {
      includeUrl: includeUrl === 'true',
      urlTtlSec: urlTtlSec ? Number(urlTtlSec) : undefined,
    });
  }

  /** Create from known storagePath (rarely used; prefer upload) */
  @Post()
  create(
    @Req() req: any,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @Body() dto: CreateArtifactDto,
  ) {
    const uid = req.user.uid as string;
    dto.applicationId = appId;
    dto.themeId = themeId;
    return this.service.create(uid, dto);
  }

  /** Upload bytes and create artifact document */
  @Post('upload')
  @CloudFileUpload('file')
  async upload(
    @Req() req: any,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @UploadedCloudFile() file: CloudFile,
    @CloudFormFields() fields: Record<string, string>,
  ) {
    const uid = req.user.uid as string;
    if (!file) throw new Error('file is required');
    const kind = fields['kind'] || 'generic';

    const sources = fields['sources'] ? JSON.parse(fields['sources']) : [];

    return this.service.uploadAndCreate(
      uid,
      appId,
      themeId,
      kind,
      file as any,
      sources,
    );
  }

  /** Update basic meta (rarely needed) */
  @Post(':id')
  update(
    @Req() req: any,
    @Param('id') id: string,
    @Body() dto: UpdateArtifactDto,
  ) {
    const uid = req.user.uid as string;
    return this.service.update(uid, id, dto);
  }

  /** Delete artifact + file + decrement refs on sources */
  @Delete(':id')
  remove(@Req() req: any, @Param('id') id: string) {
    const uid = req.user.uid as string;
    return this.service.remove(uid, id);
  }
}
