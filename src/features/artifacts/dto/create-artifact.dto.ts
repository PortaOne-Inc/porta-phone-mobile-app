import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const CreateArtifactSchema = z
  .object({
    applicationId: z.string().optional(),
    themeId: z.string().optional(),
    kind: z.string().min(1),
    storagePath: z.string().optional(),
    mimeType: z.string().optional(),
    size: z.number().optional(),
    checksum: z.string().optional(),
    sources: z
      .array(z.object({ type: z.string(), id: z.string() }))
      .optional(),
  })
  .strict();

export class CreateArtifactDto extends createZodDto(CreateArtifactSchema) {
  declare sources?: Array<{ type: string; id: string }>;
}
