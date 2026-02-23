import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const CreateFeatureAccessSchema = z
  .object({
    themeId: z.string().optional(),
    status: z.enum(['draft', 'published']).default('draft'),
    config: z.record(z.string(), z.any()),
    applicationId: z.string().optional(),
  })
  .strict();

export class CreateFeatureAccessDto extends createZodDto(
  CreateFeatureAccessSchema,
) {}
