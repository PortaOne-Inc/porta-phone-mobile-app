import { Injectable, Logger } from '@nestjs/common';
import { AnthropicClientService } from '../generators/anthropic-client.service';
import { AssetCatalogItem } from '../compose/asset-catalog.service';
import { ThemeBrief, ThemeBriefSchema, THEME_BRIEF_TOOL } from './theme-brief.schema';

const SYSTEM_PROMPT = `You are a senior mobile UI theming designer for the WebTrit Flutter softphone app.
Your job is to translate a free-text description into a compact, structured theme brief by calling the emit_theme_brief tool.

Guidelines:
- Pick a single seed color (#RRGGBB) that best captures the requested brand/mood. The full Material 3 palette (light + dark) is derived deterministically from it, so choose the brand's main color, not a near-white or near-black.
- Only set secondary/tertiary when the description clearly implies specific brand accent colors.
- mood: "both" unless the user explicitly wants only light or only dark.
- typography.fontFamily: a real Google Fonts family name only when the description implies a style (e.g. "modern", "elegant"); otherwise leave null.
- shape.corners: "sharp" | "rounded" | "pill" to match the described feel.
- tabs: set accentFollowsPrimary true unless specific tab colors are requested.
- assets: choose ids ONLY from the provided asset catalog; match by role (logo/background/splash). Use null when nothing fits. Never invent ids.
- features: default everything enabled; disable only what the description explicitly excludes.
Output is consumed by code, not shown to a human — call the tool and nothing else.`;

@Injectable()
export class BriefGeneratorService {
  private readonly logger = new Logger(BriefGeneratorService.name);

  constructor(private readonly anthropic: AnthropicClientService) {}

  /**
   * Produce a validated ThemeBrief. Returns the deterministic fallback brief
   * (seed-only) when the LLM is unavailable or returns something invalid.
   */
  async generate(
    prompt: string,
    seedHint: string | undefined,
    catalog: AssetCatalogItem[],
  ): Promise<{ brief: ThemeBrief; llmUsed: boolean }> {
    const fallback = this.fallback(seedHint);
    if (!this.anthropic.isAvailable) return { brief: fallback, llmUsed: false };

    const catalogText = catalog.length
      ? catalog.map((a) => `- id=${a.id} name="${a.name}" role=${a.roleGuess} mime=${a.mime}`).join('\n')
      : '(no uploaded assets available)';

    const userPrompt = [
      seedHint ? `Preferred seed color: ${seedHint}.` : '',
      'Description:',
      prompt.trim(),
      '',
      'Available uploaded assets (pick ids only from this list, or null):',
      catalogText,
    ]
      .filter(Boolean)
      .join('\n');

    const raw = await this.anthropic.extract(SYSTEM_PROMPT, userPrompt, THEME_BRIEF_TOOL);
    if (!raw) return { brief: fallback, llmUsed: false };

    const parsed = ThemeBriefSchema.safeParse(raw);
    if (!parsed.success) {
      this.logger.warn(`ThemeBrief validation failed: ${parsed.error.message}`);
      return { brief: fallback, llmUsed: false };
    }

    // Drop any hallucinated asset ids that are not in the real catalog.
    const valid = new Set(catalog.map((a) => a.id));
    const brief = parsed.data;
    if (brief.assets) {
      for (const k of ['logoAssetId', 'backgroundAssetId', 'splashForegroundAssetId'] as const) {
        const v = brief.assets[k];
        if (v && !valid.has(v)) brief.assets[k] = null;
      }
    }
    return { brief, llmUsed: true };
  }

  /** Seed-only brief used when no LLM is available. */
  fallback(seedHint?: string): ThemeBrief {
    return ThemeBriefSchema.parse({
      mood: 'both',
      palette: { seed: seedHint ?? '#5CACE3', contrast: 'standard' },
      tabs: { accentFollowsPrimary: true },
      features: { video: true, messaging: true, systemNotifications: true, hybridPresence: true },
    });
  }
}
