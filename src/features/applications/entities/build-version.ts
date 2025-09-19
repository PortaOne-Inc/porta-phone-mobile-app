import { Collection } from 'fireorm';

@Collection('build-versions')
export class BuildVersion {
  id: string;
  buildName?: string;
  buildNumber?: number;
}
