import { z } from 'zod';

export const Hex = z.string().regex(/^#([0-9A-Fa-f]{6})$/, 'hex #RRGGBB');
export const HexOpt = Hex.optional().nullable();

export const ColorSchemeOverrideSchema = z.object({
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
});

export const ColorSchemeConfigSchema = z.object({
    seedColor: Hex,
    colorSchemeOverride: ColorSchemeOverrideSchema,
});

export type ColorSchemeOverride = z.infer<typeof ColorSchemeOverrideSchema>;
export type ColorSchemeConfig = z.infer<typeof ColorSchemeConfigSchema>;
