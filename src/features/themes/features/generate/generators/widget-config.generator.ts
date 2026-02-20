import { Injectable } from '@nestjs/common';
import { deepMerge } from '../../../../../common';
import { ColorSchemeConfig } from '../schemas/color-scheme.schema';
import { WidgetConfig, WidgetConfigSchema } from '../schemas/widget-config.schema';
import { NudgeMode } from '../dto/nudge-theme.dto';
import { OpenAiClientService } from './openai-client.service';

const SYSTEM_PROMPT =
    'You are a UI theming assistant for a Flutter app (WebTrit). Output ONLY valid JSON matching the requested structure. No prose, no markdown.';

@Injectable()
export class WidgetConfigGenerator {
    constructor(private readonly openai: OpenAiClientService) {}

    fallback(cs: ColorSchemeConfig): WidgetConfig {
        const P = cs.colorSchemeOverride;
        return {
            fonts: { fontFamily: 'Montserrat' },
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
                        fontWeight: { weight: 700 },
                        color: P.inversePrimary ?? '#1F618F',
                    },
                    placeholderIcon: {
                        codePoint: '0xe497',
                        fontFamily: 'MaterialIcons',
                        matchTextDirection: false,
                    },
                    loading: {
                        showByDefault: false,
                        padding: { left: 2.0, top: 2.0, right: 2.0, bottom: 2.0 },
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
                registrationStatuses: { online: P.tertiary, offline: P.surface },
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
                        { color: P.primary, blend: true },
                        { color: P.secondary, blend: true },
                    ],
                },
            },
        };
    }

    async generate(
        prompt: string,
        cs: ColorSchemeConfig,
    ): Promise<WidgetConfig> {
        if (!this.openai.isAvailable) return this.fallback(cs);

        const template = this.fallback(cs);
        const userMsg = `Create a widget config JSON for a Flutter app (WebTrit) based on this description:

${prompt}

Use this as the structural template (fill/adjust values based on the description and palette):
${JSON.stringify(template, null, 2)}

Return JSON with the same structure. All color fields must be #RRGGBB hex strings or null.`;

        const result = await this.openai.chatJson([
            { role: 'system', content: SYSTEM_PROMPT },
            { role: 'user', content: userMsg },
        ]);

        if (!result) return this.fallback(cs);

        const check = WidgetConfigSchema.safeParse(result);
        if (!check.success) return this.fallback(cs);

        return check.data as WidgetConfig;
    }

    async nudge(
        prompt: string,
        current: WidgetConfig,
        cs: ColorSchemeConfig,
        mode: NudgeMode,
    ): Promise<WidgetConfig | null> {
        if (!this.openai.isAvailable) return null;

        const action =
            mode === 'replace'
                ? 'Return the FULL widget config object'
                : 'Return ONLY the partial JSON with keys to update (deep-merge patch)';

        const userMsg = `We have a Flutter (WebTrit) widget config JSON and a prompt to tweak it.
Palette: ${JSON.stringify(cs.colorSchemeOverride, null, 2)}

Current widget config:
${JSON.stringify(current, null, 2)}

Prompt: ${prompt}

${action}.`;

        const result = await this.openai.chatJson([
            { role: 'system', content: SYSTEM_PROMPT },
            { role: 'user', content: userMsg },
        ]);

        if (!result) return null;

        if (mode === 'replace') return result as WidgetConfig;
        return deepMerge(structuredClone(current) as Record<string, any>, result) as WidgetConfig;
    }
}
