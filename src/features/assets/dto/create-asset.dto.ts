import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const CreateAssetSchema = z
  .object({
    applicationId: z.string().optional(),
    storagePath: z.string().min(1),
    mimeType: z.string().min(1),
    size: z.number(),
    checksum: z.string().optional(),
  })
  .strict();

export class CreateAssetDto extends createZodDto(CreateAssetSchema) {}
