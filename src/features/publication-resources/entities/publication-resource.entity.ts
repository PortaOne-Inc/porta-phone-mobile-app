import { Collection } from 'fireorm';
import { Collections } from '../../../common';

@Collection(Collections.applicationStorePublishing)
export class PublicationResource {
    id!: string;
    ownerId!: string; // user UID
    applicationId!: string; // parent application

    title?: string;
    url?: string;
    note?: string; // short note
    text?: string; // extended text / description

    createdAt!: string; // ISO timestamp
    updatedAt!: string; // ISO timestamp
}
