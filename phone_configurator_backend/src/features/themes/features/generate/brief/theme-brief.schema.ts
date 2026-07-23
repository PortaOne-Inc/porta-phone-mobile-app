import { z } from 'zod';

/**
 * ThemeBrief — the structured creative brief the LLM produces from a prompt.
 *
 * It captures both high-level intent (seed, mood, shape) AND explicit design
 * decisions extracted from rich prompts: exact semantic colors, a success/accent
 * channel, typography weights/colors, and precise Material-role overrides. The
 * deterministic ThemeComposer honors explicit values first and falls back to an
 * M3 palette derived from the seed for anything left unspecified.
 */

const Hex6 = z
  .string()
  .regex(/^#([0-9A-Fa-f]{6})$/, 'hex #RRGGBB')
  .transform((s) => s.toUpperCase());
const Hex6Opt = Hex6.nullable().optional();
const Weight = z.number().int().min(100).max(900).nullable().optional();

/** Exact Material 3 color roles the LLM may override directly (highest priority). */
export const COLOR_ROLE_KEYS = [
  'primary', 'onPrimary', 'primaryContainer', 'onPrimaryContainer',
  'secondary', 'onSecondary', 'secondaryContainer', 'onSecondaryContainer',
  'tertiary', 'onTertiary', 'tertiaryContainer', 'onTertiaryContainer',
  'error', 'onError', 'errorContainer', 'onErrorContainer',
  'outline', 'outlineVariant',
  'surface', 'onSurface', 'surfaceDim', 'surfaceBright',
  'surfaceContainerLowest', 'surfaceContainerLow', 'surfaceContainer',
  'surfaceContainerHigh', 'surfaceContainerHighest',
  'onSurfaceVariant', 'inverseSurface', 'onInverseSurface', 'inversePrimary',
  'surfaceTint',
] as const;

export const ThemeBriefSchema = z.object({
  mood: z.enum(['light', 'dark', 'both']).default('both'),
  palette: z.object({
    seed: Hex6, // brand/main color; the M3 fallback palette is derived from it
    brand: Hex6Opt, // CTA / primary if different from seed
    secondary: Hex6Opt,
    tertiary: Hex6Opt,
    background: Hex6Opt, // app background (e.g. white)
    surface: Hex6Opt, // surfaces / low containers
    container: Hex6Opt, // soft cards / highlight containers (e.g. lavender)
    textStrong: Hex6Opt, // headings / primary text (e.g. off-black)
    textMuted: Hex6Opt, // secondary text
    success: Hex6Opt, // success / positive accent (e.g. green)
    error: Hex6Opt,
    contrast: z.enum(['standard', 'medium', 'high']).default('standard'),
  }),
  typography: z
    .object({
      fontFamily: z.string().min(1).max(60).nullable().optional(),
      headingWeight: Weight, // e.g. 700–900 for bold headings
      bodyWeight: Weight,
      headingColor: Hex6Opt,
      bodyColor: Hex6Opt,
    })
    .optional(),
  shape: z
    .object({
      corners: z.enum(['sharp', 'rounded', 'pill']).nullable().optional(),
      radius: z.number().min(0).max(40).nullable().optional(),
    })
    .optional(),
  style: z
    .object({
      // How prominent surfaces (login/hero) should be treated, inferred from the
      // reference's dominant look:
      //  - 'airy'    : light/white-dominant, brand used only as accent
      //  - 'branded' : brand color fills large surfaces (bold / colorful brand)
      //  - 'solid'   : flat single background color
      heroStyle: z.enum(['airy', 'branded', 'solid']).nullable().optional(),
    })
    .optional(),
  tabs: z
    .object({
      accentFollowsPrimary: z.boolean().default(true),
      selectedColor: Hex6Opt,
      unselectedColor: Hex6Opt,
      backgroundColor: Hex6Opt,
    })
    .optional(),
  /** Exact Material-role → hex overrides; applied last, above everything. */
  colorRoles: z.record(Hex6).optional(),
  assets: z
    .object({
      logoAssetId: z.string().nullable().optional(),
      backgroundAssetId: z.string().nullable().optional(),
      splashForegroundAssetId: z.string().nullable().optional(),
    })
    .optional(),
  features: z
    .object({
      video: z.boolean().default(true),
      messaging: z.boolean().default(true),
      systemNotifications: z.boolean().default(true),
      hybridPresence: z.boolean().default(true),
    })
    .optional(),
  notes: z.string().max(500).nullable().optional(),
});

export type ThemeBrief = z.infer<typeof ThemeBriefSchema>;

const hexProp = (description: string) => ({ type: ['string', 'null'], description });

/**
 * JSON Schema for the Anthropic tool (forced tool use). Mirrors the zod schema;
 * zod remains the source of truth for validation after the call.
 */
export const THEME_BRIEF_TOOL = {
  name: 'emit_theme_brief',
  description:
    'Emit a structured theme brief extracted from the description. Honor EXACT colors when the prompt gives hex values; otherwise pick sensible ones. The target is a mobile softphone app UI — map the prompt\'s design LANGUAGE (palette, typography, shape), not page-layout/landing structure.',
  input_schema: {
    type: 'object',
    additionalProperties: false,
    required: ['mood', 'palette'],
    properties: {
      mood: { type: 'string', enum: ['light', 'dark', 'both'] },
      palette: {
        type: 'object',
        additionalProperties: false,
        required: ['seed'],
        properties: {
          seed: { type: 'string', description: 'Brand/main color #RRGGBB (not near-white/near-black)' },
          brand: hexProp('CTA/primary color if different from seed'),
          secondary: hexProp('secondary brand color'),
          tertiary: hexProp('tertiary accent'),
          background: hexProp('app background, e.g. white #FFFFFF'),
          surface: hexProp('surface / low container color'),
          container: hexProp('soft card / highlight container, e.g. lavender'),
          textStrong: hexProp('heading/primary text, e.g. off-black #1A1A1A'),
          textMuted: hexProp('secondary/muted text'),
          success: hexProp('success/positive accent, e.g. green'),
          error: hexProp('error color'),
          contrast: { type: 'string', enum: ['standard', 'medium', 'high'] },
        },
      },
      typography: {
        type: 'object',
        additionalProperties: false,
        properties: {
          fontFamily: { type: ['string', 'null'], description: 'Google Fonts family name' },
          headingWeight: { type: ['integer', 'null'], description: 'heading font weight 100-900' },
          bodyWeight: { type: ['integer', 'null'], description: 'body font weight 100-900' },
          headingColor: hexProp('heading text color'),
          bodyColor: hexProp('body text color'),
        },
      },
      shape: {
        type: 'object',
        additionalProperties: false,
        properties: {
          corners: { type: ['string', 'null'], enum: ['sharp', 'rounded', 'pill', null] },
          radius: { type: ['number', 'null'], description: 'explicit corner radius in dp (0-40)' },
        },
      },
      style: {
        type: 'object',
        additionalProperties: false,
        properties: {
          heroStyle: {
            type: ['string', 'null'],
            enum: ['airy', 'branded', 'solid', null],
            description:
              "Login/hero surface treatment from the reference's dominant look: 'airy' = light/white-dominant with brand as accent; 'branded' = brand color fills large surfaces; 'solid' = flat single background.",
          },
        },
      },
      tabs: {
        type: 'object',
        additionalProperties: false,
        properties: {
          accentFollowsPrimary: { type: 'boolean' },
          selectedColor: hexProp('selected tab color'),
          unselectedColor: hexProp('unselected tab color'),
          backgroundColor: hexProp('tab bar background'),
        },
      },
      colorRoles: {
        type: 'object',
        description: 'Optional exact Material-3 role overrides, role name -> #RRGGBB (e.g. {"onSurface":"#1A1A1A"}).',
        additionalProperties: { type: 'string' },
      },
      assets: {
        type: 'object',
        additionalProperties: false,
        properties: {
          logoAssetId: { type: ['string', 'null'], description: 'id of an uploaded asset to use as the logo' },
          backgroundAssetId: { type: ['string', 'null'] },
          splashForegroundAssetId: { type: ['string', 'null'] },
        },
      },
      features: {
        type: 'object',
        additionalProperties: false,
        properties: {
          video: { type: 'boolean' },
          messaging: { type: 'boolean' },
          systemNotifications: { type: 'boolean' },
          hybridPresence: { type: 'boolean' },
        },
      },
      notes: { type: ['string', 'null'] },
    },
  },
} as const;
