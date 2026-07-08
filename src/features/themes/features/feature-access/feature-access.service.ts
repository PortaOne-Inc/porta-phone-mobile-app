import {
  ConflictException,
  Injectable,
  Logger,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';

import {
  FeatureAccess,
  FeatureAccessStatus,
} from './entities/feature-access.entity';
import { deepMerge, nowIso } from '../../../../common';
import { OwnershipService } from '../../../../common/data/ownership.service';

@Injectable()
export class FeatureAccessService {
  private readonly logger = new Logger(FeatureAccessService.name);

  constructor(
    @InjectRepository(FeatureAccess)
    private readonly repo: BaseFirestoreRepository<FeatureAccess>,
    private readonly ownership: OwnershipService,
  ) {}

  async getByTheme(
    uid: string,
    applicationId: string,
    themeId: string,
  ): Promise<FeatureAccess> {
    await this.ownership.assertOwnsApplication(uid, applicationId);
    const list = await this.repo
      .whereEqualTo('applicationId', applicationId)
      .whereEqualTo('themeId', themeId)
      .find();

    if (!list.length) throw new NotFoundException('FeatureAccess not found');
    return list[0];
  }

  async upsertByTheme(
    uid: string,
    applicationId: string,
    themeId: string,
    dto: {
      status?: FeatureAccessStatus;
      config?: Record<string, any>;
      expectedVersion?: number;
    },
  ): Promise<FeatureAccess> {
    await this.ownership.assertOwnsTheme(uid, applicationId, themeId);
    const existing = await this.repo
      .whereEqualTo('applicationId', applicationId)
      .whereEqualTo('themeId', themeId)
      .find();

    const now = nowIso();

    if (existing.length) {
      const it = existing[0];

      if (
        typeof dto.expectedVersion === 'number' &&
        dto.expectedVersion !== (it.version ?? 0)
      ) {
        throw new ConflictException(
          `Version mismatch: expected ${dto.expectedVersion}, actual ${
            it.version ?? 0
          }`,
        );
      }

      if (dto.status) it.status = dto.status;

      if (dto.config && Object.keys(dto.config).length > 0) {
        it.config = deepMerge(it.config ?? {}, dto.config);
      }

      it.version = (it.version ?? 0) + 1;
      it.updatedAt = now;
      const result = await this.repo.update(it);

      return result;
    }

    const created: FeatureAccess = {
      id: themeId,
      applicationId,
      themeId,
      status: dto.status ?? 'draft',
      config: dto.config ?? {},
      version: 1,
      createdAt: now,
      updatedAt: now,
    };
    const result = await this.repo.create(created);

    return result;
  }

  async deleteByTheme(
    uid: string,
    applicationId: string,
    themeId: string,
  ): Promise<void> {
    await this.ownership.assertOwnsTheme(uid, applicationId, themeId);
    const it = await this.getByTheme(uid, applicationId, themeId);
    await this.repo.delete(it.id);
  }

  async list(uid: string, applicationId: string): Promise<FeatureAccess[]> {
    await this.ownership.assertOwnsApplication(uid, applicationId);
    return this.repo.whereEqualTo('applicationId', applicationId).find();
  }
}
