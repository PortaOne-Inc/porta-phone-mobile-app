import { Collection } from 'fireorm';
import { Collections } from '../../../common';

@Collection(Collections.themeShareTokens)
export class ThemeShareToken {
  id!: string;
  applicationId!: string;
  themeId!: string;
  snapshotId!: string;
  ownerId!: string;
  active!: boolean;
  createdAt!: string;
}
