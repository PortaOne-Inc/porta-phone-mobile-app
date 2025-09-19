import { Injectable } from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';

/**
 * Example: { type: 'artifact', id: 'abc123' }
 */
export type LinkRef = { type: string; id: string };

/**
 * Contract for entities that can track reference usage.
 * - `usedBy`: list of links to other entities that depend on this one
 * - `refCount`: numeric counter for quick checks (e.g., "is in use?")
 * - `updatedAt`: timestamp of the last update
 */
export interface RefCounted {
  id: string;
  usedBy?: LinkRef[];
  refCount?: number;
  updatedAt?: string | Date;
}

@Injectable()
export class RefLinksService {
  /**
   * Add a reference link to the given entity.
   *
   * - Checks if the link already exists in `usedBy`.
   * - If not, adds it and increments `refCount`.
   * - Updates `updatedAt` timestamp and persists to Firestore.
   *
   * - Ensures that entities (assets, artifacts, embeds, etc.)
   *   can safely track which other entities depend on them.
   * - Prevents duplicate references.
   */
  async link<T extends RefCounted>(
    repo: BaseFirestoreRepository<T>,
    entity: T,
    link: LinkRef,
  ): Promise<T> {
    const usedBy = entity.usedBy ?? [];
    if (!usedBy.some((x) => x.type === link.type && x.id === link.id)) {
      usedBy.push(link);
      entity.usedBy = usedBy;
      entity.refCount = (entity.refCount ?? 0) + 1;
      entity.updatedAt = new Date().toISOString();
      await repo.update(entity);
    }
    return entity;
  }

  /**
   * Remove a reference link from the given entity.
   *
   * - Filters out the given link from `usedBy`.
   * - If removed, decrements `refCount` (never below zero).
   * - Updates `updatedAt` timestamp and persists to Firestore.
   *
   * - Keeps `usedBy` and `refCount` in sync when dependencies are deleted.
   * - Prevents "dangling" references or negative counts.
   */
  async unlink<T extends RefCounted>(
    repo: BaseFirestoreRepository<T>,
    entity: T,
    link: LinkRef,
  ): Promise<T> {
    const usedBy = entity.usedBy ?? [];
    const next = usedBy.filter(
      (x) => !(x.type === link.type && x.id === link.id),
    );
    if (next.length !== usedBy.length) {
      entity.usedBy = next;
      entity.refCount = Math.max(0, (entity.refCount ?? 0) - 1);
      entity.updatedAt = new Date().toISOString();
      await repo.update(entity);
    }
    return entity;
  }

  /**
   * Apply a batch reference operation (increment or decrement)
   * on a list of links using a provided handler.
   *
   * - Iterates through `links` and executes the handler for each one.
   * - Handler typically calls `link()` or `unlink()` on related entities.
   *
   * - Centralizes batch linking/unlinking logic.
   * - Useful when an entity touches multiple sources (e.g. an artifact
   *   created from several input assets).
   */
  async batchTouch<T extends { id: string }>(
    op: 'inc' | 'dec',
    links: LinkRef[] | undefined,
    handler: (l: LinkRef) => Promise<void>,
  ) {
    for (const l of links ?? []) {
      if (op === 'inc') await handler(l);
      else await handler(l);
    }
  }
}
