import { Injectable } from '@nestjs/common';
import { deepMerge } from '../../../../../common';
import { ColorSchemeConfig } from '../schemas/color-scheme.schema';
import { PageConfig, PageConfigSchema } from '../schemas/page-config.schema';
import { NudgeMode } from '../dto/nudge-theme.dto';
import { OpenAiClientService } from './openai-client.service';

const SYSTEM_PROMPT =
    'You are a UI theming assistant for a Flutter app (WebTrit). Output ONLY valid JSON matching the requested structure. No prose, no markdown.';

@Injectable()
export class PageConfigGenerator {
    constructor(private readonly openai: OpenAiClientService) {}

    fallback(cs: ColorSchemeConfig): PageConfig {
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
                        fontWeight: { weight: 400 },
                        color: '#FFFFFF',
                    },
                    numberTextStyle: {
                        fontSize: 20,
                        fontWeight: { weight: 400 },
                        color: P.surface,
                    },
                    callStatusTextStyle: {
                        fontSize: 16,
                        fontWeight: { weight: 400 },
                        color: P.surface,
                        fontFeatures: ['tabularFigures'],
                    },
                    processingStatusTextStyle: {
                        fontSize: 14,
                        fontWeight: { weight: 500 },
                        color: P.surface,
                    },
                },
            },
        };
    }

    async generate(
        prompt: string,
        cs: ColorSchemeConfig,
    ): Promise<PageConfig> {
        if (!this.openai.isAvailable) return this.fallback(cs);

        const template = this.fallback(cs);
        const userMsg = `Create a page config JSON for a Flutter app (WebTrit) based on this description:

${prompt}

Use this as the structural template (fill/adjust values based on the description and palette):
${JSON.stringify(template, null, 2)}

Return JSON with the same structure.
- systemUiOverlayStyle brightness fields: "light" or "dark"
- buttonStyleType values: "primary" | "neutral" | "primaryOnDark" | "neutralOnDark"
- Color fields must be #RRGGBB hex strings or null.`;

        const result = await this.openai.chatJson([
            { role: 'system', content: SYSTEM_PROMPT },
            { role: 'user', content: userMsg },
        ]);

        if (!result) return this.fallback(cs);

        const check = PageConfigSchema.safeParse(result);
        if (!check.success) return this.fallback(cs);

        return check.data as PageConfig;
    }

    async nudge(
        prompt: string,
        current: PageConfig,
        cs: ColorSchemeConfig,
        mode: NudgeMode,
    ): Promise<PageConfig | null> {
        if (!this.openai.isAvailable) return null;

        const action =
            mode === 'replace'
                ? 'Return the FULL page config object'
                : 'Return ONLY the partial JSON with keys to update (deep-merge patch)';

        const userMsg = `We have a WebTrit page config JSON and a prompt to tweak it.
Palette: ${JSON.stringify(cs.colorSchemeOverride, null, 2)}

Current page config:
${JSON.stringify(current, null, 2)}

Prompt: ${prompt}

${action}.`;

        const result = await this.openai.chatJson([
            { role: 'system', content: SYSTEM_PROMPT },
            { role: 'user', content: userMsg },
        ]);

        if (!result) return null;

        if (mode === 'replace') return result as PageConfig;
        return deepMerge(structuredClone(current) as Record<string, any>, result) as PageConfig;
    }
}
