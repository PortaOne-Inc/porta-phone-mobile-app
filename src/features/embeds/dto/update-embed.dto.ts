import { PartialType } from '@nestjs/swagger';
import { CreateEmbeddedDto } from './create-embed.dto';

export class UpdateEmbeddedDto extends PartialType(CreateEmbeddedDto) {}
