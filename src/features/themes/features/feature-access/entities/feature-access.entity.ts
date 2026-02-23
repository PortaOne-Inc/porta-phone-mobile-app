import { Collection } from 'fireorm';
import { Collections } from '../../../../../common';

export type FeatureAccessStatus = 'draft' | 'published';

/**
 * FeatureAccess entity
 *
 * Per-theme feature access/config document.
 * id === themeId (convenient for lookups).
 */
@Collection(Collections.themeFeatureEntitlements)
export class FeatureAccess {
  id!: string; // == themeId
  applicationId!: string; // app scope
  themeId!: string; // duplicate of id for querying

  status!: FeatureAccessStatus;
  config!: Record<string, any>; // arbitrary JSON
  version?: number;

  createdAt!: string; // ISO timestamp
  updatedAt!: string; // ISO timestamp
}
