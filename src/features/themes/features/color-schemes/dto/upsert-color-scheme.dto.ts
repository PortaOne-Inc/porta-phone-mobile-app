// src/features/color-schemes/dto/upsert-color-scheme.dto.ts
import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsIn, IsInt, IsObject, IsOptional, Min } from 'class-validator';

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

  @ApiPropertyOptional({
    description: 'Expected version for optimistic locking (409 on mismatch)',
  })
  @IsOptional()
  @IsInt()
  @Min(0)
  expectedVersion?: number;
}
