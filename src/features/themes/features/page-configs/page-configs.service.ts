import {
  ConflictException,
  Injectable,
  Logger,
  NotFoundException,
} from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';
import * as admin from 'firebase-admin';

import { PageConfigEntity, PageVariant } from './entities/page-config.entity';
import {
  Collections,
  findByIdSafe,
  mergeConfig,
  nowIso,
} from '../../../../common';
import { makePageConfigId } from './utils';
import { AssetsService } from '../../../assets/assets.service';
import { resolveConfigImages } from '../../../../common/utils/config-utils';
import { OwnershipService } from '../../../../common/data/ownership.service';

const ASSET_URL_TTL_SEC = 3600;

@Injectable()
export class PageConfigsService {
  private readonly logger = new Logger(PageConfigsService.name);

  constructor(
    @InjectRepository(PageConfigEntity)
    private readonly repo: BaseFirestoreRepository<PageConfigEntity>,
    private readonly assets: AssetsService,
    private readonly ownership: OwnershipService,
  ) {}

  // ---------- Public API ----------
  /**
   * Returns page config; optionally resolves all `ImageSource` IDs into signed URLs.
   */
  async getByThemeVariant(
    uid: string,
    applicationId: string,
    themeId: string,
    variant: PageVariant,
    ttlSec = ASSET_URL_TTL_SEC,
  ): Promise<PageConfigEntity> {
    await this.ownership.assertOwnsApplication(uid, applicationId);
    const id = makePageConfigId(themeId, variant);
    const entity = await findByIdSafe(this.repo, id);
    if (!entity || entity.applicationId !== applicationId) {
      throw new NotFoundException('Page config not found');
    }

    const configResolved = await resolveConfigImages(
      this.assets,
      applicationId,
      ttlSec,
      entity.config,
    );
    return { ...entity, config: configResolved };
  }

  /** Upsert with partial deep-merge of `config`. */
  async upsertByThemeVariant(
    uid: string,
    applicationId: string,
    themeId: string,
    variant: PageVariant,
    dto: { config?: Record<string, any>; expectedVersion?: number },
  ): Promise<PageConfigEntity> {
    await this.ownership.assertOwnsTheme(uid, applicationId, themeId);
    const id = makePageConfigId(themeId, variant);
    const now = nowIso();

    // Version check and write happen inside one transaction so concurrent
    // writers cannot interleave between the check and the set.
    const db = admin.firestore();
    const ref = db.collection(Collections.themeConfigPages).doc(id);
    return db.runTransaction(async (tx) => {
      const snap = await tx.get(ref);
      if (snap.exists) {
        const existing = { ...(snap.data() as PageConfigEntity), id };
        if (existing.applicationId !== applicationId) {
          throw new NotFoundException('Page config not found');
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
        const next: PageConfigEntity = {
          ...existing,
          config: mergeConfig(existing.config, dto.config) ?? {},
          version: (existing.version ?? 0) + 1,
          updatedAt: now,
        };
        tx.set(ref, JSON.parse(JSON.stringify(next)));
        return next;
      }

      const created: PageConfigEntity = {
        id,
        applicationId,
        themeId,
        variant,
        config: dto.config ?? {},
        version: 1,
        createdAt: now,
        updatedAt: now,
      };
      tx.set(ref, JSON.parse(JSON.stringify(created)));
      return created;
    });
  }

  /** Ensure both variants exist (light & dark). */
  async ensurePair(
    uid: string,
    applicationId: string,
    themeId: string,
  ): Promise<{ light: PageConfigEntity; dark: PageConfigEntity }> {
    const [light, dark] = await Promise.all(
      (['light', 'dark'] as const).map((v) =>
        this.upsertByThemeVariant(uid, applicationId, themeId, v, {
          config: {},
        }),
      ),
    );
    return { light, dark };
  }

  /** List all existing variants for a theme. */
  async listForTheme(
    uid: string,
    applicationId: string,
    themeId: string,
  ): Promise<PageConfigEntity[]> {
    await this.ownership.assertOwnsApplication(uid, applicationId);
    return this.repo
      .whereEqualTo('applicationId', applicationId)
      .whereEqualTo('themeId', themeId)
      .find();
  }
}
