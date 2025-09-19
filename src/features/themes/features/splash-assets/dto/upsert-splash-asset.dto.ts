import { ApiPropertyOptional } from '@nestjs/swagger';
import { SplashMode } from '../entities/splash-asset.entity';

export type SplashFit =
  | 'fill'
  | 'contain'
  | 'cover'
  | 'fitWidth'
  | 'fitHeight'
  | 'none'
  | 'scaleDown';

export class SplashSourceDto {
  @ApiPropertyOptional({ description: 'Foreground asset id (logo/image)' })
  foregroundAssetId?: string;

  @ApiPropertyOptional({ description: 'Optional background asset id' })
  backgroundAssetId?: string;

  @ApiPropertyOptional({
    description: 'Optional background color (#RRGGBB or #AARRGGBB)',
  })
  backgroundColorHex?: string | null;
}

export class SplashParamsDto {
  @ApiPropertyOptional({
    enum: [
      'fill',
      'contain',
      'cover',
      'fitWidth',
      'fitHeight',
      'none',
      'scaleDown',
    ],
    description: 'How to fit the image (BoxFit analogue)',
  })
  fit?: SplashFit;

  @ApiPropertyOptional({ description: 'Padding in dp' })
  paddingDp?: number;
}

export class UpsertSplashAssetDto {
  @ApiPropertyOptional({ type: SplashSourceDto })
  source?: SplashSourceDto;

  @ApiPropertyOptional({ type: SplashParamsDto })
  params?: SplashParamsDto;

  @ApiPropertyOptional({
    enum: ['withBackground', 'withoutBackground'],
    description: 'Constraints mode (used for validation recommendations)',
  })
  mode?: SplashMode;
}
