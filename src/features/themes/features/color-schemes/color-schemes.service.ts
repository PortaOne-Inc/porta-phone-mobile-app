import {
  ConflictException,
  Injectable,
  Logger,
  NotFoundException,
} from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';
import * as admin from 'firebase-admin';

import { ColorScheme, ThemeVariant } from './entities/color-scheme.entity';
import { Collections, deepMerge, nowIso } from '../../../../common';
import { OwnershipService } from '../../../../common/data/ownership.service';

@Injectable()
export class ColorSchemesService {
  private readonly logger = new Logger(ColorSchemesService.name);

  constructor(
    @InjectRepository(ColorScheme)
    private readonly repo: BaseFirestoreRepository<ColorScheme>,
    private readonly ownership: OwnershipService,
  ) {}

  private buildId(themeId: string, variant: ThemeVariant) {
    return `${themeId}_${variant}`;
  }

  async getByThemeVariant(
    uid: string,
    applicationId: string,
    themeId: string,
    variant: ThemeVariant,
  ): Promise<ColorScheme> {
    await this.ownership.assertOwnsApplication(uid, applicationId);
    const id = this.buildId(themeId, variant);
    const found = await this.repo.findById(id).catch(() => null);
    if (!found || found.applicationId !== applicationId) {
      throw new NotFoundException('Color scheme not found');
    }
    return found;
  }

  async upsertByThemeVariant(
    uid: string,
    applicationId: string,
    themeId: string,
    variant: ThemeVariant,
    dto: { config?: Record<string, any>; expectedVersion?: number },
  ): Promise<ColorScheme> {
    await this.ownership.assertOwnsTheme(uid, applicationId, themeId);
    const id = this.buildId(themeId, variant);
    const now = nowIso();

    // Version check and write happen inside one transaction so concurrent
    // writers cannot interleave between the check and the set.
    const db = admin.firestore();
    const ref = db.collection(Collections.themeConfigColorSchemes).doc(id);
    return db.runTransaction(async (tx) => {
      const snap = await tx.get(ref);
      if (snap.exists) {
        const existing = { ...(snap.data() as ColorScheme), id };
        if (existing.applicationId !== applicationId) {
          throw new NotFoundException('Color scheme not found');
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
        if (dto.config && Object.keys(dto.config).length > 0) {
          existing.config = deepMerge(existing.config ?? {}, dto.config);
        }
        existing.version = (existing.version ?? 0) + 1;
        existing.updatedAt = now;
        tx.set(ref, JSON.parse(JSON.stringify(existing)));
        return existing;
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
      tx.set(ref, JSON.parse(JSON.stringify(created)));
      return created;
    });
  }

  /** Ensure both variants exist (light & dark). */
  async ensurePair(
    uid: string,
    applicationId: string,
    themeId: string,
  ): Promise<{ light: ColorScheme; dark: ColorScheme }> {
    const [light, dark] = await Promise.all([
      this.upsertByThemeVariant(uid, applicationId, themeId, 'light', {
        config: {},
      }),
      this.upsertByThemeVariant(uid, applicationId, themeId, 'dark', {
        config: {},
      }),
    ]);
    return { light, dark };
  }

  /** List all variants for a theme (if any). */
  async listForTheme(
    uid: string,
    applicationId: string,
    themeId: string,
  ): Promise<ColorScheme[]> {
    await this.ownership.assertOwnsApplication(uid, applicationId);
    return this.repo
      .whereEqualTo('applicationId', applicationId)
      .whereEqualTo('themeId', themeId)
      .find();
  }
}
