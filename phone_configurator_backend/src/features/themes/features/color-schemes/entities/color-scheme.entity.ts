import { Collection } from 'fireorm';
import { Collections } from '../../../../../common';

export type ThemeVariant = 'light' | 'dark';

/**
 * ColorScheme entity
 *
 * Per-theme color configuration for a specific variant (light/dark).
 * ID is conventionally `${themeId}_${variant}` for easy lookups.
 */
@Collection(Collections.themeConfigColorSchemes)
export class ColorScheme {
  id!: string; // `${themeId}_${variant}`
  applicationId!: string;
  themeId!: string;
  variant!: ThemeVariant;
  config!: Record<string, any>;
  version?: number;

  createdAt!: string; // ISO timestamp
  updatedAt!: string; // ISO timestamp
}
