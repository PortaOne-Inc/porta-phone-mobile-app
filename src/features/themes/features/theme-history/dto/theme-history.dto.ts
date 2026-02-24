import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const ListThemeHistoryQuerySchema = z.object({
  limit: z.coerce.number().int().min(1).max(100).default(20),
  startAfter: z.string().optional(),
});

export class ListThemeHistoryQueryDto extends createZodDto(
  ListThemeHistoryQuerySchema,
) {}

export const CreateThemeHistorySchema = z.object({
  tag: z.string().max(100).trim().optional(),
  description: z.string().max(2000).trim().optional(),
});

export class CreateThemeHistoryDto extends createZodDto(
  CreateThemeHistorySchema,
) {}

export const PatchThemeHistorySchema = z.object({
  tag: z.string().max(100).trim().optional(),
  description: z.string().max(2000).trim().optional(),
});

export class PatchThemeHistoryDto extends createZodDto(
  PatchThemeHistorySchema,
) {}
