import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const CreatePublicationResourceSchema = z
  .object({
    applicationId: z.string().optional(),
    title: z.string().optional(),
    url: z.string().optional(),
    note: z.string().optional(),
    text: z.string().optional(),
  })
  .strict();

export class CreatePublicationResourceDto extends createZodDto(
  CreatePublicationResourceSchema,
) {}
