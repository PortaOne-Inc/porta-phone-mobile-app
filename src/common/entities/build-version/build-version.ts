import { Collection } from 'fireorm';

@Collection('build-versions')
export class BuildVersion {
  id: string; // Make id required
  buildName?: string;
  buildNumber?: number;
}