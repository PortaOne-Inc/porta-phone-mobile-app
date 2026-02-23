import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';
import { SplashSourceZ, SplashParamsZ, SplashModeZ } from './get-splash-asset.zod';

export const UpsertSplashAssetSchema = z
  .object({
    source: SplashSourceZ.optional(),
    params: SplashParamsZ.optional(),
    mode: SplashModeZ.optional(),
  })
  .strict();

export class UpsertSplashAssetDto extends createZodDto(
  UpsertSplashAssetSchema,
) {}
