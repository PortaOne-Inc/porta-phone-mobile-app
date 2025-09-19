// src/features/feature-access/dto/upsert-feature-access.dto.ts
import { ApiPropertyOptional } from '@nestjs/swagger';

export class UpsertFeatureAccessDto {
  @ApiPropertyOptional({ enum: ['draft', 'published'] })
  status?: 'draft' | 'published';

  @ApiPropertyOptional({ type: Object })
  config?: Record<string, any>;
}
