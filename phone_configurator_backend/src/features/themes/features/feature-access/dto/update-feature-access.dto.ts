import { createZodDto } from 'nestjs-zod';
import { CreateFeatureAccessSchema } from './create-feature-access.dto';

export const UpdateFeatureAccessSchema = CreateFeatureAccessSchema.partial();

export class UpdateFeatureAccessDto extends createZodDto(
  UpdateFeatureAccessSchema,
) {}
