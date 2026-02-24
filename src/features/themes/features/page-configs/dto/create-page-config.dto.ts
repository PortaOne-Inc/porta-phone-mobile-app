import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const UpsertPageConfigSchema = z
  .object({
    config: z.record(z.string(), z.any()).optional(),
    expectedVersion: z.number().int().min(0).optional(),
  })
  .strip();

export class UpsertPageConfigDto extends createZodDto(
  UpsertPageConfigSchema,
) {}
