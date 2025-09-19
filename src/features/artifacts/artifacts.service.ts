import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';

import { Artifact } from './entities';
import { CreateArtifactDto } from './dto/create-artifact.dto';
import { UpdateArtifactDto } from './dto/update-artifact.dto';

import { AssetsService } from '../assets/assets.service';
import { OwnedRepoGuard, FileArtifactFactory } from '../../common';
import { CloudStorageService } from '../common/storage/cloud-storage.service';
import { LinkRef, RefLinksService } from '../common/refs/ref-links.service';
import { nowIso, UploadNamespaces } from '../../common';

type WithUrl<T> = T & { downloadUrl?: string };
type FindOpts = { includeUrl?: boolean; urlTtlSec?: number; kind?: string };

/**
 * ArtifactsService
 *
 * Responsibilities:
 * - List/read artifacts (optionally with short-lived signed URLs).
 * - Create artifacts either from an existing Storage object or by uploading bytes.
 * - Maintain reverse links to sources (e.g., assets) and usedBy links for dependents.
 * - Delete artifacts + storage objects and keep reference counters in sync.
 */
@Injectable()
export class ArtifactsService {
  private readonly guard: OwnedRepoGuard<Artifact>;

  constructor(
    @InjectRepository(Artifact)
    private readonly repo: BaseFirestoreRepository<Artifact>,
    private readonly cloud: CloudStorageService,
    private readonly assetsService: AssetsService, // for inc/dec refs on source assets
    private readonly refs: RefLinksService, // for usedBy references to this artifact
    private readonly files: FileArtifactFactory, // unified upload + checksum + path builder
  ) {
    this.guard = new OwnedRepoGuard<Artifact>(this.repo);
  }

