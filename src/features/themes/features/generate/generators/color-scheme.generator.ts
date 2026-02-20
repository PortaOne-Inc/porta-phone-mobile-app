import { Injectable } from '@nestjs/common';
import { deepMerge } from '../../../../../common';
import {
    ColorSchemeConfig,
    ColorSchemeConfigSchema,
} from '../schemas/color-scheme.schema';
import { NudgeMode } from '../dto/nudge-theme.dto';
import { OpenAiClientService } from './openai-client.service';

const SYSTEM_PROMPT =
    'You are a UI theming assistant. Output ONLY valid JSON matching the required schema exactly. No prose, no markdown.';

const SCHEMA_HINT = `{
  "seedColor": "#RRGGBB",
  "colorSchemeOverride": {
    "primary": "#RRGGBB",
    "onPrimary": "#RRGGBB",
    "primaryContainer": "#RRGGBB",
    "onPrimaryContainer": "#RRGGBB",
    "primaryFixed": "#RRGGBB",
    "primaryFixedDim": "#RRGGBB",
    "onPrimaryFixed": "#RRGGBB",
    "onPrimaryFixedVariant": "#RRGGBB",
    "secondary": "#RRGGBB",
    "onSecondary": "#RRGGBB",
    "secondaryContainer": "#RRGGBB",
    "onSecondaryContainer": "#RRGGBB",
    "secondaryFixed": "#RRGGBB",
    "secondaryFixedDim": "#RRGGBB",
    "onSecondaryFixed": "#RRGGBB",
    "onSecondaryFixedVariant": "#RRGGBB",
    "tertiary": "#RRGGBB",
    "onTertiary": "#RRGGBB",
    "tertiaryContainer": "#RRGGBB",
    "onTertiaryContainer": "#RRGGBB",
    "tertiaryFixed": "#RRGGBB",
    "tertiaryFixedDim": "#RRGGBB",
    "onTertiaryFixed": "#RRGGBB",
    "onTertiaryFixedVariant": "#RRGGBB",
    "error": "#RRGGBB",
    "onError": "#RRGGBB",
    "errorContainer": "#RRGGBB",
    "onErrorContainer": "#RRGGBB",
    "outline": "#RRGGBB",
    "outlineVariant": "#RRGGBB",
    "surface": "#RRGGBB",
    "onSurface": "#RRGGBB",
    "surfaceDim": "#RRGGBB",
    "surfaceBright": "#RRGGBB",
    "surfaceContainerLowest": "#RRGGBB",
    "surfaceContainerLow": "#RRGGBB",
    "surfaceContainer": "#RRGGBB",
    "surfaceContainerHigh": "#RRGGBB",
    "surfaceContainerHighest": "#RRGGBB",
    "onSurfaceVariant": "#RRGGBB",
    "inverseSurface": "#RRGGBB",
    "onInverseSurface": "#RRGGBB",
    "inversePrimary": "#RRGGBB",
    "shadow": "#RRGGBB",
    "scrim": "#RRGGBB",
    "surfaceTint": "#RRGGBB"
  }
}`;

@Injectable()
export class ColorSchemeGenerator {
    constructor(private readonly openai: OpenAiClientService) {}

    async generate(
        prompt: string,
        seedColor?: string,
    ): Promise<ColorSchemeConfig> {
        if (!this.openai.isAvailable) return this.fallback(seedColor);

        const userMsg =
            (seedColor ? `Use seedColor=${seedColor}. ` : '') +
            `Create a complete Material 3 color scheme for a mobile app based on this description:\n${prompt}\n\nReturn JSON matching this schema exactly:\n${SCHEMA_HINT}`;

        const result = await this.openai.chatJson([
            { role: 'system', content: SYSTEM_PROMPT },
            { role: 'user', content: userMsg },
        ]);

        if (!result) return this.fallback(seedColor);

        const check = ColorSchemeConfigSchema.safeParse(result);
        if (!check.success) return this.fallback(seedColor);

        return {
            seedColor: seedColor ?? check.data.seedColor,
            colorSchemeOverride: check.data.colorSchemeOverride,
        };
    }

    async nudge(
        prompt: string,
        current: ColorSchemeConfig,
        mode: NudgeMode,
        seedHint?: string,
    ): Promise<ColorSchemeConfig | null> {
        if (!this.openai.isAvailable) return null;

        const action =
            mode === 'replace'
                ? 'Return the FULL color scheme object'
                : 'Return ONLY the partial JSON with keys to update (deep-merge patch)';

        const seedLine = seedHint ? `Prefer seedColor ${seedHint}.` : '';
        const userMsg = `Given this color scheme and a prompt, ${action}.
Current:
${JSON.stringify(current, null, 2)}

Prompt:
${seedLine} ${prompt}

Schema: ${SCHEMA_HINT}`;

        const result = await this.openai.chatJson([
            { role: 'system', content: SYSTEM_PROMPT },
            { role: 'user', content: userMsg },
        ]);

        if (!result) return null;

        if (mode === 'replace') {
            const parsed = ColorSchemeConfigSchema.safeParse(result);
            return parsed.success ? parsed.data : null;
        } else {
            const merged = deepMerge(structuredClone(current), result);
            const parsed = ColorSchemeConfigSchema.safeParse(merged);
            return parsed.success ? parsed.data : null;
        }
    }

    fallback(seed?: string): ColorSchemeConfig {
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
}
