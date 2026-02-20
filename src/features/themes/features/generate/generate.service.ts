import {
    Injectable,
    BadRequestException,
    NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';

import { Theme } from '../../entities/theme';
import { ColorScheme } from '../color-schemes/entities/color-scheme.entity';
import { WidgetConfigEntity } from '../widget-configs/entities/widget-config.entity';
import { PageConfigEntity } from '../page-configs/entities/page-config.entity';
import { NudgeMode, NudgeTarget, NudgeThemeDto } from './dto/nudge-theme.dto';
import { GenerateThemeDto } from './dto/create-generate.dto';
import { ColorSchemeGenerator } from './generators/color-scheme.generator';
import { WidgetConfigGenerator } from './generators/widget-config.generator';
import { PageConfigGenerator } from './generators/page-config.generator';

@Injectable()
export class GenerateThemesService {
    constructor(
        @InjectRepository(Theme)
        private readonly themeRepo: BaseFirestoreRepository<Theme>,
        @InjectRepository(ColorScheme)
        private readonly colorSchemeRepo: BaseFirestoreRepository<ColorScheme>,
        @InjectRepository(WidgetConfigEntity)
        private readonly widgetCfgRepo: BaseFirestoreRepository<WidgetConfigEntity>,
        @InjectRepository(PageConfigEntity)
        private readonly pageCfgRepo: BaseFirestoreRepository<PageConfigEntity>,
        private readonly colorSchemeGen: ColorSchemeGenerator,
        private readonly widgetConfigGen: WidgetConfigGenerator,
        private readonly pageConfigGen: PageConfigGenerator,
    ) {}

    async generateAndCreate(
        _uid: string,
        applicationId: string,
        dto: GenerateThemeDto,
    ) {
        if (!dto?.description?.trim())
            throw new BadRequestException('description is required');
        if (!dto?.title?.trim())
            throw new BadRequestException('title is required');
        if (!dto?.prompt?.trim())
            throw new BadRequestException('prompt is required');

        const variant: 'light' | 'dark' = dto.variant ?? 'light';
        const theme = await this.themeRepo.create({
            applicationId,
            title: dto.title,
        } as Theme);

        const fullPrompt = [dto.prompt.trim(), '', 'Context:', dto.description.trim()].join('\n');

        const colorCfg = await this.colorSchemeGen.generate(fullPrompt, dto.seedColor ?? undefined);

        const [widgetCfg, pageCfg] = await Promise.all([
            this.widgetConfigGen.generate(fullPrompt, colorCfg),
            this.pageConfigGen.generate(fullPrompt, colorCfg),
        ]);

        const csEntity = await this.saveColorScheme(theme.id, applicationId, variant, colorCfg);
        const wcEntity = await this.saveWidgetConfig(theme.id, applicationId, variant, widgetCfg);
        const pcEntity = await this.savePageConfig(theme.id, applicationId, variant, pageCfg);

        return {
            theme,
            colorSchemeConfig: csEntity.config,
            themeWidgetConfig: wcEntity.config,
            themePageConfig: { [variant]: pcEntity.config },
        };
    }

    async nudgeAndUpdate(
        _uid: string,
        applicationId: string,
        themeId: string,
        dto: NudgeThemeDto,
    ) {
        if (!dto?.prompt?.trim())
            throw new BadRequestException('prompt is required');

        const variant: 'light' | 'dark' = dto.variant ?? 'light';
        const targets: NudgeTarget[] = dto.targets?.length
            ? dto.targets
            : ['colorScheme', 'widgetConfig', 'pageConfig'];
        const mode: NudgeMode = dto.mode ?? 'patch';

        const theme = await this.themeRepo.findById(themeId).catch(() => null);
        if (!theme || theme.applicationId !== applicationId) {
            throw new NotFoundException('Theme not found');
        }

        const cfgId = `${themeId}_${variant}`;
        const [csPrev, wcPrev, pcPrev] = await Promise.all([
            this.colorSchemeRepo.findById(cfgId).catch(() => null),
            this.widgetCfgRepo.findById(cfgId).catch(() => null),
            this.pageCfgRepo.findById(cfgId).catch(() => null),
        ]);

        let colorSchemeConfig =
            csPrev?.config ?? this.colorSchemeGen.fallback(dto.seedColorHint ?? undefined);
        let widgetConfig =
            wcPrev?.config ?? this.widgetConfigGen.fallback(colorSchemeConfig);
        let pageConfig =
            pcPrev?.config ?? this.pageConfigGen.fallback(colorSchemeConfig);

        if (targets.includes('colorScheme')) {
            const updated = await this.colorSchemeGen.nudge(
                dto.prompt,
                colorSchemeConfig,
                mode,
                dto.seedColorHint ?? undefined,
            );
            colorSchemeConfig = updated ?? colorSchemeConfig;
        }
        if (targets.includes('widgetConfig')) {
            const updated = await this.widgetConfigGen.nudge(
                dto.prompt,
                widgetConfig,
                colorSchemeConfig,
                mode,
            );
            widgetConfig = updated ?? widgetConfig;
        }
        if (targets.includes('pageConfig')) {
            const updated = await this.pageConfigGen.nudge(
                dto.prompt,
                pageConfig,
                colorSchemeConfig,
                mode,
            );
            pageConfig = updated ?? pageConfig;
        }

        const now = new Date().toISOString();

        await Promise.all([
            targets.includes('colorScheme')
                ? this.upsertColorScheme(cfgId, applicationId, themeId, variant, colorSchemeConfig, csPrev?.createdAt ?? now, now)
                : Promise.resolve(),
            targets.includes('widgetConfig')
                ? this.upsertWidgetConfig(cfgId, applicationId, themeId, variant, widgetConfig, wcPrev?.createdAt ?? now, now)
                : Promise.resolve(),
            targets.includes('pageConfig')
                ? this.upsertPageConfig(cfgId, applicationId, themeId, variant, pageConfig, pcPrev?.createdAt ?? now, now)
                : Promise.resolve(),
        ]);

        return {
            theme,
            colorSchemeConfig,
            themeWidgetConfig: widgetConfig,
            themePageConfig: { [variant]: pageConfig },
            updated: targets,
            mode,
        };
    }

    private async saveColorScheme(
        themeId: string,
        applicationId: string,
        variant: 'light' | 'dark',
        config: Record<string, any>,
    ): Promise<ColorScheme> {
        const id = `${themeId}_${variant}`;
        const now = new Date().toISOString();
        const existing = await this.colorSchemeRepo.findById(id).catch(() => null);
        const entity: ColorScheme = {
            id,
            applicationId,
            themeId,
            variant,
            config,
            createdAt: existing?.createdAt ?? now,
            updatedAt: now,
        };
        if (existing) await this.colorSchemeRepo.update(entity);
        else await this.colorSchemeRepo.create(entity);
        return entity;
    }

    private async saveWidgetConfig(
        themeId: string,
        applicationId: string,
        variant: 'light' | 'dark',
        config: Record<string, any>,
    ): Promise<WidgetConfigEntity> {
        const id = `${themeId}_${variant}`;
        const now = new Date().toISOString();
        const existing = await this.widgetCfgRepo.findById(id).catch(() => null);
        const entity: WidgetConfigEntity = {
            id,
            applicationId,
            themeId,
            variant,
            config,
            createdAt: existing?.createdAt ?? now,
            updatedAt: now,
        };
        if (existing) await this.widgetCfgRepo.update(entity);
        else await this.widgetCfgRepo.create(entity);
        return entity;
    }

    private async savePageConfig(
        themeId: string,
        applicationId: string,
        variant: 'light' | 'dark',
        config: Record<string, any>,
    ): Promise<PageConfigEntity> {
        const id = `${themeId}_${variant}`;
        const now = new Date().toISOString();
        const existing = await this.pageCfgRepo.findById(id).catch(() => null);
        const entity: PageConfigEntity = {
            id,
            applicationId,
            themeId,
            variant,
            config,
            createdAt: existing?.createdAt ?? now,
            updatedAt: now,
        };
        if (existing) await this.pageCfgRepo.update(entity);
        else await this.pageCfgRepo.create(entity);
        return entity;
    }

    private async upsertColorScheme(
        id: string,
        applicationId: string,
        themeId: string,
        variant: 'light' | 'dark',
        config: Record<string, any>,
        createdAt: string,
        updatedAt: string,
    ): Promise<void> {
        const entity: ColorScheme = { id, applicationId, themeId, variant, config, createdAt, updatedAt };
        const existing = await this.colorSchemeRepo.findById(id).catch(() => null);
        if (existing) await this.colorSchemeRepo.update(entity);
        else await this.colorSchemeRepo.create(entity);
    }

    private async upsertWidgetConfig(
        id: string,
        applicationId: string,
        themeId: string,
        variant: 'light' | 'dark',
        config: Record<string, any>,
        createdAt: string,
        updatedAt: string,
    ): Promise<void> {
        const entity: WidgetConfigEntity = { id, applicationId, themeId, variant, config, createdAt, updatedAt };
        const existing = await this.widgetCfgRepo.findById(id).catch(() => null);
        if (existing) await this.widgetCfgRepo.update(entity);
        else await this.widgetCfgRepo.create(entity);
    }

    private async upsertPageConfig(
        id: string,
        applicationId: string,
        themeId: string,
        variant: 'light' | 'dark',
        config: Record<string, any>,
        createdAt: string,
        updatedAt: string,
    ): Promise<void> {
        const entity: PageConfigEntity = { id, applicationId, themeId, variant, config, createdAt, updatedAt };
        const existing = await this.pageCfgRepo.findById(id).catch(() => null);
        if (existing) await this.pageCfgRepo.update(entity);
        else await this.pageCfgRepo.create(entity);
    }
}
