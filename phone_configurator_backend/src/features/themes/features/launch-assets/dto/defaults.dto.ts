import { z } from 'zod';

const nullToUndef = <T extends z.ZodTypeAny>(schema: T) =>
    z.preprocess((v) => (v === null ? undefined : v), schema);

const NonNegInt = z.number().int().nonnegative();
const NonNegNum = z.number().nonnegative();

/** Constraints defaults */
export const PlatformConstraintsSchema = z.object({
    sizeDp: nullToUndef(NonNegNum).default(0),
    safeZoneDp: nullToUndef(NonNegNum).default(0),
    toleranceDp: nullToUndef(NonNegNum).default(0),
});

export const ConstraintsDefaultsSchema = z.object({
    androidLegacy: PlatformConstraintsSchema.default({}),
    androidAdaptive: PlatformConstraintsSchema.default({}),
    ios: PlatformConstraintsSchema.default({}),
    web: PlatformConstraintsSchema.default({}),
});
export type ConstraintsDefaults = z.infer<typeof ConstraintsDefaultsSchema>;

/** Upsert payload (DTO) */
export const FitPaddingSchema = z.object({
    paddingDp: nullToUndef(NonNegInt).default(0),
});

export const PlatformParamsSchema = z.object({
    androidLegacy: nullToUndef(FitPaddingSchema).default({}),
    androidAdaptive: nullToUndef(FitPaddingSchema).default({}),
    ios: nullToUndef(FitPaddingSchema).default({}),
    web: nullToUndef(FitPaddingSchema).default({}),
});

export const SourceConfigSchema = z.object({
    foregroundAssetId: nullToUndef(z.string()).optional(),
    backgroundAssetId: z.string().nullable().optional(),
    backgroundColorHex: nullToUndef(
        z.string().regex(/^#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$/),
    ).optional(),
});

export const UpsertLaunchAssetsSchema = z.object({
    source: nullToUndef(SourceConfigSchema).default({}),
    params: nullToUndef(PlatformParamsSchema).default({}),
}).strict();

export type UpsertLaunchAssets = z.infer<typeof UpsertLaunchAssetsSchema>;

export const ValidationSliceSchema = z.object({
    compliant: z.boolean(),
    deltaDp: z.number().int(),
    message: nullToUndef(z.string()).optional(),
});

export const ValidationReportSchema = z.object({
    androidLegacy: ValidationSliceSchema.optional(),
    androidAdaptive: ValidationSliceSchema.optional(),
    ios: ValidationSliceSchema.optional(),
    web: ValidationSliceSchema.optional(),
});
export type ValidationReport = z.infer<typeof ValidationReportSchema>;
