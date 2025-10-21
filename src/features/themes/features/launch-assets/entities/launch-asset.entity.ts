import { Collection } from 'fireorm';
import { Collections } from '../../../../../common';

export type OutputArtifacts = {
    androidLegacyArtifactId?: string;
    androidAdaptiveForegroundArtifactId?: string;
    androidAdaptiveBackgroundArtifactId?: string;
    iosArtifactId?: string;
    webArtifactId?: string;
};

export type SourceConfig = {
    foregroundAssetId?: string;
    backgroundAssetId?: string | null;
    backgroundColorHex?: string;
};

export type FitPadding = { paddingDp?: number };
export type PlatformParams = {
    androidLegacy?: FitPadding;
    androidAdaptive?: FitPadding;
    ios?: FitPadding;
    web?: FitPadding;
};

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
