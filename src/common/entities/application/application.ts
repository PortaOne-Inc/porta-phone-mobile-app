import { Collection } from 'fireorm';
import { BuildVersion } from '../build-version/build-version';

@Collection('applications')
export class Application {
  id: string; // Make id required
  user?: string;
  name?: string;
  theme?: string;
  androidPlatformId?: string;
  iosPlatformId?: string;
  androidVersion?: BuildVersion;
  iosVersion?: BuildVersion;
  coreUrl?: string;
  termsConditionsUrl?: string;
}