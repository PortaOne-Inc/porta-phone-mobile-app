import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';

import { CreateAssetDto } from './dto/create-asset.dto';
import { UpdateAssetDto } from './dto/update-asset.dto';
import { Asset } from './entities/asset.entity';

import { LinkRef, RefLinksService, CloudStorageService } from '../common';
import {
  OwnedRepoGuard,
  FileArtifactFactory,
  nowIso,
  UploadNamespaces,
} from '../../common';

type WithUrl<T> = T & { downloadUrl?: string };
type FindOpts = { includeUrl?: boolean; urlTtlSec?: number };

/**
 * AssetsService
 *
 * Responsibilities:
 * - CRUD for Asset documents (optionally returning short-lived signed URLs).
 * - Upload raw buffers via FileArtifactFactory and persist metadata.
 * - Track references (usedBy/refCount) through RefLinksService.
 */
@Injectable()
export class AssetsService {
  private readonly owned: OwnedRepoGuard<Asset>;

  constructor(
    @InjectRepository(Asset)
    private readonly assetRepository: BaseFirestoreRepository<Asset>,
    private readonly cloud: CloudStorageService,
    private readonly refs: RefLinksService,
    private readonly files: FileArtifactFactory,
  ) {
    this.owned = new OwnedRepoGuard<Asset>(this.assetRepository);
  }

  /**
   * Create a new asset document (metadata only; file is assumed to be in Storage).
   */
  async create(uid: string, dto: CreateAssetDto): Promise<Asset> {
    const now = nowIso();
    const asset: Partial<Asset> = {
      ownerId: uid,
      applicationId: dto.applicationId,
      storagePath: dto.storagePath,
      mimeType: dto.mimeType,
      size: dto.size,
      checksum: dto.checksum ?? null,
      createdAt: now,
      updatedAt: now,
      refCount: 0,
      usedBy: [],
    };
    return this.assetRepository.create(asset as Asset);
  }

  /**
   * List all user's assets for an app (optionally with short-lived URLs).
   */
  async findAll(
    uid: string,
    applicationId: string,
    opts: FindOpts = {},
  ): Promise<Array<WithUrl<Asset>>> {
    const items = await this.owned.listByOwner(uid, { applicationId });

    if (!opts.includeUrl) return items;

    const ttl = opts.urlTtlSec ?? 3600;
    return Promise.all(
      items.map(async (a) => {
        if (!a.storagePath) return a;
        const url = await this.getSignedUrl(a, ttl).catch(() => undefined);
        return { ...a, downloadUrl: url };
      }),
    );
  }

  /**
   * Get a single owned asset (optionally with a signed URL).
   */
  async findOne(
    uid: string,
    id: string,
    opts: FindOpts = {},
  ): Promise<WithUrl<Asset>> {
    const asset = await this.owned.getOwned(id, uid);
    if (!opts.includeUrl) return asset;

    const ttl = opts.urlTtlSec ?? 3600;
    const url = asset.storagePath
      ? await this.getSignedUrl(asset, ttl).catch(() => undefined)
      : undefined;
    return { ...asset, downloadUrl: url };
  }

  /**
   * Update asset metadata.
   */
  async update(uid: string, id: string, dto: UpdateAssetDto): Promise<Asset> {
    const asset = await this.owned.getOwned(id, uid);
    Object.assign(asset, dto, { updatedAt: nowIso() });
    await this.assetRepository.update(asset);
    return asset;
  }

  /**
   * Delete an asset (only when refCount === 0) and its Storage object.
   */
  async remove(uid: string, id: string): Promise<void> {
    const asset = await this.owned.getOwned(id, uid);

    if ((asset.refCount ?? 0) > 0) {
      throw new BadRequestException('Asset is in use (refCount > 0)');
    }

    if (asset.storagePath) {
      try {
        await this.cloud.delete(asset.storagePath);
      } catch {
        // best-effort; still delete the doc to avoid leaving stale records
      }
    }

    await this.assetRepository.delete(asset.id);
  }

  /**
   * Reference tracking (usedBy/refCount) via RefLinksService.
   */
  async incrementRef(uid: string, id: string, link: LinkRef) {
    const asset = await this.owned.getOwned(id, uid);
    await this.refs.link(this.assetRepository, asset, link);
  }

  async decrementRef(uid: string, id: string, link: LinkRef) {
    const asset = await this.owned.getOwned(id, uid);
    await this.refs.unlink(this.assetRepository, asset, link);
  }

  /**
   * Mint a GCS signed URL for this asset.
   */
  async getSignedUrl(asset: Asset, expiresInSec = 3600): Promise<string> {
    if (!asset.storagePath)
      throw new NotFoundException('Asset has no storagePath');
    return this.cloud.getSignedUrl(asset.storagePath, { ttlSec: expiresInSec });
  }

  async uploadAndCreate(
    uid: string,
    applicationId: string,
    file: Express.Multer.File,
  ): Promise<Asset> {
    if (!file?.buffer?.length)
      throw new BadRequestException('Empty file buffer');

    const built = await this.files.upload(
      { uid, applicationId, namespace: UploadNamespaces.applicationAssets },
      { file, idPrefix: UploadNamespaces.applicationAssets },
    );

    const now = nowIso();
    const asset: Asset = {
      id: built.id,
      ownerId: uid,
      applicationId,
      storagePath: built.storagePath,
      mimeType: built.mimeType,
      size: built.size,
      checksum: built.checksum ?? null,
      createdAt: now,
      updatedAt: now,
      refCount: 0,
      usedBy: [],
    };

    await this.assetRepository.create(asset);
    return asset;
  }

  /**
   * Handy: ownership check + signed URL.
   */
  async getSignedUrlById(
    uid: string,
    id: string,
    expiresInSec = 3600,
  ): Promise<string> {
    const asset = await this.owned.getOwned(id, uid);
    return this.getSignedUrl(asset, expiresInSec);
  }
}