  /**
   * List artifacts for a specific theme (optionally filter by kind).
   * Can also attach signed URLs for direct download.
   */
  async findAll(
    uid: string,
    applicationId: string,
    themeId: string,
    opts: FindOpts = {},
  ): Promise<Array<WithUrl<Artifact>>> {
    let query = this.repo
      .whereEqualTo('ownerId', uid)
      .whereEqualTo('applicationId', applicationId)
      .whereEqualTo('themeId', themeId);

    if (opts.kind) query = query.whereEqualTo('kind', opts.kind);

    const items = await query.find();
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
   * Read a single artifact (optionally include a signed URL).
   */
  async findOne(
    uid: string,
    id: string,
    opts: FindOpts = {},
  ): Promise<WithUrl<Artifact>> {
    const it = await this.guard.getOwned(id, uid);
    if (!opts.includeUrl) return it;

    const ttl = opts.urlTtlSec ?? 3600;
    const url = it.storagePath
      ? await this.getSignedUrl(it, ttl).catch(() => undefined)
      : undefined;
    return { ...it, downloadUrl: url };
  }

  /**
   * Create an artifact record when the Storage object is already present.
   * If you need to upload bytes first, use `uploadAndCreate` instead.
   */
  async create(uid: string, dto: CreateArtifactDto): Promise<Artifact> {
    if (!dto.storagePath) {
      throw new BadRequestException(
        'storagePath is required (or use the upload endpoint)',
      );
    }

    const now = nowIso();
    // FireORM will generate an ID if omitted (Partial<Artifact>)
    const artifact: Partial<Artifact> = {
      ownerId: uid,
      applicationId: dto.applicationId,
      themeId: dto.themeId,
      kind: dto.kind,
      sources: dto.sources ?? [],
      storagePath: dto.storagePath,
      mimeType: dto.mimeType || 'application/octet-stream',
      size: dto.size ?? 0,
      checksum: dto.checksum ?? null,
      createdAt: now,
      updatedAt: now,
      refCount: 0,
      usedBy: [],
    };

    await this.touchSourceRefs(
      uid,
      artifact as Pick<Artifact, 'id' | 'sources'>,
      'inc',
    );
    return this.repo.create(artifact as Artifact);
  }

  async uploadAndCreate(
    uid: string,
    applicationId: string,
    themeId: string,
    kind: string,
    file: Express.Multer.File,
    sources: Array<{ type: string; id: string }> = [],
  ): Promise<Artifact> {
    if (!file?.buffer?.length)
      throw new BadRequestException('Empty file buffer');

    const built = await this.files.upload(
      {
        uid,
        applicationId,
        themeId,
        namespace: UploadNamespaces.applicationAssetsRenditions,
        kind,
      },
      { file, idPrefix: UploadNamespaces.applicationAssetsRenditions },
    );

    const now = nowIso();
    const artifact: Artifact = {
      id: built.id,
      ownerId: uid,
      applicationId,
      themeId,
      kind,
      sources,
      storagePath: built.storagePath,
      mimeType: built.mimeType,
      size: built.size,
      checksum: built.checksum ?? null,
      createdAt: now,
      updatedAt: now,
      refCount: 0,
      usedBy: [],
    };

    await this.touchSourceRefs(uid, artifact, 'inc');
    await this.repo.create(artifact);
    return artifact;
  }

  /**
   * Update artifact metadata (including usedBy via DTO if needed).
   */
  async update(
    uid: string,
    id: string,
    dto: UpdateArtifactDto,
  ): Promise<Artifact> {
    const it = await this.guard.getOwned(id, uid);
    Object.assign(it, dto, { updatedAt: nowIso() });
    await this.repo.update(it);
    return it as Artifact;
  }

  /**
   * Delete artifact and its Storage object, then decrement refs for its sources.
   */
  async remove(uid: string, id: string): Promise<void> {
    const it = await this.guard.getOwned(id, uid);

    if (it.storagePath) {
      try {
        await this.cloud.delete(it.storagePath);
      } catch {
        // best-effort: ignore Storage deletion errors, proceed with DB cleanup
      }
    }

    await this.touchSourceRefs(uid, it, 'dec');
    await this.repo.delete(it.id);
  }

  /**
   * Mint a signed URL for the artifact's storage object.
   */
  async getSignedUrl(artifact: Artifact, expiresInSec = 3600): Promise<string> {
    if (!artifact.storagePath)
      throw new NotFoundException('Artifact has no storagePath');
    return this.cloud.getSignedUrl(artifact.storagePath, {
      ttlSec: expiresInSec,
    });
  }

  /**
   * Mark this artifact as used by a consumer (adds usedBy link).
   */
  async linkUsedBy(uid: string, id: string, link: LinkRef): Promise<Artifact> {
    const it = await this.guard.getOwned(id, uid);
    await this.refs.link(this.repo, it, link);
    return it;
  }

  /**
   * Remove a usedBy link.
   */
  async unlinkUsedBy(
    uid: string,
    id: string,
    link: LinkRef,
  ): Promise<Artifact> {
    const it = await this.guard.getOwned(id, uid);
    await this.refs.unlink(this.repo, it, link);
    return it;
  }

  /**
   * Increment / decrement reference counters on sources used to produce the artifact.
   * Currently supports l.type === 'asset' (delegates to AssetsService).
   * Extend with more types as needed (embed, feature, etc.).
   */
  private async touchSourceRefs(
    uid: string,
    it: Pick<Artifact, 'id' | 'sources'>,
    op: 'inc' | 'dec',
  ) {
    const links = it.sources ?? [];
    await Promise.all(
      links.map(async (l) => {
        if (l.type === 'asset') {
          const dep: LinkRef = { type: 'artifact', id: it.id };
          if (op === 'inc') {
            await this.assetsService.incrementRef(uid, l.id, dep);
          } else {
            await this.assetsService.decrementRef(uid, l.id, dep);
          }
        }
        // TODO: handle other source types (embed, feature, ...)
      }),
    );
  }
}
