import { Collection } from 'fireorm';
import { Collections } from '../../../../../common';

export const THEME_SCHEMA_VERSION = 1;

export interface ThemeSnapshot {
  theme: Record<string, any>;
  colorSchemes: Record<string, any>[];
  widgetConfigs: Record<string, any>[];
  pageConfigs: Record<string, any>[];
  splashAsset: Record<string, any> | null;
  launchAsset: Record<string, any> | null;
  featureAccess: Record<string, any> | null;
  embeds: Record<string, any>[];
}

@Collection(Collections.themeHistory)
export class ThemeHistory {
  id!: string;
  themeId!: string;
  applicationId!: string;
  snapshotVersion!: number;
  action!: string;
  changedBy!: string;
  snapshot!: ThemeSnapshot;
  schemaVersion!: number;
  tag!: string;
  description!: string;
  shareTokenId?: string;
  createdAt!: string;
}
