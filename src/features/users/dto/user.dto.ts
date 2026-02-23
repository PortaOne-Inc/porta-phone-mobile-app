import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const UserSchema = z.object({
  uid: z.string(),
  email: z.string().email(),
  displayName: z.string().optional(),
  role: z.string(),
});

export class UserDto extends createZodDto(UserSchema) {}
