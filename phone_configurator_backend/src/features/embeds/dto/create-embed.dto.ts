import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';
import { EmbeddedResourceType } from '../entities/embed.entity';

export const CreateEmbeddedSchema = z
  .object({
    uri: z.string().url(),
    type: z
      .nativeEnum(EmbeddedResourceType)
      .default(EmbeddedResourceType.unknown),
    attributes: z.record(z.string(), z.any()).optional(),
    metadata: z
      .object({ attributes: z.record(z.string(), z.any()).optional() })
      .optional(),
    payload: z.array(z.string()).optional(),
    enableConsoleLogCapture: z.boolean().optional(),
    reconnectStrategy: z.string().optional(),
    applicationId: z.string().optional(),
  })
  .strict();

export class CreateEmbeddedDto extends createZodDto(CreateEmbeddedSchema) {}
