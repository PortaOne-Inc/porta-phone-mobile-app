import { Injectable, NotFoundException } from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';

import {
  WidgetConfigEntity,
  WidgetVariant,
} from './entities/widget-config.entity';
import {
  deepMerge,
  nowIso,
  resolveImageSourceUrlsDeep,
} from '../../../../common';
import { AssetsService } from '../../../assets/assets.service';

const ASSET_URL_TTL_SEC = 3600;

@Injectable()
export class WidgetConfigsService {
  constructor(
    @InjectRepository(WidgetConfigEntity)
    private readonly repo: BaseFirestoreRepository<WidgetConfigEntity>,
    private readonly assets: AssetsService,
  ) {}

  private buildId(themeId: string, variant: WidgetVariant) {
    return `${themeId}_${variant}`;
  }

  async getByThemeVariant(
    applicationId: string,
    themeId: string,
    variant: WidgetVariant,
  ): Promise<WidgetConfigEntity> {
    const id = this.buildId(themeId, variant);
    const found = await this.repo.findById(id).catch(() => null);
    if (!found || found.applicationId !== applicationId) {
      throw new NotFoundException('Widget config not found');
    }
    return found;
  }

  async getByThemeVariantResolved(
    applicationId: string,
    themeId: string,
    variant: WidgetVariant,
    uid: string,
    ttlSec = ASSET_URL_TTL_SEC,
  ): Promise<WidgetConfigEntity> {
    const entity = await this.getByThemeVariant(
      applicationId,
      themeId,
      variant,
    );

    if (!entity?.config) return entity;

    const resolveUrl = (id: string) =>
      this.assets.getSignedUrlById(uid, id, ttlSec).catch(() => null);

    const configResolved = await resolveImageSourceUrlsDeep(
      entity.config,
      resolveUrl,
    );

    return { ...entity, config: configResolved };
  }

  /** Upsert with partial deep-merge of `config`. */
  async upsertByThemeVariant(
    applicationId: string,
    themeId: string,
    variant: WidgetVariant,
    dto: { config?: Record<string, any> },
  ): Promise<WidgetConfigEntity> {
    const id = this.buildId(themeId, variant);
    const now = nowIso();

    const existing = await this.repo.findById(id).catch(() => null);
    if (existing) {
      if (dto.config && Object.keys(dto.config).length > 0) {
        existing.config = deepMerge(existing.config ?? {}, dto.config);
      }
      existing.updatedAt = now;
      return this.repo.update(existing);
    }

    const created: WidgetConfigEntity = {
      id,
      applicationId,
      themeId,
      variant,
      config: dto.config ?? {},
      createdAt: now,
      updatedAt: now,
    };
    return this.repo.create(created);
  }

  /** Ensure both variants exist (light & dark). */
  async ensurePair(
    applicationId: string,
    themeId: string,
  ): Promise<{ light: WidgetConfigEntity; dark: WidgetConfigEntity }> {
    const [light, dark] = await Promise.all([
      this.upsertByThemeVariant(applicationId, themeId, 'light', {
        config: {},
      }),
      this.upsertByThemeVariant(applicationId, themeId, 'dark', { config: {} }),
    ]);
    return { light, dark };
  }

  /** List all existing variants for a theme. */
  async listForTheme(
    applicationId: string,
    themeId: string,
  ): Promise<WidgetConfigEntity[]> {
    return this.repo
      .whereEqualTo('applicationId', applicationId)
      .whereEqualTo('themeId', themeId)
      .find();
  }
}
