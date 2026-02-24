import { ConflictException, Injectable, Logger, NotFoundException } from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';

import { PageConfigEntity, PageVariant } from './entities/page-config.entity';
import {
    findByIdSafe, mergeConfig,
    nowIso,

} from '../../../../common';
import { makePageConfigId } from './utils';
import { AssetsService } from '../../../assets/assets.service';
import { resolveConfigImages } from "../../../../common/utils/config-utils";

const ASSET_URL_TTL_SEC = 3600;

@Injectable()
export class PageConfigsService {
    private readonly logger = new Logger(PageConfigsService.name);

    constructor(
        @InjectRepository(PageConfigEntity)
        private readonly repo: BaseFirestoreRepository<PageConfigEntity>,
        private readonly assets: AssetsService,
    ) {
    }

    private async findByThemeVariant(
        applicationId: string,
        themeId: string,
        variant: PageVariant,
    ): Promise<PageConfigEntity | null> {
        const id = makePageConfigId(themeId, variant);
        const found = await findByIdSafe(this.repo, id);
        return found && found.applicationId === applicationId ? found : null;
    }


    // ---------- Public API ----------
    /**
     * Returns page config; optionally resolves all `ImageSource` IDs into signed URLs.
     */
    async getByThemeVariant(
        applicationId: string,
        themeId: string,
        variant: PageVariant,
        ttlSec = ASSET_URL_TTL_SEC,
    ): Promise<PageConfigEntity> {
        const id = makePageConfigId(themeId, variant);
        const entity = await findByIdSafe(this.repo, id);
        if (!entity || entity.applicationId !== applicationId) {
            throw new NotFoundException('Page config not found');
        }

        const configResolved = await resolveConfigImages(this.assets, applicationId, ttlSec, entity.config);
        return {...entity, config: configResolved};
    }

    /** Upsert with partial deep-merge of `config`. */
    async upsertByThemeVariant(
        applicationId: string,
        themeId: string,
        variant: PageVariant,
        dto: { config?: Record<string, any>; expectedVersion?: number },
    ): Promise<PageConfigEntity> {
        const id = makePageConfigId(themeId, variant);
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
            const next: PageConfigEntity = {
                ...existing,
                config: mergeConfig(existing.config, dto.config) ?? {},
                version: (existing.version ?? 0) + 1,
                updatedAt: now,
            };
            const result = await this.repo.update(next);


            return result;
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
        const result = await this.repo.create(created);

        return result;
    }

    /** Ensure both variants exist (light & dark). */
    async ensurePair(
        applicationId: string,
        themeId: string,
    ): Promise<{ light: PageConfigEntity; dark: PageConfigEntity }> {
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
    ): Promise<PageConfigEntity[]> {
        return this.repo
            .whereEqualTo('applicationId', applicationId)
            .whereEqualTo('themeId', themeId)
            .find();
    }
}
