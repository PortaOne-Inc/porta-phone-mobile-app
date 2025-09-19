import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsEnum,
  IsNotEmpty,
  IsObject,
  IsOptional,
  IsString,
} from 'class-validator';

export class CreateFeatureAccessDto {
  @ApiPropertyOptional({
    description:
      'Theme id (optional). If omitted, applies to entire application',
  })
  @IsOptional()
  @IsString()
  themeId?: string;

  @ApiProperty({ enum: ['draft', 'published'], default: 'draft' })
  @IsEnum(['draft', 'published'] as any)
  status: 'draft' | 'published' = 'draft';

  @ApiProperty({ description: 'Arbitrary JSON config' })
  @IsObject()
  @IsNotEmpty()
  config!: Record<string, any>;

  // Will be injected from path:
  applicationId!: string;
}
