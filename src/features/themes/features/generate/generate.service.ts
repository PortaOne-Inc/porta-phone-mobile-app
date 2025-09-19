import {
    Injectable,
    BadRequestException,
    NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';
import OpenAI from 'openai';
import { z } from 'zod';

import { Theme } from '../../entities/theme';
import { ColorScheme } from '../color-schemes/entities/color-scheme.entity';
import { WidgetConfigEntity } from '../widget-configs/entities/widget-config.entity';
import { PageConfigEntity } from '../page-configs/entities/page-config.entity';
import { deepMerge } from '../../../../common';
import { NudgeMode, NudgeTarget, NudgeThemeDto } from './dto/nudge-theme.dto';
import { GenerateThemeDto } from './dto/create-generate.dto';

const Hex = z.string().regex(/^#([0-9A-Fa-f]{6})$/, 'hex #RRGGBB');

const ColorSchemeConfigSchema = z.object({
    seedColor: Hex,
    colorSchemeOverride: z.object({
        primary: Hex,
        onPrimary: Hex,
        primaryContainer: Hex,
        onPrimaryContainer: Hex,
        primaryFixed: Hex,
        primaryFixedDim: Hex,
        onPrimaryFixed: Hex,
        onPrimaryFixedVariant: Hex,
        secondary: Hex,
        onSecondary: Hex,
        secondaryContainer: Hex,
        onSecondaryContainer: Hex,
        secondaryFixed: Hex,
        secondaryFixedDim: Hex,
        onSecondaryFixed: Hex,
        onSecondaryFixedVariant: Hex,
        tertiary: Hex,
        onTertiary: Hex,
        tertiaryContainer: Hex,
        onTertiaryContainer: Hex,
        tertiaryFixed: Hex,
        tertiaryFixedDim: Hex,
        onTertiaryFixed: Hex,
        onTertiaryFixedVariant: Hex,
        error: Hex,
        onError: Hex,
        errorContainer: Hex,
        onErrorContainer: Hex,
        outline: Hex,
        outlineVariant: Hex,
        surface: Hex,
        onSurface: Hex,
        surfaceDim: Hex,
        surfaceBright: Hex,
        surfaceContainerLowest: Hex,
        surfaceContainerLow: Hex,
        surfaceContainer: Hex,
        surfaceContainerHigh: Hex.optional(),
        surfaceContainerHighest: Hex,
        onSurfaceVariant: Hex,
        inverseSurface: Hex,
        onInverseSurface: Hex,
        inversePrimary: Hex,
        shadow: Hex,
        scrim: Hex,
        surfaceTint: Hex,
    }),
});

type ColorSchemeConfig = z.infer<typeof ColorSchemeConfigSchema>;

const WidgetConfigSchema = z.record(z.any());
type WidgetConfig = z.infer<typeof WidgetConfigSchema>;

const PageConfigSchema = z.record(z.any());
type PageConfig = z.infer<typeof PageConfigSchema>;

@Injectable()
export class GenerateThemesService {
    private readonly openai?: OpenAI;

    constructor(
        @InjectRepository(Theme)
        private readonly themeRepo: BaseFirestoreRepository<Theme>,
        @InjectRepository(ColorScheme)
        private readonly colorSchemeRepo: BaseFirestoreRepository<ColorScheme>,
        @InjectRepository(WidgetConfigEntity)
        private readonly widgetCfgRepo: BaseFirestoreRepository<WidgetConfigEntity>,
        @InjectRepository(PageConfigEntity)
        private readonly pageCfgRepo: BaseFirestoreRepository<PageConfigEntity>,
    ) {
        const key = process.env.OPENAI_API_KEY;
        if (key) this.openai = new OpenAI({apiKey: key});
    }

    async generateAndCreate(
        _uid: string,
        applicationId: string,
        dto: GenerateThemeDto,
    ) {
        if (!dto?.description?.trim()) {
            throw new BadRequestException('description is required');
        }
        if (!dto?.title?.trim()) {
            throw new BadRequestException('title is required');
        }
        if (!dto?.prompt?.trim()) {
            throw new BadRequestException('prompt is required');
        }

        const variant: 'light' | 'dark' = dto.variant ?? 'light';

        const theme = await this.ensureTheme(applicationId, dto.title);
        const now = new Date().toISOString();

        const fullPrompt = [
            dto.prompt.trim(),
            '',
            'Context:',
            dto.description.trim(),
        ].join('\n');

        const colorCfg = await this.generateColorScheme(
            fullPrompt,
            dto.seedColor ?? undefined,
        );
        const csId = `${theme.id}_${variant}`;
        const existingCS = await this.colorSchemeRepo
            .findById(csId)
            .catch(() => null);
        const csEntity: ColorScheme = {
            id: csId,
            applicationId,
            themeId: theme.id,
            variant,
            config: colorCfg,
            createdAt: existingCS?.createdAt ?? now,
            updatedAt: now,
        };
        if (existingCS) await this.colorSchemeRepo.update(csEntity);
        else await this.colorSchemeRepo.create(csEntity);

        const widgetCfg = await this.generateWidgetConfig(fullPrompt, colorCfg);
        const wcId = `${theme.id}_${variant}`;
        const existingWC = await this.widgetCfgRepo
            .findById(wcId)
            .catch(() => null);
        const wcEntity: WidgetConfigEntity = {
            id: wcId,
            applicationId,
            themeId: theme.id,
            variant,
            config: widgetCfg,
            createdAt: existingWC?.createdAt ?? now,
            updatedAt: now,
        };
        if (existingWC) await this.widgetCfgRepo.update(wcEntity);
        else await this.widgetCfgRepo.create(wcEntity);

        const pageCfg = await this.generatePageConfig(fullPrompt, colorCfg);
        const pcId = `${theme.id}_${variant}`;
        const existingPC = await this.pageCfgRepo.findById(pcId).catch(() => null);
        const pcEntity: PageConfigEntity = {
            id: pcId,
            applicationId,
            themeId: theme.id,
            variant,
            config: pageCfg,
            createdAt: existingPC?.createdAt ?? now,
            updatedAt: now,
        };
        if (existingPC) await this.pageCfgRepo.update(pcEntity);
        else await this.pageCfgRepo.create(pcEntity);

        return {
            theme,
            colorSchemeConfig: csEntity.config,
            themeWidgetConfig: wcEntity.config,
            themePageConfig: {[variant]: pcEntity.config},
        };
    }

    private async ensureTheme(applicationId: string, title: string) {
        return this.themeRepo.create({
            applicationId,
            title,
        } as Theme);
    }

    // --- Color Scheme ---

    private async generateColorScheme(
        prompt: string,
        seedColor?: string,
    ): Promise<ColorSchemeConfig> {
        if (!this.openai) return this.fallbackColorScheme(seedColor);

        const sys =
            'You are a UI theming assistant. Output ONLY valid JSON (no markdown), strictly matching the required schema.';
        const user =
            (seedColor ? `Use seedColor=${seedColor}. ` : '') +
            `Create a color scheme for a mobile app based on this description:\n` +
            prompt +
            `\nReturn ONLY JSON with keys: { "seedColor": "#RRGGBB", "colorSchemeOverride": { ...#RRGGBB fields... } }`;

        try {
            const completion = await this.openai.chat.completions.create({
                model: 'gpt-4o-mini',
                temperature: 0.2,
                messages: [
                    {role: 'system', content: sys},
                    {role: 'user', content: user},
                ],
            });

            const raw = completion.choices?.[0]?.message?.content ?? '';
            const text = this.extractJson(raw);
            const parsed = JSON.parse(text);
            const check = ColorSchemeConfigSchema.safeParse(parsed);
            if (!check.success) return this.fallbackColorScheme(seedColor);

            return {
                seedColor: seedColor ?? check.data.seedColor,
                colorSchemeOverride: check.data.colorSchemeOverride,
            };
        } catch {
            return this.fallbackColorScheme(seedColor);
        }
    }

    private fallbackColorScheme(seed?: string): ColorSchemeConfig {
        const base = '#F95A14';
        const primary = seed ?? base;
        const gray = '#EEF3F6';
        const dark = '#30302F';
        return {
            seedColor: primary,
            colorSchemeOverride: {
                primary,
                onPrimary: '#FFFFFF',
                primaryContainer: '#B9E3F9',
                onPrimaryContainer: '#123752',
                primaryFixed: '#A5C6E4',
                primaryFixedDim: '#75A1C5',
                onPrimaryFixed: '#092D4A',
                onPrimaryFixedVariant: '#A5C6E4',
                secondary: '#123752',
                onSecondary: '#FFFFFF',
                secondaryContainer: gray,
                onSecondaryContainer: '#1F618F',
                secondaryFixed: '#848581',
                secondaryFixedDim: '#4C4D4A',
                onSecondaryFixed: '#30302F',
                onSecondaryFixedVariant: '#848581',
                tertiary: '#75B943',
                onTertiary: '#FFFFFF',
                tertiaryContainer: '#E1F7C1',
                onTertiaryContainer: '#2E5200',
                tertiaryFixed: '#B8E078',
                tertiaryFixedDim: '#8CC14E',
                onTertiaryFixed: '#224400',
                onTertiaryFixedVariant: '#B8E078',
                error: '#E74C3C',
                onError: '#FFFFFF',
                errorContainer: '#F5B7B1',
                onErrorContainer: '#8B1E13',
                outline: '#4C4D4A',
                outlineVariant: '#CDCFC9',
                surface: gray,
                onSurface: dark,
                surfaceDim: '#DDE0E3',
                surfaceBright: '#FFFFFF',
                surfaceContainerLowest: '#F8FBFD',
                surfaceContainerLow: '#F0F3F5',
                surfaceContainer: gray,
                surfaceContainerHigh: '#E2E6E9',
                surfaceContainerHighest: '#DDE0E3',
                onSurfaceVariant: '#848581',
                inverseSurface: dark,
                onInverseSurface: gray,
                inversePrimary: '#1F618F',
                shadow: '#000000',
                scrim: '#000000',
                surfaceTint: base,
            },
        };
    }

    // --- Widget Config ---

    private async generateWidgetConfig(
        description: string,
        cs: ColorSchemeConfig,
    ): Promise<WidgetConfig> {
        if (!this.openai) return this.fallbackWidgetConfig(cs);

        const P = cs.colorSchemeOverride;
        const sys =
            'You are a UI theming assistant. Output ONLY valid JSON (no markdown). Return the exact structure requested.';
        const user = `Create a widget config JSON for a Flutter app (WebTrit) from this description:

${description}

Keep it consistent with the palette:
primary: ${P.primary}, onPrimary: ${P.onPrimary}
surface: ${P.surface}, onSurface: ${P.onSurface}
success: ${P.tertiary}, error: ${P.error}, warning: ${cs.seedColor}

Return ONLY JSON with this structure:
{
  "fonts": { "fontFamily": "Montserrat" },
  "imageAssets": {
    "primaryOnboardingLogo": { "uri": "asset://assets/primary_onboardin_logo.svg", "widthFactor": 0.45 },
    "secondaryOnboardingLogo": { "uri": "asset://assets/secondary_onboardin_logo.svg", "widthFactor": 0.25 },
    "leadingAvatarStyle": {
      "backgroundColor": "${P.surface}",
      "radius": 20.0,
      "initialsTextStyle": { "fontFamily": "Montserrat", "fontSize": 16, "fontWeight": { "weight": 700 }, "color": "${P.inversePrimary ?? P.onSurface}" },
      "placeholderIcon": { "codePoint": "0xe497", "fontFamily": "MaterialIcons", "matchTextDirection": false },
      "loading": { "showByDefault": false, "padding": { "left": 2.0, "top": 2.0, "right": 2.0, "bottom": 2.0 }, "strokeWidth": 1.0 },
      "smartIndicator": { "backgroundColor": "${P.surfaceContainerLowest ?? '#F8FBFD'}", "icon": { "codePoint": "0xe491", "fontFamily": "MaterialIcons", "matchTextDirection": false }, "sizeFactor": 0.4 },
      "registeredBadge": { "registeredColor": null, "unregisteredColor": null, "sizeFactor": 0.2 }
    }
  },
  "dialog": {
    "snackBar": {
      "successBackgroundColor": "${P.tertiary}",
      "errorBackgroundColor": "${P.error}",
      "infoBackgroundColor": "#494949",
      "warningBackgroundColor": "${cs.seedColor}"
    }
  },
  "statuses": {
    "registrationStatuses": { "online": "${P.tertiary}", "offline": "${P.surface}" },
    "calStatuses": {
      "connectivityNone": "${P.error}",
      "connectError": "${P.error}",
      "appUnregistered": "#494949",
      "connectIssue": "${P.error}",
      "inProgress": "${P.secondary}",
      "ready": "${P.tertiary}"
    }
  },
  "decorationConfig": {
    "primaryGradientColorsConfig": {
      "colors": [
        { "color": "${P.primary}", "blend": true },
        { "color": "${P.secondary}", "blend": true }
      ]
    }
  }
}`;

        try {
            const completion = await this.openai.chat.completions.create({
                model: 'gpt-4o-mini',
                temperature: 0.2,
                messages: [
                    {role: 'system', content: sys},
                    {role: 'user', content: user},
                ],
            });

            const raw = completion.choices?.[0]?.message?.content ?? '';
            const text = this.extractJson(raw);
            const parsed = JSON.parse(text);
            const check = WidgetConfigSchema.safeParse(parsed);
            if (!check.success) return this.fallbackWidgetConfig(cs);
            return parsed as WidgetConfig;
        } catch {
            return this.fallbackWidgetConfig(cs);
        }
    }

    private fallbackWidgetConfig(cs: ColorSchemeConfig): WidgetConfig {
        const P = cs.colorSchemeOverride;
        return {
            fonts: {fontFamily: 'Montserrat'},
            imageAssets: {
                primaryOnboardingLogo: {
                    uri: 'asset://assets/primary_onboardin_logo.svg',
                    widthFactor: 0.45,
                },
                secondaryOnboardingLogo: {
                    uri: 'asset://assets/secondary_onboardin_logo.svg',
                    widthFactor: 0.25,
                },
                leadingAvatarStyle: {
                    backgroundColor: P.surface,
                    radius: 20.0,
                    initialsTextStyle: {
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: {weight: 700},
                        color: P.inversePrimary ?? '#1F618F',
                    },
                    placeholderIcon: {
                        codePoint: '0xe497',
                        fontFamily: 'MaterialIcons',
                        matchTextDirection: false,
                    },
                    loading: {
                        showByDefault: false,
                        padding: {left: 2.0, top: 2.0, right: 2.0, bottom: 2.0},
                        strokeWidth: 1.0,
                    },
                    smartIndicator: {
                        backgroundColor: P.surfaceContainerLowest ?? '#F8FBFD',
                        icon: {
                            codePoint: '0xe491',
                            fontFamily: 'MaterialIcons',
                            matchTextDirection: false,
                        },
                        sizeFactor: 0.4,
                    },
                    registeredBadge: {
                        registeredColor: null,
                        unregisteredColor: null,
                        sizeFactor: 0.2,
                    },
                },
            },
            dialog: {
                snackBar: {
                    successBackgroundColor: P.tertiary,
                    errorBackgroundColor: P.error,
                    infoBackgroundColor: '#494949',
                    warningBackgroundColor: cs.seedColor,
                },
            },
            statuses: {
                registrationStatuses: {online: P.tertiary, offline: P.surface},
                calStatuses: {
                    connectivityNone: P.error,
                    connectError: P.error,
                    appUnregistered: '#494949',
                    connectIssue: P.error,
                    inProgress: P.secondary,
                    ready: P.tertiary,
                },
            },
            decorationConfig: {
                primaryGradientColorsConfig: {
                    colors: [
                        {color: P.primary, blend: true},
                        {color: P.secondary, blend: true},
                    ],
                },
            },
        };
    }

    // --- Page Config ---

    private async generatePageConfig(
        description: string,
        cs: ColorSchemeConfig,
    ): Promise<PageConfig> {
        if (!this.openai) return this.fallbackPageConfig(cs);

        const P = cs.colorSchemeOverride;
        const sys =
            'You are a UI theming assistant. Output ONLY valid JSON (no markdown). Return the exact structure requested.';
        const user = `Create a page config JSON (WebTrit) from this description:

${description}

Keep it consistent with the palette (use these colors where appropriate):
primary: ${P.primary}, onPrimary: ${P.onPrimary}
surface: ${P.surface}, onSurface: ${P.onSurface}
error: ${P.error}, brand: ${cs.seedColor}

Return ONLY JSON with this structure:
{
  "login": {
    "modeSelect": {
      "systemUiOverlayStyle": {
        "statusBarIconBrightness": "dark",
        "statusBarBrightness": "light",
        "systemNavigationBarColor": "#000000",
        "systemNavigationBarIconBrightness": "light"
      },
      "buttonLoginStyleType": "neutralOnDark",
      "buttonSignupStyleType": "neutralOnDark"
    }
  },
  "dialing": {
    "systemUiOverlayStyle": {
      "statusBarIconBrightness": "dark",
      "statusBarBrightness": "light",
      "systemNavigationBarColor": "#000000",
      "systemNavigationBarIconBrightness": "light"
    },
    "appBarStyle": {
      "backgroundColor": null,
      "foregroundColor": null,
      "primary": false
    },
    "callInfo": {
      "usernameTextStyle": { "fontSize": 24, "fontWeight": { "weight": 400 }, "color": "#FFFFFF" },
      "numberTextStyle":   { "fontSize": 20, "fontWeight": { "weight": 400 }, "color": "${P.surface}" },
      "callStatusTextStyle": { "fontSize": 16, "fontWeight": { "weight": 400 }, "color": "${P.surface}", "fontFeatures": ["tabularFigures"] },
      "processingStatusTextStyle": { "fontSize": 14, "fontWeight": { "weight": 500 }, "color": "${P.surface}" }
    }
  }
}`;

        try {
            const completion = await this.openai.chat.completions.create({
                model: 'gpt-4o-mini',
                temperature: 0.2,
                messages: [
                    {role: 'system', content: sys},
                    {role: 'user', content: user},
                ],
            });

            const raw = completion.choices?.[0]?.message?.content ?? '';
            const text = this.extractJson(raw);
            const parsed = JSON.parse(text);
            const check = PageConfigSchema.safeParse(parsed);
            if (!check.success) return this.fallbackPageConfig(cs);
            return parsed as PageConfig;
        } catch {
            return this.fallbackPageConfig(cs);
        }
    }

    private fallbackPageConfig(cs: ColorSchemeConfig): PageConfig {
        const P = cs.colorSchemeOverride;
        return {
            login: {
                modeSelect: {
                    systemUiOverlayStyle: {
                        statusBarIconBrightness: 'dark',
                        statusBarBrightness: 'light',
                        systemNavigationBarColor: '#000000',
                        systemNavigationBarIconBrightness: 'light',
                    },
                    buttonLoginStyleType: 'neutralOnDark',
                    buttonSignupStyleType: 'neutralOnDark',
                },
            },
            dialing: {
                systemUiOverlayStyle: {
                    statusBarIconBrightness: 'dark',
                    statusBarBrightness: 'light',
                    systemNavigationBarColor: '#000000',
                    systemNavigationBarIconBrightness: 'light',
                },
                appBarStyle: {
                    backgroundColor: null,
                    foregroundColor: null,
                    primary: false,
                },
                callInfo: {
                    usernameTextStyle: {
                        fontSize: 24,
                        fontWeight: {weight: 400},
                        color: '#FFFFFF',
                    },
                    numberTextStyle: {
                        fontSize: 20,
                        fontWeight: {weight: 400},
                        color: P.surface,
                    },
                    callStatusTextStyle: {
                        fontSize: 16,
                        fontWeight: {weight: 400},
                        color: P.surface,
                        fontFeatures: ['tabularFigures'],
                    },
                    processingStatusTextStyle: {
                        fontSize: 14,
                        fontWeight: {weight: 500},
                        color: P.surface,
                    },
                },
            },
        };
    }

    private extractJson(s: string): string {
        const trimmed = s.trim();
        if (trimmed.startsWith('{') && trimmed.endsWith('}')) return trimmed;
        let depth = 0,
            start = -1;
        for (let i = 0; i < s.length; i++) {
            if (s[i] === '{') {
                if (depth === 0) start = i;
                depth++;
            } else if (s[i] === '}') {
                depth--;
                if (depth === 0 && start !== -1) return s.slice(start, i + 1);
            }
        }
        return trimmed;
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

        const now = new Date().toISOString();
        const id = (suffix: string) =>
            `${themeId}_${variant}${suffix ? '_' + suffix : ''}`;

        const csId = `${themeId}_${variant}`;
        const wcId = `${themeId}_${variant}`;
        const pcId = `${themeId}_${variant}`;

        const [csPrev, wcPrev, pcPrev] = await Promise.all([
            this.colorSchemeRepo.findById(csId).catch(() => null),
            this.widgetCfgRepo.findById(wcId).catch(() => null),
            this.pageCfgRepo.findById(pcId).catch(() => null),
        ]);

        let colorSchemeConfig =
            csPrev?.config ??
            this.fallbackColorScheme(dto.seedColorHint ?? undefined);
        let widgetConfig =
            wcPrev?.config ?? this.fallbackWidgetConfig(colorSchemeConfig);
        let pageConfig =
            pcPrev?.config ?? this.fallbackPageConfig(colorSchemeConfig);

        if (!this.openai) {

        } else {
            if (targets.includes('colorScheme')) {
                const updated = await this.nudgeColorScheme(
                    dto.prompt,
                    colorSchemeConfig,
                    dto.seedColorHint ?? undefined,
                    mode,
                );
                colorSchemeConfig = updated ?? colorSchemeConfig;
            }
            if (targets.includes('widgetConfig')) {
                const updated = await this.nudgeWidgetConfig(
                    dto.prompt,
                    widgetConfig,
                    colorSchemeConfig,
                    mode,
                );
                widgetConfig = updated ?? widgetConfig;
            }
            if (targets.includes('pageConfig')) {
                const updated = await this.nudgePageConfig(
                    dto.prompt,
                    pageConfig,
                    colorSchemeConfig,
                    mode,
                );
                pageConfig = updated ?? pageConfig;
            }
        }

        if (targets.includes('colorScheme')) {
            const entity: ColorScheme = {
                id: csId,
                applicationId,
                themeId,
                variant,
                config: colorSchemeConfig,
                createdAt: csPrev?.createdAt ?? now,
                updatedAt: now,
            };
            if (csPrev) await this.colorSchemeRepo.update(entity);
            else await this.colorSchemeRepo.create(entity);
        }

        // Widget Config
        if (targets.includes('widgetConfig')) {
            const entity: WidgetConfigEntity = {
                id: wcId,
                applicationId,
                themeId,
                variant,
                config: widgetConfig,
                createdAt: wcPrev?.createdAt ?? now,
                updatedAt: now,
            };
            if (wcPrev) await this.widgetCfgRepo.update(entity);
            else await this.widgetCfgRepo.create(entity);
        }

        if (targets.includes('pageConfig')) {
            const entity: PageConfigEntity = {
                id: pcId,
                applicationId,
                themeId,
                variant,
                config: pageConfig,
                createdAt: pcPrev?.createdAt ?? now,
                updatedAt: now,
            };
            if (pcPrev) await this.pageCfgRepo.update(entity);
            else await this.pageCfgRepo.create(entity);
        }

        return {
            theme,
            colorSchemeConfig,
            themeWidgetConfig: widgetConfig,
            themePageConfig: {[variant]: pageConfig},
            updated: targets,
            mode,
        };
    }

    private async nudgeColorScheme(
        prompt: string,
        current: ColorSchemeConfig,
        seedHint: string | undefined,
        mode: NudgeMode,
    ): Promise<ColorSchemeConfig | null> {
        const sys =
            'You are a UI theming assistant. Output ONLY valid JSON. No prose.';
        const action =
            mode === 'replace'
                ? 'Return the FULL color scheme object'
                : 'Return ONLY the partial JSON with keys to update (deep-merge patch)';

        const seedLine = seedHint ? `Prefer seedColor ${seedHint}.` : '';
        const user = `Given this color scheme (JSON) and a prompt, ${action}.
Current:
${JSON.stringify(current, null, 2)}

Prompt:
${seedLine} ${prompt}

Schema hint: { "seedColor": "#RRGGBB", "colorSchemeOverride": { <#RRGGBB fields> } }`;

        try {
            const completion = await this.openai!.chat.completions.create({
                model: 'gpt-4o-mini',
                temperature: 0.2,
                messages: [
                    {role: 'system', content: sys},
                    {role: 'user', content: user},
                ],
            });

            const raw = completion.choices?.[0]?.message?.content ?? '';
            const text = this.extractJson(raw);
            const patchObj = JSON.parse(text);

            if (mode === 'replace') {
                const parsed = ColorSchemeConfigSchema.safeParse(patchObj);
                if (!parsed.success) return null;
                return parsed.data;
            } else {
                const merged = deepMerge(structuredClone(current), patchObj);
                const parsed = ColorSchemeConfigSchema.safeParse(merged);
                return parsed.success ? parsed.data : null;
            }
        } catch {
            return null;
        }
    }

    private async nudgeWidgetConfig(
        prompt: string,
        current: any,
        cs: any,
        mode: NudgeMode,
    ) {
        const sys =
            'You are a UI theming assistant. Output ONLY valid JSON. No prose.';
        const action =
            mode === 'replace'
                ? 'Return the FULL widget config object'
                : 'Return ONLY the partial JSON with keys to update (deep-merge patch)';

        const user = `We have a Flutter(WebTrit) widget config JSON and a prompt to tweak it.
Palette (for consistency): ${JSON.stringify(cs?.colorSchemeOverride ?? {}, null, 2)}

Current widget config:
${JSON.stringify(current, null, 2)}

Prompt:
${prompt}

Return format: JSON only. ${action}.`;

        try {
            const completion = await this.openai!.chat.completions.create({
                model: 'gpt-4o-mini',
                temperature: 0.2,
                messages: [
                    {role: 'system', content: sys},
                    {role: 'user', content: user},
                ],
            });

            const raw = completion.choices?.[0]?.message?.content ?? '';
            const text = this.extractJson(raw);
            const patchObj = JSON.parse(text);
            if (mode === 'replace') return patchObj;
            return deepMerge(structuredClone(current), patchObj);
        } catch {
            return null;
        }
    }

    private async nudgePageConfig(
        prompt: string,
        current: any,
        cs: any,
        mode: NudgeMode,
    ) {
        const sys =
            'You are a UI theming assistant. Output ONLY valid JSON. No prose.';
        const action =
            mode === 'replace'
                ? 'Return the FULL page config object'
                : 'Return ONLY the partial JSON with keys to update (deep-merge patch)';

        const user = `We have a WebTrit page config JSON and a prompt to tweak it.
Palette (for consistency): ${JSON.stringify(cs?.colorSchemeOverride ?? {}, null, 2)}

Current page config:
${JSON.stringify(current, null, 2)}

Prompt:
${prompt}

Return format: JSON only. ${action}.`;

        try {
            const completion = await this.openai!.chat.completions.create({
                model: 'gpt-4o-mini',
                temperature: 0.2,
                messages: [
                    {role: 'system', content: sys},
                    {role: 'user', content: user},
                ],
            });

            const raw = completion.choices?.[0]?.message?.content ?? '';
            const text = this.extractJson(raw);
            const patchObj = JSON.parse(text);
            if (mode === 'replace') return patchObj;
            return deepMerge(structuredClone(current), patchObj);
        } catch {
            return null;
        }
    }
}
