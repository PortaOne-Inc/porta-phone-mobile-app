// src/features/embeds/dto/create-embedded.dto.ts
import { ApiProperty } from '@nestjs/swagger';
import {
  IsBoolean,
  IsEnum,
  IsObject,
  IsOptional,
  IsString,
  IsUrl,
  IsArray,
} from 'class-validator';
import { EmbeddedResourceType } from '../entities/embed.entity';

export class CreateEmbeddedDto {
  @ApiProperty({ example: 'https://example.com/terms.html' })
  @IsString()
  @IsUrl()
  uri!: string;

  @ApiProperty({
    enum: EmbeddedResourceType,
    default: EmbeddedResourceType.unknown,
  })
  @IsEnum(EmbeddedResourceType)
  type: EmbeddedResourceType = EmbeddedResourceType.unknown;

  @ApiProperty({ type: Object, default: {} })
  @IsObject()
  @IsOptional()
  attributes?: Record<string, any>;

  @ApiProperty({ type: Object, default: { attributes: {} } })
  @IsObject()
  @IsOptional()
  metadata?: { attributes?: Record<string, any> };

  @ApiProperty({ type: [String], default: [] })
  @IsArray()
  @IsOptional()
  payload?: string[];

  @ApiProperty({ default: false })
  @IsBoolean()
  @IsOptional()
  enableConsoleLogCapture?: boolean;

  @ApiProperty({ required: false })
  @IsString()
  @IsOptional()
  reconnectStrategy?: string;

  applicationId?: string;
}
