import { Collection } from 'fireorm';

@Collection('launch')
export class Launch {
  id: string; // Make id required
  adaptiveIconBackground?: string;
  splashBackground?: string;
  projectId?: string;
}
