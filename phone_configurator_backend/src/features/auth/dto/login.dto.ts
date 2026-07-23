import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const LoginSchema = z
  .object({
    email: z.string().email(),
    password: z.string().min(1),
  })
  .strict();

export class LoginDto extends createZodDto(LoginSchema) {}
