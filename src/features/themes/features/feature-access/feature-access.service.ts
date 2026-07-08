import {
  ConflictException,
  Injectable,
  Logger,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';
import * as admin from 'firebase-admin';

import {
  FeatureAccess,
  FeatureAccessStatus,
} from './entities/feature-access.entity';
import { Collections, deepMerge, nowIso } from '../../../../common';
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

    // New docs use themeId as the doc id, but LEGACY docs may live under a
    // random id (the delete flow queries by the themeId field), so resolve
    // the target doc before entering the transaction.
    const found = await this.repo
      .whereEqualTo('applicationId', applicationId)
      .whereEqualTo('themeId', themeId)
      .find();
    const resolvedId = found.length ? found[0].id : themeId;

    const now = nowIso();

    // Version check and write happen inside one transaction so concurrent
    // writers cannot interleave between the check and the set.
    const db = admin.firestore();
    const ref = db
      .collection(Collections.themeFeatureEntitlements)
      .doc(resolvedId);
    return db.runTransaction(async (tx) => {
      const snap = await tx.get(ref);
      if (snap.exists) {
        const existing = {
          ...(snap.data() as FeatureAccess),
          id: resolvedId,
        };
        if (existing.applicationId !== applicationId) {
          throw new NotFoundException('FeatureAccess not found');
        }
        if (
          typeof dto.expectedVersion === 'number' &&
          dto.expectedVersion !== (existing.version ?? 0)
        ) {
          throw new ConflictException(
            `Version mismatch: expected ${dto.expectedVersion}, actual ${
              existing.version ?? 0
            }`,
          );
        }

        if (dto.status) existing.status = dto.status;

        if (dto.config && Object.keys(dto.config).length > 0) {
          existing.config = deepMerge(existing.config ?? {}, dto.config);
        }

        existing.version = (existing.version ?? 0) + 1;
        existing.updatedAt = now;
        tx.set(ref, JSON.parse(JSON.stringify(existing)));
        return existing;
      }

      const created: FeatureAccess = {
        id: resolvedId,
        applicationId,
        themeId,
        status: dto.status ?? 'draft',
        config: dto.config ?? {},
        version: 1,
        createdAt: now,
        updatedAt: now,
      };
      tx.set(ref, JSON.parse(JSON.stringify(created)));
      return created;
    });
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
