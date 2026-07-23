import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const ThemeLabelSchema = z.enum(['dev', 'stage', 'prod']);
export const ThemeStatusSchema = z.enum(['draft', 'published', 'archived']);

export const CreateThemeSchema = z
  .object({
    title: z.string().min(1, 'title is required').max(120).trim(),
    description: z.string().max(2000).trim().optional().default(''),
    label: ThemeLabelSchema.default('dev'),
  })
  .strict();

export const CopyThemeSchema = z
  .object({
    title: z.string().max(120).trim().optional(),
    description: z.string().max(2000).trim().optional().default(''),
    label: z.enum(['dev', 'stage', 'prod']).optional().default('dev'),
  })
  .strict();
export const UpdateThemeSchema = CreateThemeSchema.partial()
  .extend({
    status: ThemeStatusSchema.optional(),
    expectedVersion: z.number().int().min(0).optional(),
  })
  .strip();

export class CreateThemeDto extends createZodDto(CreateThemeSchema) {}

export class UpdateThemeDto extends createZodDto(UpdateThemeSchema) {}

export class CopyThemeDto extends createZodDto(CopyThemeSchema) {}

export const CopyThemeToApplicationSchema = z
  .object({
    targetApplicationId: z.string().min(1),
    title: z.string().max(120).trim().optional(),
    description: z.string().max(2000).trim().optional(),
    label: z.enum(['dev', 'stage', 'prod']).optional().default('dev'),
  })
  .strict();

export class CopyThemeToApplicationDto extends createZodDto(CopyThemeToApplicationSchema) {}
