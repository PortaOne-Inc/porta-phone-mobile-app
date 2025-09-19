import { Collection } from 'fireorm';
import { Collections } from '../../../common';

@Collection(Collections.applicationAssets)
export class Asset {
  id!: string;
  ownerId!: string;
  applicationId!: string;

  storagePath!: string;
  mimeType!: string;
  size!: number;
  checksum?: string | null;

  createdAt!: string;
  updatedAt!: string;

  refCount?: number;
  usedBy?: Array<{ type: string; id: string }>;
}
