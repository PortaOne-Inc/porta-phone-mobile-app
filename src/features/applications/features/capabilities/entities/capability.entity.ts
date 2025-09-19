import { Collection } from 'fireorm';

@Collection('application_capabilities')
export class ApplicationCapabilities {
  id!: string;
  applicationId!: string;
  version!: number;
  capabilities!: Record<string, boolean>;
  defaultCapabilities?: Record<string, boolean>;
  updatedAt!: Date;
  updatedBy!: string;
  updatedFrom!: 'ui' | 'api' | 'ci';
}
