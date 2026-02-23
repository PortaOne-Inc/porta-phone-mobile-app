import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const UpsertWidgetConfigSchema = z
  .object({
    config: z.record(z.string(), z.any()).optional(),
    expectedVersion: z.number().int().min(0).optional(),
  })
  .strict();

export class UpsertWidgetConfigDto extends createZodDto(
  UpsertWidgetConfigSchema,
) {}
