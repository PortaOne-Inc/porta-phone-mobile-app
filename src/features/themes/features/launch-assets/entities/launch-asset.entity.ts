import { Collection } from 'fireorm';
import { Collections } from '../../../../../common';

export type LaunchFit =
  | 'fill'
  | 'contain'
  | 'cover'
  | 'fitWidth'
  | 'fitHeight'
  | 'none'
  | 'scaleDown';

export interface FitPadding {
  fit?: LaunchFit;
  paddingDp?: number;
}

export interface PlatformParams {
  androidLegacy?: FitPadding;
  androidAdaptive?: FitPadding;
  ios?: FitPadding;
  web?: FitPadding;
}

export interface SourceConfig {
  foregroundAssetId?: string;
  backgroundAssetId?: string;
  backgroundColorHex?: string;
}

export interface OutputArtifacts {
  androidLegacyArtifactId?: string;
  androidAdaptiveForegroundArtifactId?: string;
  androidAdaptiveBackgroundArtifactId?: string;
  iosArtifactId?: string;
  webArtifactId?: string;
}

/**
 * LaunchAssetsEntity
 *
 * Per-theme launch icon inputs/params and produced output artifact ids.
 * id === themeId (1:1).
 */
@Collection(Collections.themeAssetsLauncher)
export class LaunchAssetsEntity {
  id!: string;
  applicationId!: string;
  themeId!: string;

  source?: SourceConfig;
  params?: PlatformParams;
  outputsArtifacts?: OutputArtifacts;

  createdAt!: string; // ISO
  updatedAt!: string; // ISO
}
