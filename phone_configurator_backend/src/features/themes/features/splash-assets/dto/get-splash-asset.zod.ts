import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const SplashFitZ = z.enum([
  'fill',
  'contain',
  'cover',
  'fitWidth',
  'fitHeight',
  'none',
  'scaleDown',
]);
export type SplashFit = z.infer<typeof SplashFitZ>;

export const SplashModeZ = z.enum(['withBackground', 'withoutBackground']);
export type SplashMode = z.infer<typeof SplashModeZ>;

export const SplashSourceZ = z
  .object({
    foregroundAssetId: z.string().optional(),
    backgroundAssetId: z.string().optional(),
    backgroundColorHex: z.string().nullable().optional(),
  })
  .partial();

export const SplashParamsZ = z
  .object({
    fit: SplashFitZ.optional(),
    paddingDp: z.number().optional(),
    padding: z.number().optional(),
    backgroundColorHex: z.string().optional(),
  })
  .partial();

export const SplashOutputArtifactsZ = z
  .object({
    splashArtifactId: z.string().optional(),
    android12SplashArtifactId: z.string().optional(),
  })
  .partial();

export const SplashUrlsZ = z
  .object({
    splashUrl: z.string().url().optional(),
    android12SplashUrl: z.string().url().optional(),
  })
  .partial();

export const SplashValidationBlockZ = z.object({
  compliant: z.boolean(),
  deltaDp: z.number(),
  message: z.string(),
  toleranceDp: z.number().optional(),
});

export const SplashValidationEnvelopeZ = z.object({
  mode: SplashModeZ,
  fullSizeDp: z.number(),
  maskDiameterDp: z.number(),
  circleDiameterDp: z.number().optional(),
  recommendedPaddingDp: z.number(),
  recommendationBasis: z.literal('safeZone'),
  validation: SplashValidationBlockZ,
});

export const GetSplashAssetZ = z.object({
  id: z.string(),
  applicationId: z.string(),
  themeId: z.string(),
  mode: SplashModeZ,
  createdAt: z.string(), // ISO
  updatedAt: z.string(), // ISO

  source: SplashSourceZ.optional(),
  params: SplashParamsZ.optional(),
  outputsArtifacts: SplashOutputArtifactsZ.optional(),

  urls: SplashUrlsZ.optional(),
  validation: SplashValidationEnvelopeZ.optional(),
  android12Validation: SplashValidationEnvelopeZ.optional(),
});

export class GetSplashAssetDto extends createZodDto(GetSplashAssetZ) {}
