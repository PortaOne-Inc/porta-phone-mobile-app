/**
 * Self-contained Material-3-style tonal palette generator.
 *
 * The previous generator asked the LLM to free-hand ~45 hex colors, which
 * produced disharmonious palettes. Instead we derive every Material 3 color
 * role deterministically from a single seed color (plus optional brand
 * secondary/tertiary), for BOTH light and dark variants — the same idea as
 * Flutter's `ColorScheme.fromSeed`.
 *
 * Pure, dependency-free (CommonJS / Node 20 safe). Output keys match
 * `ColorSchemeOverrideSchema` exactly.
 */

export type Hsl = { h: number; s: number; l: number };
type Pal = { h: number; s: number };
type PalKey = 'P' | 'S' | 'T' | 'N' | 'NV' | 'E';
type ToneMap = Record<string, [PalKey, number]>;

const clamp = (v: number, lo: number, hi: number) => Math.min(hi, Math.max(lo, v));
const clamp01 = (v: number) => clamp(v, 0, 1);

export function hexToHsl(hex: string): Hsl {
  const m = hex.replace('#', '');
  const r = parseInt(m.slice(0, 2), 16) / 255;
  const g = parseInt(m.slice(2, 4), 16) / 255;
  const b = parseInt(m.slice(4, 6), 16) / 255;
  const max = Math.max(r, g, b);
  const min = Math.min(r, g, b);
  const d = max - min;
  let h = 0;
  if (d !== 0) {
    if (max === r) h = ((g - b) / d) % 6;
    else if (max === g) h = (b - r) / d + 2;
    else h = (r - g) / d + 4;
    h *= 60;
    if (h < 0) h += 360;
  }
  const l = (max + min) / 2;
  const s = d === 0 ? 0 : d / (1 - Math.abs(2 * l - 1));
  return { h, s, l };
}

function hslToHex(h: number, s: number, l: number): string {
  s = clamp01(s);
  l = clamp01(l);
  const c = (1 - Math.abs(2 * l - 1)) * s;
  const hp = ((h % 360) + 360) % 360 / 60;
  const x = c * (1 - Math.abs((hp % 2) - 1));
  let r = 0;
  let g = 0;
  let b = 0;
  if (hp >= 0 && hp < 1) [r, g, b] = [c, x, 0];
  else if (hp < 2) [r, g, b] = [x, c, 0];
  else if (hp < 3) [r, g, b] = [0, c, x];
  else if (hp < 4) [r, g, b] = [0, x, c];
  else if (hp < 5) [r, g, b] = [x, 0, c];
  else [r, g, b] = [c, 0, x];
  const m = l - c / 2;
  const to = (v: number) =>
    Math.round(clamp01(v + m) * 255)
      .toString(16)
      .padStart(2, '0')
      .toUpperCase();
  return `#${to(r)}${to(g)}${to(b)}`;
}

/** A single tone (0..100) of a palette, with chroma damped near the extremes. */
function tone(p: Pal, t: number): string {
  let s = p.s;
  if (t <= 4 || t >= 96) s *= 0.08;
  else if (t <= 12 || t >= 88) s *= 0.5;
  return hslToHex(p.h, s, t / 100);
}

function buildPalettes(seed: string, secondary?: string | null, tertiary?: string | null) {
  const base = hexToHsl(seed);
  const sec = secondary ? hexToHsl(secondary) : null;
  const ter = tertiary ? hexToHsl(tertiary) : null;
  const palettes: Record<PalKey, Pal> = {
    P: { h: base.h, s: clamp(base.s, 0.35, 0.95) },
    S: sec ? { h: sec.h, s: clamp(sec.s, 0.12, 0.6) } : { h: base.h, s: clamp(base.s * 0.45, 0.12, 0.5) },
    T: ter ? { h: ter.h, s: clamp(ter.s, 0.18, 0.7) } : { h: (base.h + 60) % 360, s: clamp(base.s * 0.6, 0.18, 0.7) },
    N: { h: base.h, s: 0.04 },
    NV: { h: base.h, s: 0.1 },
    E: { h: 10, s: 0.72 },
  };
  return palettes;
}

