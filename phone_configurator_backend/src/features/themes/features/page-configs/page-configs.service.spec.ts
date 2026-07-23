import {
  ConflictException,
  ForbiddenException,
  NotFoundException,
} from '@nestjs/common';
import * as admin from 'firebase-admin';

import { PageConfigsService } from './page-configs.service';
import { PageConfigEntity } from './entities/page-config.entity';
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
describe('PageConfigsService', () => {
  let repo: InMemoryRepo<PageConfigEntity>;
  let appRepo: InMemoryRepo<Application>;
  let themeRepo: InMemoryRepo<Theme>;
  let assets: { getSignedUrlByIdForApp: jest.Mock };
  let store: FakeFirestoreStore;
  let service: PageConfigsService;

  /** Non-transactional reads go through fireorm; the transaction reads the store. */
  const seedConfig = (
    overrides: Partial<PageConfigEntity> = {},
  ): PageConfigEntity => {
    const entity: PageConfigEntity = {
      id: 't1_light',
      applicationId: 'app-1',
      themeId: 't1',
      variant: 'light',
      config: { login: { title: 'Welcome' } },
      version: 1,
      createdAt: '2026-01-01T00:00:00.000Z',
      updatedAt: '2026-01-01T00:00:00.000Z',
      ...overrides,
    };
    repo.seed(entity);
    store.set(storeKey(Collections.themeConfigPages, entity.id), entity);
    return entity;
  };

  const storedConfig = (id: string) =>
    store.get(storeKey(Collections.themeConfigPages, id)) as PageConfigEntity;

  beforeEach(() => {
    repo = new InMemoryRepo<PageConfigEntity>();
    appRepo = new InMemoryRepo<Application>();
    themeRepo = new InMemoryRepo<Theme>();
    appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);
    themeRepo.seed({ id: 't1', applicationId: 'app-1' } as Theme);
    assets = { getSignedUrlByIdForApp: jest.fn() };
    store = new Map();
    (admin.firestore as unknown as jest.Mock).mockReturnValue(
      createFakeFirestore(store),
    );
    const ownership = new OwnershipService(appRepo as any, themeRepo as any);
    service = new PageConfigsService(repo as any, assets as any, ownership);
  });

  describe('getByThemeVariant', () => {
    it('returns the config addressed as {themeId}_{variant}', async () => {
      seedConfig();

      const result = await service.getByThemeVariant(
        'user-1',
        'app-1',
        't1',
        'light',
      );

      expect(result.id).toBe('t1_light');
      expect(result.config).toEqual({ login: { title: 'Welcome' } });
    });

    it('throws NotFoundException for a missing config', async () => {
      await expect(
        service.getByThemeVariant('user-1', 'app-1', 't1', 'dark'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws NotFoundException when the config belongs to another application', async () => {
      seedConfig({ applicationId: 'other-app' });

      await expect(
        service.getByThemeVariant('user-1', 'app-1', 't1', 'light'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      seedConfig();

      await expect(
        service.getByThemeVariant('intruder', 'app-1', 't1', 'light'),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });
  });

  describe('upsertByThemeVariant', () => {
    it('creates a new config with version 1', async () => {
      const result = await service.upsertByThemeVariant(
        'user-1',
        'app-1',
        't1',
        'dark',
        { config: { login: { title: 'Hi' } } },
      );

      expect(result).toMatchObject({
        id: 't1_dark',
        applicationId: 'app-1',
        themeId: 't1',
        variant: 'dark',
        version: 1,
      });
      expect(storedConfig('t1_dark')).toMatchObject({
        applicationId: 'app-1',
        config: { login: { title: 'Hi' } },
        version: 1,
      });
    });

    it('deep-merges the config patch and bumps the version', async () => {
      seedConfig({
        config: { login: { title: 'Welcome', subtitle: 'Sign in' } },
        version: 2,
      });

      const result = await service.upsertByThemeVariant(
        'user-1',
        'app-1',
        't1',
        'light',
        { config: { login: { title: 'Hello' } } },
      );

      expect(result.config).toEqual({
        login: { title: 'Hello', subtitle: 'Sign in' },
      });
      expect(result.version).toBe(3);
      expect(storedConfig('t1_light')).toMatchObject({
        config: { login: { title: 'Hello', subtitle: 'Sign in' } },
        version: 3,
      });
    });

    it('throws ConflictException on a stale expectedVersion', async () => {
      seedConfig({ version: 2 });

      await expect(
        service.upsertByThemeVariant('user-1', 'app-1', 't1', 'light', {
          config: {},
          expectedVersion: 1,
        }),
      ).rejects.toBeInstanceOf(ConflictException);
      expect(storedConfig('t1_light').version).toBe(2);
    });

    it('skips the version check when expectedVersion is omitted (last write wins)', async () => {
      seedConfig({ version: 5 });

      const result = await service.upsertByThemeVariant(
        'user-1',
        'app-1',
        't1',
        'light',
        { config: { login: { title: 'Stale' } } },
      );

      expect(result.version).toBe(6);
      expect(storedConfig('t1_light').version).toBe(6);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      await expect(
        service.upsertByThemeVariant('intruder', 'app-1', 't1', 'light', {
          config: {},
        }),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });

    it('throws NotFoundException when the theme belongs to another application', async () => {
      themeRepo.seed({ id: 't-foreign', applicationId: 'other-app' } as Theme);

      await expect(
        service.upsertByThemeVariant('user-1', 'app-1', 't-foreign', 'light', {
          config: {},
        }),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws NotFoundException when the stored config belongs to another application', async () => {
      seedConfig({ applicationId: 'other-app', version: 4 });

      await expect(
        service.upsertByThemeVariant('user-1', 'app-1', 't1', 'light', {
          config: { login: { title: 'Hijack' } },
        }),
      ).rejects.toBeInstanceOf(NotFoundException);
      expect(storedConfig('t1_light')).toMatchObject({
        applicationId: 'other-app',
        version: 4,
      });
    });
  });

  describe('listForTheme', () => {
    it('returns only variants of the given theme and application', async () => {
      seedConfig();
      seedConfig({ id: 't1_dark', variant: 'dark' });
      seedConfig({ id: 't2_light', themeId: 't2' });

      const result = await service.listForTheme('user-1', 'app-1', 't1');

      expect(result.map((c) => c.id).sort()).toEqual(['t1_dark', 't1_light']);
    });
  });
});
