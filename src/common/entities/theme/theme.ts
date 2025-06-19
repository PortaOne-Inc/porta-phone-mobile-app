import { Collection } from 'fireorm';
import { Images } from '../images/images';
import { Colors } from '../colors/colors';

@Collection('themes')
export class Theme {
  id: string; // Required field
  name?: string;
  applicationId?: string;
  images?: Images;
  colors?: Colors;

  assets?: Asset[];
  launchAssets?: LaunchAssets;
  splashAssets?: SplashAssets;
}

export class Asset {
  id: number;
  name: string;
  description?: string;
  url?: string;
  type?: string;
}

export class LaunchAssets {
  originalAssetId?: number;
  notificationLogo?: string;
  adaptiveIconBackground?: string;
  adaptiveIconForeground?: string;
  androidLauncherIcon?: string;
  iosLauncherIcon?: string;
  webLauncherIcon?: string;
  backgroundColor?: string;
}

export class SplashAssets {
  originalAssetId?: number;
  icon?: string;
  color?: string;
  padding?: number;
  fit?: string;
}
