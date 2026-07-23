import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const UpdateArtifactSchema = z
  .object({
    checksum: z.string().optional(),
    usedBy: z
      .array(z.object({ type: z.string(), id: z.string() }))
      .optional(),
  })
  .strict();

export class UpdateArtifactDto extends createZodDto(UpdateArtifactSchema) {}
