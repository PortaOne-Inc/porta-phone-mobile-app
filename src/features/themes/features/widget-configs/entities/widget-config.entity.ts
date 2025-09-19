import { Collection } from 'fireorm';
import { Collections } from '../../../../../common';

export type WidgetVariant = 'light' | 'dark';

@Collection(Collections.themeConfigWidgets)
export class WidgetConfigEntity {
  id!: string; // themeId_variant
  applicationId!: string;
  themeId!: string;
  variant!: WidgetVariant;
  config!: Record<string, any>;

  createdAt!: string; // ISO timestamp
  updatedAt!: string; // ISO timestamp
}
