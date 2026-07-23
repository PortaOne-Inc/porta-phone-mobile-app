import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const UpsertFeatureAccessSchema = z
  .object({
    status: z.enum(['draft', 'published']).optional(),
    config: z.record(z.string(), z.any()).optional(),
    expectedVersion: z.number().int().min(0).optional(),
  })
  .strip();

export class UpsertFeatureAccessDto extends createZodDto(
  UpsertFeatureAccessSchema,
) {}
