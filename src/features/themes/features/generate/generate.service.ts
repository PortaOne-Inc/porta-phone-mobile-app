import { Injectable, Logger, NotFoundException } from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';

import { deepMerge, nowIso } from '../../../../common';
import { Theme } from '../../entities/theme';
import { ColorScheme } from '../color-schemes/entities/color-scheme.entity';
import { WidgetConfigEntity } from '../widget-configs/entities/widget-config.entity';
import { PageConfigEntity } from '../page-configs/entities/page-config.entity';
import { FeatureAccessService } from '../feature-access/feature-access.service';
import { GenerateThemeDto } from './dto/create-generate.dto';
import { NudgeThemeDto } from './dto/nudge-theme.dto';
import { AssetCatalogService } from './compose/asset-catalog.service';
import { BriefGeneratorService } from './brief/brief-generator.service';
import { ThemeComposerService } from './compose/theme-composer.service';

type Variant = 'light' | 'dark';

interface ConfigEntity {
  id: string;
  applicationId: string;
  themeId: string;
  variant: Variant;
  config: Record<string, any>;
  version?: number;
  createdAt: string;
  updatedAt: string;
}

/**
 * AI theme generator.
 *
 * Pipeline: prompt (+ asset catalog) -> ThemeBrief (Anthropic, structured) ->
 * deterministic ThemeComposer (M3 palette for light+dark on top of the
 * canonical base, recolored tabs, bound assets, all features enabled) ->
 * persist the full document set. The HTTP API is unchanged.
 */
@Injectable()
export class GenerateThemesService {
  private readonly logger = new Logger(GenerateThemesService.name);

  constructor(
    @InjectRepository(Theme)
    private readonly themeRepo: BaseFirestoreRepository<Theme>,
    @InjectRepository(ColorScheme)
    private readonly colorSchemeRepo: BaseFirestoreRepository<ColorScheme>,
    @InjectRepository(WidgetConfigEntity)
    private readonly widgetCfgRepo: BaseFirestoreRepository<WidgetConfigEntity>,
    @InjectRepository(PageConfigEntity)
    private readonly pageCfgRepo: BaseFirestoreRepository<PageConfigEntity>,
    private readonly featureAccess: FeatureAccessService,
    private readonly assetCatalog: AssetCatalogService,
    private readonly briefGen: BriefGeneratorService,
    private readonly composer: ThemeComposerService,
  ) {}

  async generateAndCreate(
    uid: string,
    applicationId: string,
    dto: GenerateThemeDto,
  ) {
    const primary: Variant = dto.variant ?? 'light';
    const theme = await this.themeRepo.create({
      applicationId,
      title: dto.title,
    } as Theme);

    const fullPrompt = [
      dto.prompt.trim(),
      '',
      'Context:',
      (dto.description ?? '').trim(),
    ]
      .join('\n')
      .trim();

    const { brief, llmUsed } = await this.resolveBrief(
      uid,
      applicationId,
      fullPrompt,
      dto.seedColor,
    );
    const composed = this.composer.compose(brief);

    const variants: Variant[] = ['light', 'dark'];
    await Promise.all(
      variants.flatMap((v) => [
        this.upsert(
          this.colorSchemeRepo,
          theme.id,
          applicationId,
          v,
          composed.colorScheme[v],
        ),
        this.upsert(
          this.widgetCfgRepo,
          theme.id,
          applicationId,
          v,
          composed.widget[v],
        ),
        this.upsert(
          this.pageCfgRepo,
          theme.id,
          applicationId,
          v,
          composed.page[v],
        ),
      ]),
    );

    await this.featureAccess.upsertByTheme(uid, applicationId, theme.id, {
      status: 'draft',
      config: composed.appConfig,
    });

    const assetsApplied = await this.assetCatalog.link(
      uid,
      theme.id,
      composed.assetIds,
    );

    return {
      theme,
      colorSchemeConfig: composed.colorScheme[primary],
      themeWidgetConfig: composed.widget[primary],
      themePageConfig: { light: composed.page.light, dark: composed.page.dark },
      featureAccessConfig: composed.appConfig,
      meta: {
        llmUsed,
        degraded: !llmUsed,
        variantsGenerated: variants,
        primaryVariant: primary,
        seedColor: brief.palette.seed,
        assetsApplied,
      },
    };
  }

