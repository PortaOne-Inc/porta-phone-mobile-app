import { Injectable, NotFoundException } from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';

import { PageConfigEntity, PageVariant } from './entities/page-config.entity';
import { deepMerge, nowIso } from '../../../../common';

@Injectable()
export class PageConfigsService {
  constructor(
    @InjectRepository(PageConfigEntity)
    private readonly repo: BaseFirestoreRepository<PageConfigEntity>,
  ) {}

  private buildId(themeId: string, variant: PageVariant) {
    return `${themeId}_${variant}`;
  }

  async getByThemeVariant(
    applicationId: string,
    themeId: string,
    variant: PageVariant,
  ): Promise<PageConfigEntity> {
    const id = this.buildId(themeId, variant);
    const found = await this.repo.findById(id).catch(() => null);
    if (!found || found.applicationId !== applicationId) {
      throw new NotFoundException('Page config not found');
    }
    return found;
  }

  /** Upsert with partial deep-merge of `config`. */
  async upsertByThemeVariant(
    applicationId: string,
    themeId: string,
    variant: PageVariant,
    dto: { config?: Record<string, any> },
  ): Promise<PageConfigEntity> {
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

    const created: PageConfigEntity = {
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
  ): Promise<{ light: PageConfigEntity; dark: PageConfigEntity }> {
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
  ): Promise<PageConfigEntity[]> {
    return this.repo
      .whereEqualTo('applicationId', applicationId)
      .whereEqualTo('themeId', themeId)
      .find();
  }
}
