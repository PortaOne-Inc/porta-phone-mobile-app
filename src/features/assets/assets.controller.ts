import {
  Controller,
  Get,
  Post,
  Patch,
  Delete,
  Body,
  Param,
  Query,
  Req,
  UseGuards,
  BadRequestException,
} from '@nestjs/common';

import { AssetsService } from './assets.service';
import { CreateAssetDto } from './dto/create-asset.dto';
import { UpdateAssetDto } from './dto/update-asset.dto';
import { LinkAssetDto } from './dto/link-asset.dto';

import { ApiBearerAuth } from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';
import {
  CloudFileUpload,
  CloudFormFields,
  UploadedCloudFile,
} from '../../common/interceptors/deco';
import { CloudFile } from '../../common/interceptors/cloud-functions-multipart.interceptor';

@Controller('applications/:applicationId/assets')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
export class AssetsController {
  constructor(private readonly assetsService: AssetsService) {}

  /** Create an asset for the given application */
  @Post()
  create(
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @Body() dto: CreateAssetDto,
  ) {
    const uid: string = req.user.uid;
    dto.applicationId = applicationId;
    return this.assetsService.create(uid, dto);
  }

  /** List assets for the given application (you can extend with pagination later) */
  @Get()
  findAll(
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @Query('includeUrl') includeUrl?: string,
    @Query('urlTtlSec') urlTtlSec?: string,
  ) {
    const uid: string = req.user.uid;
    const wantUrl = (includeUrl ?? '').toLowerCase() === 'true';
    const ttl = Number.isFinite(Number(urlTtlSec))
      ? parseInt(urlTtlSec!, 10)
      : undefined;

    return this.assetsService.findAll(uid, applicationId, {
      includeUrl: wantUrl,
      urlTtlSec: ttl,
    });
  }

  /** Get a single asset by id (ownership is checked in the service) */
  @Get(':id')
  findOne(
    @Req() req: any,
    @Param('id') id: string,
    @Query('includeUrl') includeUrl?: string,
    @Query('urlTtlSec') urlTtlSec?: string,
  ) {
    const uid: string = req.user.uid;
    const wantUrl = (includeUrl ?? '').toLowerCase() === 'true';
    const ttl = Number.isFinite(Number(urlTtlSec))
      ? parseInt(urlTtlSec!, 10)
      : undefined;

    return this.assetsService.findOne(uid, id, {
      includeUrl: wantUrl,
      urlTtlSec: ttl,
    });
  }

  /** Update asset metadata (e.g., checksum) */
  @Patch(':id')
  update(
    @Req() req: any,
    @Param('id') id: string,
    @Body() dto: UpdateAssetDto,
  ) {
    const uid: string = req.user.uid;
    return this.assetsService.update(uid, id, dto);
  }

  /** Delete asset and its underlying file in Storage */
  @Delete(':id')
  remove(@Req() req: any, @Param('id') id: string) {
    const uid: string = req.user.uid;
    return this.assetsService.remove(uid, id);
  }

  /** Link asset to a component (increments refCount) */
  @Post(':id/link')
  link(@Req() req: any, @Param('id') id: string, @Body() body: LinkAssetDto) {
    const uid: string = req.user.uid;
    return this.assetsService.incrementRef(uid, id, body);
  }

  /** Unlink asset from a component (decrements refCount) */
  @Post(':id/unlink')
  unlink(@Req() req: any, @Param('id') id: string, @Body() body: LinkAssetDto) {
    const uid: string = req.user.uid;
    return this.assetsService.decrementRef(uid, id, body);
  }

  /** Get a short-lived signed URL for downloading/previewing the asset */
  @Get(':id/url')
  async getDownloadUrl(@Req() req: any, @Param('id') id: string) {
    const uid: string = req.user.uid;
    const asset = await this.assetsService.findOne(uid, id);
    const url = await this.assetsService.getSignedUrl(asset);
    return { url };
  }

  @Post('upload')
  @CloudFileUpload('file')
  async upload(
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @UploadedCloudFile() file: CloudFile,
    @CloudFormFields() fields: Record<string, string>,
  ) {
    if (!file) throw new BadRequestException('file is required');
    const uid: string = req.user.uid;
    return this.assetsService.uploadAndCreate(uid, applicationId, {
      buffer: file.buffer,
      originalname: file.originalname,
      mimetype: file.mimetype,
      size: file.size,
    } as any);
  }
}
