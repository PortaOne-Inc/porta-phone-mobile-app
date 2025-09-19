import { Injectable } from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';

import { PublicationResource } from './entities/publication-resource.entity';
import { CreatePublicationResourceDto } from './dto/create-publication-resource.dto';
import { UpdatePublicationResourceDto } from './dto/update-publication-resource.dto';
import { OwnedRepoGuard, nowIso } from '../../common';

/**
 * PublicationResourcesService
 *
 * Responsibilities:
 * - CRUD for publication resources with ownership checks.
 * - Uses OwnedRepoGuard to centralize owner scoping.
 */
@Injectable()
export class PublicationResourcesService {
  private readonly owned: OwnedRepoGuard<PublicationResource>;

  constructor(
    @InjectRepository(PublicationResource)
    private readonly repo: BaseFirestoreRepository<PublicationResource>,
  ) {
    this.owned = new OwnedRepoGuard<PublicationResource>(this.repo);
  }

  /**
   * Create a publication resource.
   */
  async create(
    uid: string,
    dto: CreatePublicationResourceDto,
  ): Promise<PublicationResource> {
    const now = nowIso();
    const item: Partial<PublicationResource> = {
      ownerId: uid,
      applicationId: dto.applicationId,
      title: dto.title,
      url: dto.url,
      note: dto.note,
      text: dto.text,
      createdAt: now,
      updatedAt: now,
    };
    return this.repo.create(item as PublicationResource);
  }

  /**
   * List all resources for an application (ownership-checked).
   */
  async findAll(
    uid: string,
    applicationId: string,
  ): Promise<PublicationResource[]> {
    return this.owned.listByOwner(uid, { applicationId });
  }

  /**
   * Get a single resource (ownership-checked).
   */
  async findOne(uid: string, id: string): Promise<PublicationResource> {
    return this.owned.getOwned(id, uid);
  }

  /**
   * Patch resource fields and bump updatedAt.
   */
  async update(
    uid: string,
    id: string,
    dto: UpdatePublicationResourceDto,
  ): Promise<PublicationResource> {
    const item = await this.owned.getOwned(id, uid);
    Object.assign(item, dto, { updatedAt: nowIso() });
    await this.repo.update(item);
    return item;
  }

  /**
   * Delete a resource.
   */
  async remove(uid: string, id: string): Promise<void> {
    const item = await this.owned.getOwned(id, uid);
    await this.repo.delete(item.id);
  }
}
