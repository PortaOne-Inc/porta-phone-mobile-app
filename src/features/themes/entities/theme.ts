import { Collection } from 'fireorm';
import { Collections } from '../../../common';

@Collection(Collections.themes)
export class Theme {
  id!: string;
  title?: string;
  description?: string;
  label?: 'dev' | 'stage' | 'prod';
  status?: 'draft' | 'published' | 'archived';
  applicationId?: string;
  version?: number;
  createdAt?: string;
  updatedAt?: string;
}
