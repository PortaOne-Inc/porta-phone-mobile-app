import { ForbiddenException, Injectable } from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';

import { EmbeddedResource } from './entities/embed.entity';
import { CreateEmbeddedDto } from './dto/create-embed.dto';
import { UpdateEmbeddedDto } from './dto/update-embed.dto';
import { LinkRef, RefLinksService } from '../common';
import { nowIso, OwnedRepoGuard } from '../../common';

/**
 * EmbedsService
 *
 * Responsibilities:
 * - CRUD for embedded resources with ownership checks.
 * - Maintain usedBy/refCount via RefLinksService.
 */
@Injectable()
export class EmbedsService {
  private readonly guard: OwnedRepoGuard<EmbeddedResource>;

  constructor(
    @InjectRepository(EmbeddedResource)
    private readonly repo: BaseFirestoreRepository<EmbeddedResource>,
    private readonly refs: RefLinksService,
  ) {
    this.guard = new OwnedRepoGuard<EmbeddedResource>(this.repo);
  }

  /**
   * Create an embedded resource row.
   */
  async create(uid: string, dto: CreateEmbeddedDto): Promise<EmbeddedResource> {
    const now = nowIso();

    const doc: Partial<EmbeddedResource> = {
      ownerId: uid,
      applicationId: dto.applicationId!,
      uri: dto.uri,
      type: dto.type,
      attributes: dto.attributes ?? {},
      metadata: dto.metadata ?? { attributes: {} },
      payload: dto.payload ?? [],
      enableConsoleLogCapture: !!dto.enableConsoleLogCapture,
      reconnectStrategy: dto.reconnectStrategy ?? null,
      createdAt: now,
      updatedAt: now,
      refCount: 0,
      usedBy: [],
    };

    return this.repo.create(doc as EmbeddedResource);
  }

  /**
   * List all embeds for an application (ownership-checked).
   */
  async findAll(
    uid: string,
    applicationId: string,
  ): Promise<EmbeddedResource[]> {
    return this.guard.listByOwner(uid, { applicationId });
  }

  /**
   * Get one embed (ownership-checked).
   */
  async findOne(uid: string, id: string): Promise<EmbeddedResource> {
    return this.guard.getOwned(id, uid);
  }

  /**
   * Patch embed metadata/payload.
   */
  async update(
    uid: string,
    id: string,
    dto: UpdateEmbeddedDto,
  ): Promise<EmbeddedResource> {
    const item = await this.guard.getOwned(id, uid);
    Object.assign(item, dto, { updatedAt: nowIso() });
    await this.repo.update(item);
    return item;
  }

  /**
   * Delete an embed.
   */
  async remove(uid: string, id: string): Promise<void> {
    const item = await this.guard.getOwned(id, uid);
    if ((item.refCount ?? 0) > 0) {
      throw new ForbiddenException(
        'Embedded resource is in use (refCount > 0)',
      );
    }
    await this.repo.delete(item.id);
  }

  /**
   * Link this embed as "used by" another entity (delegates to RefLinksService).
   */
  async link(uid: string, id: string, link: LinkRef) {
    const item = await this.guard.getOwned(id, uid);
    await this.refs.link(this.repo, item, link);
    return item;
  }

  /**
   * Unlink this embed from a dependent entity (delegates to RefLinksService).
   */
  async unlink(uid: string, id: string, link: LinkRef) {
    const item = await this.guard.getOwned(id, uid);
    await this.refs.unlink(this.repo, item, link);
    return item;
  }
}
