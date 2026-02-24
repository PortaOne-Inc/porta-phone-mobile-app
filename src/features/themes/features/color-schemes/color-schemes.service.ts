import { ConflictException, Injectable, Logger, NotFoundException } from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';

import { ColorScheme, ThemeVariant } from './entities/color-scheme.entity';
import { deepMerge, nowIso } from '../../../../common';

@Injectable()
export class ColorSchemesService {
  private readonly logger = new Logger(ColorSchemesService.name);

  constructor(
    @InjectRepository(ColorScheme)
    private readonly repo: BaseFirestoreRepository<ColorScheme>,
  ) {}

  private buildId(themeId: string, variant: ThemeVariant) {
    return `${themeId}_${variant}`;
  }

  async getByThemeVariant(
    applicationId: string,
    themeId: string,
    variant: ThemeVariant,
  ): Promise<ColorScheme> {
    const id = this.buildId(themeId, variant);
    const found = await this.repo.findById(id).catch(() => null);
    if (!found || found.applicationId !== applicationId) {
      throw new NotFoundException('Color scheme not found');
    }
    return found;
  }

  async upsertByThemeVariant(
    applicationId: string,
    themeId: string,
    variant: ThemeVariant,
    dto: { config?: Record<string, any>; expectedVersion?: number },
  ): Promise<ColorScheme> {
    const id = this.buildId(themeId, variant);
    const now = nowIso();

    const existing = await this.repo.findById(id).catch(() => null);
    if (existing) {
      if (
        typeof dto.expectedVersion === 'number' &&
        dto.expectedVersion !== (existing.version ?? 0)
      ) {
        throw new ConflictException(
          `Version mismatch: expected ${dto.expectedVersion}, actual ${existing.version ?? 0}`,
        );
      }
      if (dto.config && Object.keys(dto.config).length > 0) {
        existing.config = deepMerge(existing.config ?? {}, dto.config);
      }
      existing.version = (existing.version ?? 0) + 1;
      existing.updatedAt = now;
      const result = await this.repo.update(existing);


      return result;
    }

    const created: ColorScheme = {
      id,
      applicationId,
      themeId,
      variant,
      config: dto.config ?? {},
      version: 1,
      createdAt: now,
      updatedAt: now,
    };
    const result = await this.repo.create(created);

    return result;
  }

  /** Ensure both variants exist (light & dark). */
  async ensurePair(
    applicationId: string,
    themeId: string,
  ): Promise<{ light: ColorScheme; dark: ColorScheme }> {
    const [light, dark] = await Promise.all([
      this.upsertByThemeVariant(applicationId, themeId, 'light', {
        config: {},
      }),
      this.upsertByThemeVariant(applicationId, themeId, 'dark', { config: {} }),
    ]);
    return { light, dark };
  }

  /** List all variants for a theme (if any). */
  async listForTheme(
    applicationId: string,
    themeId: string,
  ): Promise<ColorScheme[]> {
    return this.repo
      .whereEqualTo('applicationId', applicationId)
      .whereEqualTo('themeId', themeId)
      .find();
  }
}
