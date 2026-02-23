import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const UpdatePublicationResourceSchema = z
  .object({
    title: z.string().optional(),
    url: z.string().optional(),
    note: z.string().optional(),
    text: z.string().optional(),
  })
  .strict();

export class UpdatePublicationResourceDto extends createZodDto(
  UpdatePublicationResourceSchema,
) {}
