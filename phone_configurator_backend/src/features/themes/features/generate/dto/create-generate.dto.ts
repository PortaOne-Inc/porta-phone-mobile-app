import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const GenerateThemeSchema = z
  .object({
    title: z.string().min(1).max(120).trim(),
    description: z.string().max(2000).trim().optional().default(''),
    prompt: z.string().min(1).max(5000).trim(),
    seedColor: z
      .string()
      .regex(/^#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$/)
      .optional(),
    variant: z.enum(['light', 'dark']).optional().default('light'),
    assetIds: z.array(z.string()).max(20).optional(),
    options: z.record(z.unknown()).optional(),
  })
  .strict();

export class GenerateThemeDto extends createZodDto(GenerateThemeSchema) {}
