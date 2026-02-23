import { ConflictException, Injectable, Logger, NotFoundException } from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';

import {
  WidgetConfigEntity,
  WidgetVariant,
} from './entities/widget-config.entity';
import {
  findByIdSafe, mergeConfig,
  nowIso,
  resolveImageSourceUrlsDeep,
} from '../../../../common';
import { AssetsService } from '../../../assets/assets.service';
import { makeWidgetConfigId } from './utils';

const ASSET_URL_TTL_SEC = 3600;

@Injectable()
export class WidgetConfigsService {
  constructor(
    @InjectRepository(WidgetConfigEntity)
    private readonly repo: BaseFirestoreRepository<WidgetConfigEntity>,
    private readonly assets: AssetsService,
  ) {
  }

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
    applicationId: string,
    themeId: string,
    variant: WidgetVariant,
    ttlSec = ASSET_URL_TTL_SEC,
  ): Promise<WidgetConfigEntity> {
    const entity = await this.findByThemeVariant(applicationId, themeId, variant);
    if (!entity) throw new NotFoundException('Widget config not found');

    if (!entity.config) return entity;

    const resolveUrl = async (id: string) => {
      try {
        return await this.assets.getSignedUrlByIdForApp(applicationId, id, ttlSec);
      } catch (e) {
        this.logger.error(e);
        return null;
      }
    };

    const configResolved = await resolveImageSourceUrlsDeep(entity.config, resolveUrl);
    return {...entity, config: configResolved};
  }

  /** Upsert with partial deep-merge of `config`. */
  async upsertByThemeVariant(
    applicationId: string,
    themeId: string,
    variant: WidgetVariant,
    dto: { config?: Record<string, any>; expectedVersion?: number },
  ): Promise<WidgetConfigEntity> {
    const id = makeWidgetConfigId(themeId, variant);
    const now = nowIso();

    const existing = await this.findByThemeVariant(applicationId, themeId, variant);
    if (existing) {
      if (
        typeof dto.expectedVersion === 'number' &&
        dto.expectedVersion !== (existing.version ?? 0)
      ) {
        throw new ConflictException(
          `Version mismatch: expected ${dto.expectedVersion}, actual ${existing.version ?? 0}`,
        );
      }
      const next: WidgetConfigEntity = {
        ...existing,
        config: mergeConfig(existing.config, dto.config) ?? {},
        version: (existing.version ?? 0) + 1,
        updatedAt: now,
      };
      return this.repo.update(next);
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
    return this.repo.create(created);
  }

  /** Ensure both variants exist (light & dark). */
  async ensurePair(
    applicationId: string,
    themeId: string,
  ): Promise<{ light: WidgetConfigEntity; dark: WidgetConfigEntity }> {
    const [light, dark] = await Promise.all(
      (['light', 'dark'] as const).map((v) =>
        this.upsertByThemeVariant(applicationId, themeId, v, {config: {}}),
      ),
    );
    return {light, dark};
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
