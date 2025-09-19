import { ApiProperty } from '@nestjs/swagger';

export class CreatePublicationResourceDto {
  @ApiProperty() applicationId!: string;
  @ApiProperty({ required: false }) title?: string;
  @ApiProperty({ required: false }) url?: string;
  @ApiProperty({ required: false }) note?: string;
  @ApiProperty({ required: false }) text?: string;
}
