import { ForbiddenException, NotFoundException } from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';

export interface OwnedDoc {
    id: string;
    ownerId: string;
    applicationId?: string;
}

export class OwnedRepoGuard<T extends OwnedDoc> {
    constructor(private readonly repo: BaseFirestoreRepository<T>) {
    }

    async getOwned(id: string, uid: string, opts?: { applicationId?: string }) {
        const it = await this.repo.findById(id).catch(() => null);
        if (!it)
            throw new NotFoundException(
                `${this.repo.constructor.name}: ${id} not found`,
            );
        if (it.ownerId !== uid) throw new ForbiddenException('Forbidden');
        if (opts?.applicationId && it.applicationId !== opts.applicationId) {
            throw new NotFoundException('Entity not in application');
        }
        return it;
    }

    async listByOwner(
        uid: string,
        filters: Partial<Pick<T, 'applicationId' | 'ownerId'>> = {},
    ) {
        let q = this.repo.whereEqualTo('ownerId', uid);
        if (filters.applicationId)
            q = q.whereEqualTo('applicationId', filters.applicationId as string);
        return q.find();
    }
}
