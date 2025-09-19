// src/features/publication-resources/dto/update-publication-resource.dto.ts
import { ApiProperty } from '@nestjs/swagger';

export class UpdatePublicationResourceDto {
  @ApiProperty({ required: false }) title?: string;
  @ApiProperty({ required: false }) url?: string;
  @ApiProperty({ required: false }) note?: string;
  @ApiProperty({ required: false }) text?: string;
}
