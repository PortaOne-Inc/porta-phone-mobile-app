import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class GenerateThemeDto {
  @ApiProperty({
    description: 'Theme title (will be used when creating the Theme doc)',
  })
  title!: string;

  @ApiProperty({ description: 'Plain text description / context of the theme' })
  description!: string;

  @ApiProperty({
    description: 'LLM instructions (what to generate, constraints, tone, etc.)',
  })
  prompt!: string;

  @ApiPropertyOptional({
    description: 'Optional seed color in #RRGGBB',
    example: '#F95A14',
  })
  seedColor?: string;

  @ApiPropertyOptional({
    description: 'Color scheme variant to generate',
    enum: ['light', 'dark'],
    default: 'light',
  })
  variant?: 'light' | 'dark';

  @ApiPropertyOptional({
    description:
      'IDs of assets to reference during generation (images, logos, etc.)',
    type: [String],
  })
  assetIds?: string[];

  @ApiPropertyOptional({
    description: 'Advanced generation options (model, temperature, etc.)',
    type: Object,
  })
  options?: Record<string, any>;
}
