import { Collection } from 'fireorm';
import { Collections } from '../../../common';
import { BuildVersion } from './build-version';

type Env = 'dev' | 'stage' | 'prod';

@Collection(Collections.applications)
export class Application {
  id!: string;
  user?: string;
  name?: string;
  theme?: string;
  themeByEnv?: Partial<Record<Env, string>>;
  environment?: Record<string, string | boolean | number>;
  androidPlatformId?: string;
  iosPlatformId?: string;
  androidVersion?: BuildVersion;
  iosVersion?: BuildVersion;
  version?: number;
}