const TONES_LIGHT: ToneMap = {
  primary: ['P', 40], onPrimary: ['P', 100], primaryContainer: ['P', 90], onPrimaryContainer: ['P', 10],
  primaryFixed: ['P', 90], primaryFixedDim: ['P', 80], onPrimaryFixed: ['P', 10], onPrimaryFixedVariant: ['P', 30],
  secondary: ['S', 40], onSecondary: ['S', 100], secondaryContainer: ['S', 90], onSecondaryContainer: ['S', 10],
  secondaryFixed: ['S', 90], secondaryFixedDim: ['S', 80], onSecondaryFixed: ['S', 10], onSecondaryFixedVariant: ['S', 30],
  tertiary: ['T', 40], onTertiary: ['T', 100], tertiaryContainer: ['T', 90], onTertiaryContainer: ['T', 10],
  tertiaryFixed: ['T', 90], tertiaryFixedDim: ['T', 80], onTertiaryFixed: ['T', 10], onTertiaryFixedVariant: ['T', 30],
  error: ['E', 40], onError: ['E', 100], errorContainer: ['E', 90], onErrorContainer: ['E', 10],
  outline: ['NV', 50], outlineVariant: ['NV', 80],
  surface: ['N', 98], onSurface: ['N', 10], surfaceDim: ['N', 87], surfaceBright: ['N', 98],
  surfaceContainerLowest: ['N', 100], surfaceContainerLow: ['N', 96], surfaceContainer: ['N', 94],
  surfaceContainerHigh: ['N', 92], surfaceContainerHighest: ['N', 90],
  onSurfaceVariant: ['NV', 30], inverseSurface: ['N', 20], onInverseSurface: ['N', 95], inversePrimary: ['P', 80],
  shadow: ['N', 0], scrim: ['N', 0], surfaceTint: ['P', 40],
};

const TONES_DARK: ToneMap = {
  primary: ['P', 80], onPrimary: ['P', 20], primaryContainer: ['P', 30], onPrimaryContainer: ['P', 90],
  primaryFixed: ['P', 90], primaryFixedDim: ['P', 80], onPrimaryFixed: ['P', 10], onPrimaryFixedVariant: ['P', 30],
  secondary: ['S', 80], onSecondary: ['S', 20], secondaryContainer: ['S', 30], onSecondaryContainer: ['S', 90],
  secondaryFixed: ['S', 90], secondaryFixedDim: ['S', 80], onSecondaryFixed: ['S', 10], onSecondaryFixedVariant: ['S', 30],
  tertiary: ['T', 80], onTertiary: ['T', 20], tertiaryContainer: ['T', 30], onTertiaryContainer: ['T', 90],
  tertiaryFixed: ['T', 90], tertiaryFixedDim: ['T', 80], onTertiaryFixed: ['T', 10], onTertiaryFixedVariant: ['T', 30],
  error: ['E', 80], onError: ['E', 20], errorContainer: ['E', 30], onErrorContainer: ['E', 90],
  outline: ['NV', 60], outlineVariant: ['NV', 30],
  surface: ['N', 6], onSurface: ['N', 90], surfaceDim: ['N', 6], surfaceBright: ['N', 24],
  surfaceContainerLowest: ['N', 4], surfaceContainerLow: ['N', 10], surfaceContainer: ['N', 12],
  surfaceContainerHigh: ['N', 17], surfaceContainerHighest: ['N', 22],
  onSurfaceVariant: ['NV', 80], inverseSurface: ['N', 90], onInverseSurface: ['N', 20], inversePrimary: ['P', 40],
  shadow: ['N', 0], scrim: ['N', 0], surfaceTint: ['P', 80],
};

function buildOverride(palettes: Record<PalKey, Pal>, map: ToneMap): Record<string, string> {
  const out: Record<string, string> = {};
  for (const [role, [pal, t]] of Object.entries(map)) {
    out[role] = tone(palettes[pal], t);
  }
  return out;
}

export interface PaletteResult {
  light: Record<string, string>;
  dark: Record<string, string>;
}

/** Generate the full light + dark color role maps from a seed color. */
export function generatePalette(
  seed: string,
  opts?: { secondary?: string | null; tertiary?: string | null },
): PaletteResult {
  const palettes = buildPalettes(seed, opts?.secondary, opts?.tertiary);
  return {
    light: buildOverride(palettes, TONES_LIGHT),
    dark: buildOverride(palettes, TONES_DARK),
  };
}
