import { ApiPropertyOptional } from '@nestjs/swagger';

export class UpsertPageConfigDto {
  @ApiPropertyOptional({
    description: 'Partial config to deep-merge',
    type: Object,
    additionalProperties: true,
  })
  config?: Record<string, any>;
}
