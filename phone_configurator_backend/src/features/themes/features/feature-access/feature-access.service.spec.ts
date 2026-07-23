import {
  ConflictException,
  ForbiddenException,
  NotFoundException,
} from '@nestjs/common';
import * as admin from 'firebase-admin';

import { FeatureAccessService } from './feature-access.service';
import { FeatureAccess } from './entities/feature-access.entity';
import { Application } from '../../../applications/entities/application';
import { Theme } from '../../entities/theme';
import { Collections } from '../../../../common';
import { OwnershipService } from '../../../../common/data/ownership.service';
import { InMemoryRepo } from '../../../../testing/in-memory-repo';
import {
  createFakeFirestore,
  FakeFirestoreStore,
  storeKey,
} from '../../../../testing/fake-firestore';

jest.mock('firebase-admin', () => ({
  firestore: jest.fn(),
}));

/**
 * Characterization tests: pin the CURRENT behavior of the service.
 * Ownership is enforced (uid -> application -> theme) and the upsert is a
 * transactional read-check-write guarded by expectedVersion.
 */
describe('FeatureAccessService', () => {
  let repo: InMemoryRepo<FeatureAccess>;
  let appRepo: InMemoryRepo<Application>;
  let themeRepo: InMemoryRepo<Theme>;
  let store: FakeFirestoreStore;
  let service: FeatureAccessService;

  /** Non-transactional reads go through fireorm; the transaction reads the store. */
  const seedAccess = (
    overrides: Partial<FeatureAccess> = {},
  ): FeatureAccess => {
    const entity: FeatureAccess = {
      id: 't1',
      applicationId: 'app-1',
      themeId: 't1',
      status: 'draft',
      config: { chat: { enabled: true } },
      version: 1,
      createdAt: '2026-01-01T00:00:00.000Z',
      updatedAt: '2026-01-01T00:00:00.000Z',
      ...overrides,
    } as FeatureAccess;
    repo.seed(entity);
    store.set(
      storeKey(Collections.themeFeatureEntitlements, entity.id),
      entity,
    );
    return entity;
  };

  const storedAccess = (id: string) =>
    store.get(
      storeKey(Collections.themeFeatureEntitlements, id),
    ) as FeatureAccess;

  beforeEach(() => {
    repo = new InMemoryRepo<FeatureAccess>();
    appRepo = new InMemoryRepo<Application>();
    themeRepo = new InMemoryRepo<Theme>();
    appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);
    themeRepo.seed({ id: 't1', applicationId: 'app-1' } as Theme);
    store = new Map();
    (admin.firestore as unknown as jest.Mock).mockReturnValue(
      createFakeFirestore(store),
    );
    const ownership = new OwnershipService(appRepo as any, themeRepo as any);
    service = new FeatureAccessService(repo as any, ownership);
  });

  describe('getByTheme', () => {
    it('returns the feature access for the theme', async () => {
      seedAccess();

      const result = await service.getByTheme('user-1', 'app-1', 't1');

      expect(result.id).toBe('t1');
    });

    it('throws NotFoundException when none exists', async () => {
      await expect(
        service.getByTheme('user-1', 'app-1', 't1'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws NotFoundException when it belongs to another application', async () => {
      seedAccess({ applicationId: 'other-app' });

      await expect(
        service.getByTheme('user-1', 'app-1', 't1'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      seedAccess();

      await expect(
        service.getByTheme('intruder', 'app-1', 't1'),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });
  });

  describe('upsertByTheme', () => {
    it('creates a new record with id = themeId, version 1 and default draft status', async () => {
      const result = await service.upsertByTheme('user-1', 'app-1', 't1', {
        config: { chat: { enabled: false } },
      });

      expect(result).toMatchObject({
        id: 't1',
        applicationId: 'app-1',
        themeId: 't1',
        status: 'draft',
        version: 1,
      });
      expect(storedAccess('t1')).toMatchObject({
        applicationId: 'app-1',
        config: { chat: { enabled: false } },
        status: 'draft',
        version: 1,
      });
    });

    it('deep-merges the config patch, updates status and bumps the version', async () => {
      seedAccess({
        config: { chat: { enabled: true, history: true } },
        version: 2,
      });

      const result = await service.upsertByTheme('user-1', 'app-1', 't1', {
        status: 'published',
        config: { chat: { enabled: false } },
      });

      expect(result.status).toBe('published');
      expect(result.config).toEqual({
        chat: { enabled: false, history: true },
      });
      expect(result.version).toBe(3);
      expect(storedAccess('t1')).toMatchObject({
        status: 'published',
        config: { chat: { enabled: false, history: true } },
        version: 3,
      });
    });

    it('throws ConflictException on a stale expectedVersion', async () => {
      seedAccess({ version: 2 });

      await expect(
        service.upsertByTheme('user-1', 'app-1', 't1', {
          config: {},
          expectedVersion: 1,
        }),
      ).rejects.toBeInstanceOf(ConflictException);
      expect(storedAccess('t1').version).toBe(2);
    });

    it('skips the version check when expectedVersion is omitted (last write wins)', async () => {
      seedAccess({ version: 5 });

      const result = await service.upsertByTheme('user-1', 'app-1', 't1', {
        config: { chat: { enabled: false } },
      });

      expect(result.version).toBe(6);
      expect(storedAccess('t1').version).toBe(6);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      await expect(
        service.upsertByTheme('intruder', 'app-1', 't1', { config: {} }),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });

    it('throws NotFoundException when the theme belongs to another application', async () => {
      themeRepo.seed({ id: 't-foreign', applicationId: 'other-app' } as Theme);

      await expect(
        service.upsertByTheme('user-1', 'app-1', 't-foreign', { config: {} }),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws NotFoundException when the stored record belongs to another application', async () => {
      seedAccess({ applicationId: 'other-app', version: 4 });

      await expect(
        service.upsertByTheme('user-1', 'app-1', 't1', {
          config: { chat: { enabled: false } },
        }),
      ).rejects.toBeInstanceOf(NotFoundException);
      expect(storedAccess('t1')).toMatchObject({
        applicationId: 'other-app',
        version: 4,
      });
    });

    it('updates a LEGACY record stored under a random doc id instead of creating a themeId doc', async () => {
      seedAccess({ id: 'legacy-random-id', themeId: 't1', version: 3 });

      const result = await service.upsertByTheme('user-1', 'app-1', 't1', {
        config: { chat: { enabled: false } },
      });

      expect(result.id).toBe('legacy-random-id');
      expect(result.version).toBe(4);
      expect(storedAccess('legacy-random-id')).toMatchObject({
        themeId: 't1',
        config: { chat: { enabled: false } },
        version: 4,
      });
      expect(
        store.has(storeKey(Collections.themeFeatureEntitlements, 't1')),
      ).toBe(false);
    });
  });

  describe('deleteByTheme', () => {
    it('deletes the record', async () => {
      seedAccess();

      await service.deleteByTheme('user-1', 'app-1', 't1');

      expect(repo.docs.size).toBe(0);
    });

    it('throws NotFoundException when none exists', async () => {
      await expect(
        service.deleteByTheme('user-1', 'app-1', 't1'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      seedAccess();

      await expect(
        service.deleteByTheme('intruder', 'app-1', 't1'),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });
  });

  describe('list', () => {
    it('returns all records of the application', async () => {
      seedAccess();
      seedAccess({ id: 't2', themeId: 't2' });
      seedAccess({ id: 't3', themeId: 't3', applicationId: 'other-app' });

      const result = await service.list('user-1', 'app-1');

      expect(result.map((r) => r.id).sort()).toEqual(['t1', 't2']);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      seedAccess();

      await expect(service.list('intruder', 'app-1')).rejects.toBeInstanceOf(
        ForbiddenException,
      );
    });
  });
});
