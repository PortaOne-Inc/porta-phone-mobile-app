import {
  ConflictException,
  Injectable,
  Logger,
  NotFoundException,
} from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';
import * as admin from 'firebase-admin';

import {
  WidgetConfigEntity,
  WidgetVariant,
} from './entities/widget-config.entity';
import {
  Collections,
  findByIdSafe,
  mergeConfig,
  nowIso,
  resolveImageSourceUrlsDeep,
} from '../../../../common';
import { AssetsService } from '../../../assets/assets.service';
import { OwnershipService } from '../../../../common/data/ownership.service';
import { makeWidgetConfigId } from './utils';

const ASSET_URL_TTL_SEC = 3600;

@Injectable()
export class WidgetConfigsService {
  constructor(
    @InjectRepository(WidgetConfigEntity)
    private readonly repo: BaseFirestoreRepository<WidgetConfigEntity>,
    private readonly assets: AssetsService,
    private readonly ownership: OwnershipService,
  ) {}

  logger = new Logger(WidgetConfigsService.name);

  private async findByThemeVariant(
    applicationId: string,
    themeId: string,
    variant: WidgetVariant,
  ): Promise<WidgetConfigEntity | null> {
    const id = makeWidgetConfigId(themeId, variant);
    const found = await findByIdSafe(this.repo, id);
    return found && found.applicationId === applicationId ? found : null;
  }

  async getByThemeVariant(
    uid: string,
    applicationId: string,
    themeId: string,
    variant: WidgetVariant,
    ttlSec = ASSET_URL_TTL_SEC,
  ): Promise<WidgetConfigEntity> {
    await this.ownership.assertOwnsApplication(uid, applicationId);
    const entity = await this.findByThemeVariant(
      applicationId,
      themeId,
      variant,
    );
    if (!entity) throw new NotFoundException('Widget config not found');

    if (!entity.config) return entity;

    const resolveUrl = async (id: string) => {
      return this.assets.getSignedUrlByIdForApp(applicationId, id, ttlSec);
    };

    const configResolved = await resolveImageSourceUrlsDeep(
      entity.config,
      resolveUrl,
    );
    return { ...entity, config: configResolved };
  }

  /** Upsert with partial deep-merge of `config`. */
  async upsertByThemeVariant(
    uid: string,
    applicationId: string,
    themeId: string,
    variant: WidgetVariant,
    dto: { config?: Record<string, any>; expectedVersion?: number },
  ): Promise<WidgetConfigEntity> {
    await this.ownership.assertOwnsTheme(uid, applicationId, themeId);
    const id = makeWidgetConfigId(themeId, variant);
    const now = nowIso();

    // Version check and write happen inside one transaction so concurrent
    // writers cannot interleave between the check and the set.
    const db = admin.firestore();
    const ref = db.collection(Collections.themeConfigWidgets).doc(id);
    return db.runTransaction(async (tx) => {
      const snap = await tx.get(ref);
      if (snap.exists) {
        const existing = { ...(snap.data() as WidgetConfigEntity), id };
        if (existing.applicationId !== applicationId) {
          throw new NotFoundException('Widget config not found');
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
        existing.config = mergeConfig(existing.config, dto.config) ?? {};
        existing.version = (existing.version ?? 0) + 1;
        existing.updatedAt = now;
        tx.set(ref, JSON.parse(JSON.stringify(existing)));
        return existing;
      }

      const created: WidgetConfigEntity = {
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
  ): Promise<{ light: WidgetConfigEntity; dark: WidgetConfigEntity }> {
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
  ): Promise<WidgetConfigEntity[]> {
    await this.ownership.assertOwnsApplication(uid, applicationId);
    return this.repo
      .whereEqualTo('applicationId', applicationId)
      .whereEqualTo('themeId', themeId)
      .find();
  }
}
