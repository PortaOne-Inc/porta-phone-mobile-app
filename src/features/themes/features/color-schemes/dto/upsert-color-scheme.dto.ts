// src/features/color-schemes/dto/upsert-color-scheme.dto.ts
import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsIn, IsObject, IsOptional } from 'class-validator';

export class UpsertColorSchemeDto {
  @ApiPropertyOptional({ enum: ['light', 'dark'] })
  @IsOptional()
  @IsIn(['light', 'dark'])
  variant?: 'light' | 'dark';

  @ApiPropertyOptional({
    type: Object,
    description: 'Partial config to merge (deep merge for objects)',
  })
  @IsOptional()
  @IsObject()
  config?: Record<string, any>;
}
