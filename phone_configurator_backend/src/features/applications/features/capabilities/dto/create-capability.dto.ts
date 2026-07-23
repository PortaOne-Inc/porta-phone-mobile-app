import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const CreateCapabilitySchema = z.object({}).strict();

export class CreateCapabilityDto extends createZodDto(
  CreateCapabilitySchema,
) {}
