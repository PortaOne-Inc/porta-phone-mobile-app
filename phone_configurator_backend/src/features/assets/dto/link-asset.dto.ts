import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const LinkAssetSchema = z
  .object({
    type: z.enum(['user', 'embed', 'post', 'asset']),
    id: z.string().min(1),
  })
  .strict();

export class LinkAssetDto extends createZodDto(LinkAssetSchema) {
  declare type: 'user' | 'embed' | 'post' | 'asset';
  declare id: string;
}
