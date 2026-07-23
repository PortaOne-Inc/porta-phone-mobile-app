import { Collection } from 'fireorm';
import { Collections } from '../../../../../common';

export type PageVariant = 'light' | 'dark';

/**
 * PageConfigEntity
 *
 * Per-theme page configuration for a specific variant (light/dark).
 * ID is formed as ${themeId}_${variant} for quick access.
 */
@Collection(Collections.themeConfigPages)
export class PageConfigEntity {
  id!: string; // themeId_variant
  applicationId!: string;
  themeId!: string;
  variant!: PageVariant;
  config!: Record<string, any>;
  version?: number;

  createdAt!: string; // ISO timestamp
  updatedAt!: string; // ISO timestamp
}
