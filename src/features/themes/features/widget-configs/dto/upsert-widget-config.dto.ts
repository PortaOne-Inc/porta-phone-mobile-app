import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsInt, IsObject, IsOptional, Min } from 'class-validator';

export class UpsertWidgetConfigDto {
  @ApiPropertyOptional({
    type: Object,
    description: 'Partial config to deep-merge on server',
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
