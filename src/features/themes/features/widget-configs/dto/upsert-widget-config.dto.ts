import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsObject, IsOptional } from 'class-validator';

export class UpsertWidgetConfigDto {
  @ApiPropertyOptional({
    type: Object,
    description: 'Partial config to deep-merge on server',
  })
  @IsOptional()
  @IsObject()
  config?: Record<string, any>;
}
