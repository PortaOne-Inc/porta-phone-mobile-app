// src/features/feature-access/dto/upsert-feature-access.dto.ts
import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsInt, IsOptional, Min } from 'class-validator';

export class UpsertFeatureAccessDto {
  @ApiPropertyOptional({ enum: ['draft', 'published'] })
  status?: 'draft' | 'published';

  @ApiPropertyOptional({ type: Object })
  config?: Record<string, any>;

  @ApiPropertyOptional({
    description: 'Expected version for optimistic locking (409 on mismatch)',
  })
  @IsOptional()
  @IsInt()
  @Min(0)
  expectedVersion?: number;
}
