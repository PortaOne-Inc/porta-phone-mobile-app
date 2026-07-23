import { Injectable, Logger } from '@nestjs/common';
import { AnthropicClientService } from '../generators/anthropic-client.service';
import { AssetCatalogItem } from '../compose/asset-catalog.service';
import { ThemeBrief, ThemeBriefSchema, THEME_BRIEF_TOOL, COLOR_ROLE_KEYS } from './theme-brief.schema';

const SYSTEM_PROMPT = `You are a senior mobile UI theming designer for the WebTrit Flutter softphone app.
Translate a free-text design description into a structured theme brief by calling the emit_theme_brief tool.

The target is a MOBILE softphone app (call screens, keypad, contacts, tabs, dialogs) — NOT a web/landing page.
When a prompt describes a website/landing, extract only its design LANGUAGE (palette, typography, shape, mood)
and ignore layout/structure concepts (hero sections, cards with illustrations, photos) that don't exist in the app.

Extract as much as the prompt specifies — do not collapse a rich description into a single seed color:
- palette.seed: the brand's main color (#RRGGBB), never near-white/near-black. The M3 fallback palette is derived from it.
- HONOR EXACT COLORS: when the prompt gives explicit hex values or clear named colors, set the matching fields:
  • brand (CTA/primary), secondary, tertiary
  • background (e.g. white), surface, container (soft cards/highlights, e.g. lavender)
  • textStrong (headings/primary text, e.g. off-black #1A1A1A), textMuted (secondary text)
  • success (positive/green accent — set this whenever the prompt mentions green checks/success)
  • error
  Anything you don't specify is auto-derived from the seed, so specifying matters.
- colorRoles: for precise control, set exact Material-3 roles directly (e.g. {"onSurface":"#1A1A1A","secondaryContainer":"#F3F0FF"}). Use real role names only.
- typography: fontFamily (real Google Fonts name), headingWeight (e.g. 800 for "huge bold headings"), bodyWeight, headingColor, bodyColor.
- shape.corners ("sharp"|"rounded"|"pill") and/or shape.radius (dp) to match the described feel ("rounded cards" -> rounded/larger radius).
- style.heroStyle: judge the reference's DOMINANT look and set it — "airy" for white/light-dominant designs where the brand is only an accent (lots of white space); "branded" when the brand color fills large surfaces (bold/colorful brand); "solid" for a flat single-color background. This controls whether login/hero screens are light-and-airy or brand-filled.
- mood: "both" unless the prompt explicitly wants only light or only dark.
- tabs: accentFollowsPrimary true unless specific tab colors are requested.
- assets: choose ids ONLY from the provided catalog (match by role); null if nothing fits. Never invent ids.
- features: everything enabled; disable only what the prompt explicitly excludes.
Output is consumed by code, not a human — call the tool and nothing else.`;

@Injectable()
export class BriefGeneratorService {
  private readonly logger = new Logger(BriefGeneratorService.name);
  private readonly roleKeys = new Set<string>(COLOR_ROLE_KEYS);

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

    const brief = parsed.data;

    // Drop colorRoles that aren't real Material roles (hallucinated keys).
    if (brief.colorRoles) {
      brief.colorRoles = Object.fromEntries(
        Object.entries(brief.colorRoles).filter(([k]) => this.roleKeys.has(k)),
      );
    }

    // Drop any hallucinated asset ids that are not in the real catalog.
    const valid = new Set(catalog.map((a) => a.id));
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
