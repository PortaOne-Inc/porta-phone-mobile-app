import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const CreateShareTokenSchema = z
  .object({
    applicationId: z.string().min(1),
    themeId: z.string().min(1),
  })
  .strict();

export class CreateShareTokenDto extends createZodDto(
  CreateShareTokenSchema,
) {}
