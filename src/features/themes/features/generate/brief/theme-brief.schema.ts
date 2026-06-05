import { z } from 'zod';

/**
 * ThemeBrief — the small, high-level creative brief the LLM produces.
 *
 * The LLM does NOT emit the full theme tree (it is bad at that). It makes a
 * handful of high-level decisions; the deterministic ThemeComposer expands the
 * brief into a complete, valid theme on top of the canonical base.
 */

const Hex6 = z
  .string()
  .regex(/^#([0-9A-Fa-f]{6})$/, 'hex #RRGGBB')
  .transform((s) => s.toUpperCase());
const Hex6Opt = Hex6.nullable().optional();

export const ThemeBriefSchema = z.object({
  mood: z.enum(['light', 'dark', 'both']).default('both'),
  palette: z.object({
    seed: Hex6,
    secondary: Hex6Opt,
    tertiary: Hex6Opt,
    contrast: z.enum(['standard', 'medium', 'high']).default('standard'),
  }),
  typography: z
    .object({ fontFamily: z.string().min(1).max(60).nullable().optional() })
    .optional(),
  shape: z
    .object({ corners: z.enum(['sharp', 'rounded', 'pill']).nullable().optional() })
    .optional(),
  tabs: z
    .object({
      accentFollowsPrimary: z.boolean().default(true),
      selectedColor: Hex6Opt,
      unselectedColor: Hex6Opt,
      backgroundColor: Hex6Opt,
    })
    .optional(),
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

/**
 * JSON Schema given to the Anthropic tool (forced tool use). Mirrors the zod
 * schema above; zod is still the source of truth for validation after the call.
 */
export const THEME_BRIEF_TOOL = {
  name: 'emit_theme_brief',
  description:
    'Emit the creative brief for a mobile app theme. Choose a seed color that matches the requested brand/mood, optionally pick brand secondary/tertiary colors, a font family, corner style, tab accent colors, which uploaded asset (by id) to use for the logo/background/splash, and which features to enable.',
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
          seed: { type: 'string', description: 'Primary brand/seed color as #RRGGBB' },
          secondary: { type: ['string', 'null'], description: 'Optional brand secondary #RRGGBB' },
          tertiary: { type: ['string', 'null'], description: 'Optional brand accent #RRGGBB' },
          contrast: { type: 'string', enum: ['standard', 'medium', 'high'] },
        },
      },
      typography: {
        type: 'object',
        additionalProperties: false,
        properties: { fontFamily: { type: ['string', 'null'], description: 'Google font family name' } },
      },
      shape: {
        type: 'object',
        additionalProperties: false,
        properties: { corners: { type: ['string', 'null'], enum: ['sharp', 'rounded', 'pill', null] } },
      },
      tabs: {
        type: 'object',
        additionalProperties: false,
        properties: {
          accentFollowsPrimary: { type: 'boolean' },
          selectedColor: { type: ['string', 'null'] },
          unselectedColor: { type: ['string', 'null'] },
          backgroundColor: { type: ['string', 'null'] },
        },
      },
      assets: {
        type: 'object',
        additionalProperties: false,
        properties: {
          logoAssetId: { type: ['string', 'null'], description: 'id of an uploaded asset to use as the app logo' },
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