  async nudgeAndUpdate(
    uid: string,
    applicationId: string,
    themeId: string,
    dto: NudgeThemeDto,
  ) {
    const variant: Variant = dto.variant ?? 'light';
    const targets = dto.targets?.length
      ? dto.targets
      : (['colorScheme', 'widgetConfig', 'pageConfig'] as const);
    const mode = dto.mode ?? 'patch';

    const theme = await this.themeRepo.findById(themeId).catch(() => null);
    if (!theme || theme.applicationId !== applicationId) {
      throw new NotFoundException('Theme not found');
    }

    const { brief, llmUsed } = await this.resolveBrief(
      uid,
      applicationId,
      dto.prompt,
      dto.seedColorHint ?? undefined,
    );
    const composed = this.composer.compose(brief);

    const next: Record<string, Record<string, any>> = {
      colorScheme: composed.colorScheme[variant],
      widgetConfig: composed.widget[variant],
      pageConfig: composed.page[variant],
    };
    const repoByTarget = {
      colorScheme: this.colorSchemeRepo,
      widgetConfig: this.widgetCfgRepo,
      pageConfig: this.pageCfgRepo,
    } as const;

    const updated: string[] = [];
    for (const target of targets) {
      const repo = repoByTarget[
        target
      ] as BaseFirestoreRepository<ConfigEntity>;
      const id = `${themeId}_${variant}`;
      const prev = await repo.findById(id).catch(() => null);
      const merged =
        mode === 'replace' || !prev?.config
          ? next[target]
          : deepMerge(structuredClone(prev.config), next[target]);
      await this.upsert(repo, themeId, applicationId, variant, merged);
      updated.push(target);
    }

    const assetsApplied = await this.assetCatalog.link(
      uid,
      themeId,
      composed.assetIds,
    );

    return {
      theme,
      colorSchemeConfig: composed.colorScheme[variant],
      themeWidgetConfig: composed.widget[variant],
      themePageConfig: { [variant]: composed.page[variant] },
      updated,
      mode,
      meta: { llmUsed, degraded: !llmUsed, assetsApplied },
    };
  }

  /**
   * Build the ThemeBrief, seeding a starter public asset when the application
   * has none so the generated theme references a real asset (visible in the
   * Assets list) rather than only an inline placeholder URL.
   */
  private async resolveBrief(
    uid: string,
    applicationId: string,
    prompt: string,
    seedHint?: string,
  ) {
    const isSvg = (a: { mime: string; name: string }) =>
      a.mime === 'image/svg+xml' || a.name.toLowerCase().endsWith('.svg');

    let catalog = await this.assetCatalog.catalog(uid, applicationId);
    // Logos render as SVG only; seed a placeholder SVG if the app has none.
    if (!catalog.some(isSvg)) {
      const seeded = await this.assetCatalog.seedDefaultAsset(
        uid,
        applicationId,
      );
      if (seeded) catalog = [...catalog, seeded];
    }
    const { brief, llmUsed } = await this.briefGen.generate(
      prompt,
      seedHint,
      catalog,
    );
    if (!brief.assets?.logoAssetId) {
      const logo = catalog.find(isSvg) ?? catalog[0];
      if (logo)
        brief.assets = { ...(brief.assets ?? {}), logoAssetId: logo.id };
    }
    return { brief, llmUsed };
  }

  private async upsert(
    repo: BaseFirestoreRepository<any>,
    themeId: string,
    applicationId: string,
    variant: Variant,
    config: Record<string, any>,
  ): Promise<void> {
    const id = `${themeId}_${variant}`;
    const now = nowIso();
    const existing = await repo.findById(id).catch(() => null);
    const entity: ConfigEntity = {
      id,
      applicationId,
      themeId,
      variant,
      config,
      version: (existing?.version ?? 0) + 1,
      createdAt: existing?.createdAt ?? now,
      updatedAt: now,
    };
    if (existing) await repo.update(entity as any);
    else await repo.create(entity as any);
  }
}
