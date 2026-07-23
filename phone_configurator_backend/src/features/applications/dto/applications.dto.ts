import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const EnvSchema = z.enum(['dev', 'stage', 'prod']);
export const ThemeByEnvSchema = z
  .record(EnvSchema, z.string().min(1))
  .optional();

export const UpdateThemeBindingsSchema = z
  .object({
    defaultThemeId: z.string().min(1).optional(),
    themeByEnv: ThemeByEnvSchema.optional(),
    expectedVersion: z.number().int().nonnegative().optional(),
  })
  .strict();

export class UpdateThemeBindingsDto extends createZodDto(
  UpdateThemeBindingsSchema,
) {}

export const ResolveThemeQuerySchema = z
  .object({
    env: EnvSchema.default('prod'),
  })
  .strict();

export class ResolveThemeQueryDto extends createZodDto(
  ResolveThemeQuerySchema,
) {}
