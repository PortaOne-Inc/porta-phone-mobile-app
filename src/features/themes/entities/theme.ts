import { Collection } from 'fireorm';
import { Collections } from '../../../common';

@Collection(Collections.themes)
export class Theme {
  id!: string;
  title?: string;
  description?: string;
  label?: 'dev' | 'stage' | 'prod';
  applicationId?: string;
  createdAt?: string;
  updatedAt?: string;
}
