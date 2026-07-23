import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const AuthResponseSchema = z.object({
  status: z.string(),
  token: z.string(),
});

export class AuthResponseDto extends createZodDto(AuthResponseSchema) {}

export const ErrorResponseSchema = z.object({
  status: z.string(),
  message: z.string(),
});

export class ErrorResponseDto extends createZodDto(ErrorResponseSchema) {}
