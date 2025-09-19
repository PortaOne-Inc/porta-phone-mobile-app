import { Collection } from 'fireorm';
import { Collections } from '../../../common';

@Collection(Collections.applicationAssetsRenditions)
export class Artifact {
  id!: string;
  ownerId!: string;
  applicationId!: string;
  themeId!: string;

  kind!: string;
  sources?: Array<{ type: string; id: string }>;

  storagePath!: string;
  mimeType!: string;
  size!: number;
  checksum?: string | null;

  createdAt!: string;
  updatedAt!: string;

  refCount?: number;
  usedBy?: Array<{ type: string; id: string }>;
}
