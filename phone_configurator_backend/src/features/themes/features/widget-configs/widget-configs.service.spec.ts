import {
  ConflictException,
  ForbiddenException,
  NotFoundException,
} from '@nestjs/common';
import * as admin from 'firebase-admin';

import { WidgetConfigsService } from './widget-configs.service';
import { WidgetConfigEntity } from './entities/widget-config.entity';
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
 * Characterization tests: pin the CURRENT behavior. Ownership is enforced
 * (uid -> application -> theme) and the upsert is a transactional
 * read-check-write guarded by expectedVersion.
 */
describe('WidgetConfigsService', () => {
  let repo: InMemoryRepo<WidgetConfigEntity>;
  let appRepo: InMemoryRepo<Application>;
  let themeRepo: InMemoryRepo<Theme>;
  let assets: { getSignedUrlByIdForApp: jest.Mock };
  let store: FakeFirestoreStore;
  let service: WidgetConfigsService;

  /** Ownership/get reads go through fireorm; the transaction reads the store. */
  const seedConfig = (
    overrides: Partial<WidgetConfigEntity> = {},
  ): WidgetConfigEntity => {
    const entity: WidgetConfigEntity = {
      id: 't1_light',
      applicationId: 'app-1',
      themeId: 't1',
      variant: 'light',
      config: { fontFamily: 'Inter' },
      version: 1,
      createdAt: '2026-01-01T00:00:00.000Z',
      updatedAt: '2026-01-01T00:00:00.000Z',
      ...overrides,
    };
    repo.seed(entity);
    store.set(storeKey(Collections.themeConfigWidgets, entity.id), entity);
    return entity;
  };

  const storedConfig = (id: string) =>
    store.get(
      storeKey(Collections.themeConfigWidgets, id),
    ) as WidgetConfigEntity;

  beforeEach(() => {
    repo = new InMemoryRepo<WidgetConfigEntity>();
    appRepo = new InMemoryRepo<Application>();
    themeRepo = new InMemoryRepo<Theme>();
    store = new Map();
    (admin.firestore as unknown as jest.Mock).mockReturnValue(
      createFakeFirestore(store),
    );
    appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);
    themeRepo.seed({ id: 't1', applicationId: 'app-1' } as Theme);
    assets = { getSignedUrlByIdForApp: jest.fn() };
    const ownership = new OwnershipService(appRepo as any, themeRepo as any);
    service = new WidgetConfigsService(repo as any, assets as any, ownership);
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
      expect(result.config).toEqual({ fontFamily: 'Inter' });
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
        { config: { fontFamily: 'Roboto' } },
      );

      expect(result).toMatchObject({
        id: 't1_dark',
        applicationId: 'app-1',
        themeId: 't1',
        variant: 'dark',
        version: 1,
      });
      expect(storedConfig('t1_dark')).toMatchObject({
        config: { fontFamily: 'Roboto' },
        version: 1,
      });
    });

    it('deep-merges the config patch and bumps the version', async () => {
      seedConfig({
        config: { buttons: { radius: 4, elevation: 2 } },
        version: 2,
      });

      const result = await service.upsertByThemeVariant(
        'user-1',
        'app-1',
        't1',
        'light',
        { config: { buttons: { radius: 8 } } },
      );

      expect(result.config).toEqual({ buttons: { radius: 8, elevation: 2 } });
      expect(result.version).toBe(3);
      expect(storedConfig('t1_light')).toMatchObject({
        config: { buttons: { radius: 8, elevation: 2 } },
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
        { config: { fontFamily: 'Roboto' } },
      );

      expect(result.version).toBe(6);
      expect(storedConfig('t1_light').version).toBe(6);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      seedConfig();

      await expect(
        service.upsertByThemeVariant('intruder', 'app-1', 't1', 'light', {
          config: { fontFamily: 'Roboto' },
        }),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });

    it('throws NotFoundException when the theme belongs to another application', async () => {
      themeRepo.seed({ id: 't-foreign', applicationId: 'other-app' } as Theme);

      await expect(
        service.upsertByThemeVariant('user-1', 'app-1', 't-foreign', 'light', {
          config: { fontFamily: 'Roboto' },
        }),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws NotFoundException when the stored config belongs to another application', async () => {
      seedConfig({ applicationId: 'other-app' });

      await expect(
        service.upsertByThemeVariant('user-1', 'app-1', 't1', 'light', {
          config: { fontFamily: 'Roboto' },
        }),
      ).rejects.toBeInstanceOf(NotFoundException);
      expect(storedConfig('t1_light').version).toBe(1);
    });
  });

  describe('ensurePair', () => {
    it('creates both variants when none exist', async () => {
      const result = await service.ensurePair('user-1', 'app-1', 't1');

      expect(result.light.id).toBe('t1_light');
      expect(result.dark.id).toBe('t1_dark');
      expect(storedConfig('t1_light')).toMatchObject({ version: 1 });
      expect(storedConfig('t1_dark')).toMatchObject({ version: 1 });
      expect(store.size).toBe(2);
    });

    it('bumps versions of existing variants instead of resetting them', async () => {
      seedConfig({ version: 2 });

      const result = await service.ensurePair('user-1', 'app-1', 't1');

      expect(result.light.version).toBe(3);
      expect(result.dark.version).toBe(1);
      expect(storedConfig('t1_light').version).toBe(3);
      expect(storedConfig('t1_dark').version).toBe(1);
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
