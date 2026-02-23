import { createZodDto } from 'nestjs-zod';
import { CreateEmbeddedSchema } from './create-embed.dto';

export const UpdateEmbeddedSchema = CreateEmbeddedSchema.partial();

export class UpdateEmbeddedDto extends createZodDto(UpdateEmbeddedSchema) {}
