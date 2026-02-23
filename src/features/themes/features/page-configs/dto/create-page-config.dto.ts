import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsInt, IsOptional, Min } from 'class-validator';

export class UpsertPageConfigDto {
  @ApiPropertyOptional({
    description: 'Partial config to deep-merge',
    type: Object,
    additionalProperties: true,
  })
  config?: Record<string, any>;

  @ApiPropertyOptional({
    description: 'Expected version for optimistic locking (409 on mismatch)',
  })
  @IsOptional()
  @IsInt()
  @Min(0)
  expectedVersion?: number;
}
