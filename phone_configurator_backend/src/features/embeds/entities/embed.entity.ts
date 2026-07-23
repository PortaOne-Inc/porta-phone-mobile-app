import { Collection } from 'fireorm';
import { Collections } from '../../../common';

export enum EmbeddedResourceType {
    terms = 'terms',
    unknown = 'unknown',
}

@Collection(Collections.applicationEmbeds)
export class EmbeddedResource {
    id!: string; // Firestore doc id
    ownerId!: string; // owner UID
    applicationId!: string; // application scope

    resourceId!: number; // auto-increment per application
    uri!: string;
    type: EmbeddedResourceType = EmbeddedResourceType.unknown;
    attributes: Record<string, any> = {};
    metadata: { attributes?: Record<string, any> } = {};
    payload: string[] = [];
    enableConsoleLogCapture = false;
    reconnectStrategy?: string | null;

    // technical
    createdAt!: string; // ISO timestamp
    updatedAt!: string; // ISO timestamp
    refCount?: number;
    usedBy?: Array<{ type: string; id: string }>;
}
