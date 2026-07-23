import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const RegisterSchema = z
  .object({
    email: z.string().email(),
    password: z.string().min(6),
  })
  .strict();

export class RegisterDto extends createZodDto(RegisterSchema) {}
