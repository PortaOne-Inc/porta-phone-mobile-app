import { ForbiddenException, NotFoundException } from '@nestjs/common';

import { OwnedRepoGuard, OwnedDoc } from './owned-repo-guard';
import { InMemoryRepo } from '../../testing/in-memory-repo';

type Doc = OwnedDoc & { name?: string };

describe('OwnedRepoGuard', () => {
  let repo: InMemoryRepo<Doc>;
  let guard: OwnedRepoGuard<Doc>;

  beforeEach(() => {
    repo = new InMemoryRepo<Doc>();
    guard = new OwnedRepoGuard<Doc>(repo as any);
  });

  describe('getOwned', () => {
    it('returns the document when the uid matches ownerId', async () => {
      repo.seed({ id: 'd1', ownerId: 'user-1', name: 'mine' });

      const result = await guard.getOwned('d1', 'user-1');

      expect(result).toMatchObject({ id: 'd1', ownerId: 'user-1' });
    });

    it('throws NotFoundException for a missing document', async () => {
      await expect(guard.getOwned('missing', 'user-1')).rejects.toBeInstanceOf(
        NotFoundException,
      );
    });

    it('throws ForbiddenException when the uid does not own the document', async () => {
      repo.seed({ id: 'd1', ownerId: 'user-1' });

      await expect(guard.getOwned('d1', 'user-2')).rejects.toBeInstanceOf(
        ForbiddenException,
      );
    });

    it('throws NotFoundException when applicationId does not match', async () => {
      repo.seed({ id: 'd1', ownerId: 'user-1', applicationId: 'app-1' });

      await expect(
        guard.getOwned('d1', 'user-1', { applicationId: 'app-2' }),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('accepts a matching applicationId', async () => {
      repo.seed({ id: 'd1', ownerId: 'user-1', applicationId: 'app-1' });

      const result = await guard.getOwned('d1', 'user-1', {
        applicationId: 'app-1',
      });

      expect(result.applicationId).toBe('app-1');
    });

    it('treats a repository read failure as NotFoundException', async () => {
      jest.spyOn(repo, 'findById').mockRejectedValue(new Error('boom'));

      await expect(guard.getOwned('d1', 'user-1')).rejects.toBeInstanceOf(
        NotFoundException,
      );
    });
  });

  describe('listByOwner', () => {
    it('returns only documents owned by the uid', async () => {
      repo.seed(
        { id: 'd1', ownerId: 'user-1' },
        { id: 'd2', ownerId: 'user-2' },
        { id: 'd3', ownerId: 'user-1' },
      );

      const result = await guard.listByOwner('user-1');

      expect(result.map((d) => d.id).sort()).toEqual(['d1', 'd3']);
    });

    it('additionally filters by applicationId when provided', async () => {
      repo.seed(
        { id: 'd1', ownerId: 'user-1', applicationId: 'app-1' },
        { id: 'd2', ownerId: 'user-1', applicationId: 'app-2' },
      );

      const result = await guard.listByOwner('user-1', {
        applicationId: 'app-1',
      });

      expect(result.map((d) => d.id)).toEqual(['d1']);
    });
  });
});
