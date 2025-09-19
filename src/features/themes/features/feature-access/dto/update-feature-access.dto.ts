import { PartialType } from '@nestjs/swagger';
import { CreateFeatureAccessDto } from './create-feature-access.dto';

export class UpdateFeatureAccessDto extends PartialType(
  CreateFeatureAccessDto,
) {}
