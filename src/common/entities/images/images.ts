import { Collection } from 'fireorm';

@Collection('images')
export class Images {
  id: string; // Make id required
  primaryOnboardingLogo?: string;
  secondaryOnboardingLogo?: string;
  adaptiveIconBackground?: string;
  iosLauncherIcon?: string;
  onboarding?: string;
  androidLauncherIcon?: string;
  notificationLogo?: string;
  adaptiveIconForeground?: string;
  webLauncherIcon?: string;
}
