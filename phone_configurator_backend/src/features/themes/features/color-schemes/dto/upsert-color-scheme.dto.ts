import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const UpsertColorSchemeSchema = z
  .object({
    variant: z.enum(['light', 'dark']).optional(),
    config: z.record(z.string(), z.any()).optional(),
    expectedVersion: z.number().int().min(0).optional(),
  })
  .strip();

export class UpsertColorSchemeDto extends createZodDto(
  UpsertColorSchemeSchema,
) {}
