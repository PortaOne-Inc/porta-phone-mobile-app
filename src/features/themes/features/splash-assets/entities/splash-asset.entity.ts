import { Collection } from 'fireorm';
import { Collections } from '../../../../../common';

export type SplashFit =
  | 'fill'
  | 'contain'
  | 'cover'
  | 'fitWidth'
  | 'fitHeight'
  | 'none'
  | 'scaleDown';

export type SplashMode = 'withBackground' | 'withoutBackground';

export interface SplashParams {
  fit?: SplashFit;
  paddingDp?: number;
  backgroundColorHex?: string;
}

export interface SplashSource {
  foregroundAssetId?: string;
  backgroundAssetId?: string;
  backgroundColorHex?: string;
}

export interface SplashOutputArtifacts {
  splashArtifactId?: string;
}

/**
 * SplashAssetEntity
 *
 * Per-theme splash configuration + produced artifact id.
 * id === themeId.
 */
@Collection(Collections.themeAssetsSplash)
export class SplashAssetEntity {
  id!: string;
  applicationId!: string;
  themeId!: string;

  source?: SplashSource;
  params?: SplashParams;
  mode!: SplashMode;

  outputsArtifacts?: SplashOutputArtifacts;

  createdAt!: string; // ISO
  updatedAt!: string; // ISO
}
