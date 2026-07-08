import { ConflictException, NotFoundException } from '@nestjs/common';
import * as admin from 'firebase-admin';

import { ThemesService } from './themes.service';
import { Theme } from './entities/theme';
import { Application } from '../applications/entities/application';
import { Collections } from '../../common';
import { InMemoryRepo } from '../../testing/in-memory-repo';

jest.mock('firebase-admin', () => ({
  firestore: jest.fn(),
}));

/**
 * Fake of the small firestore surface patchTheme uses:
 * collection(...).doc(...) refs + runTransaction with tx.get/tx.set,
 * backed by a plain Map keyed as `${collection}/${id}`.
 */
const createFakeFirestore = (store: Map<string, unknown>) => ({
  collection: (name: string) => ({
    doc: (id: string) => ({ __key: `${name}/${id}` }),
  }),
  runTransaction: async (fn: (tx: unknown) => Promise<unknown>) =>
    fn({
      get: async (ref: { __key: string }) => {
        const data = store.get(ref.__key);
        return {
          exists: data !== undefined,
          data: () => structuredClone(data),
        };
      },
      set: (ref: { __key: string }, value: unknown) => {
        store.set(ref.__key, structuredClone(value));
      },
    }),
});

/**
 * Characterization tests: pin the CURRENT behavior, including known gaps
 * (uid accepted but not used for authorization).
 */
describe('ThemesService', () => {
  let themeRepo: InMemoryRepo<Theme>;
  let appRepo: InMemoryRepo<Application>;
  let store: Map<string, unknown>;
  let service: ThemesService;

  beforeEach(() => {
    themeRepo = new InMemoryRepo<Theme>();
    appRepo = new InMemoryRepo<Application>();
    store = new Map();
    (admin.firestore as unknown as jest.Mock).mockReturnValue(
      createFakeFirestore(store),
    );
    service = new ThemesService(
      themeRepo as any,
      appRepo as any,
      {} as any,
      {} as any,
      {} as any,
    );
  });

  describe('getThemeById', () => {
    it('returns the theme by id within the application', async () => {
      themeRepo.seed({ id: 't1', applicationId: 'app-1', title: 'T' } as Theme);

      const result = await service.getThemeById('app-1', 't1', 'user-1');

      expect(result).toMatchObject({ id: 't1', applicationId: 'app-1' });
    });

    it('throws NotFoundException for a missing theme', async () => {
      await expect(
        service.getThemeById('app-1', 'missing', 'user-1'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws NotFoundException when the theme belongs to another application', async () => {
      themeRepo.seed({ id: 't1', applicationId: 'other-app' } as Theme);

      await expect(
        service.getThemeById('app-1', 't1', 'user-1'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('accepts uid but does not use it for authorization (any uid can read)', async () => {
      themeRepo.seed({ id: 't1', applicationId: 'app-1' } as Theme);

      await expect(
        service.getThemeById('app-1', 't1', 'foreign-uid'),
      ).resolves.toBeDefined();
    });
  });

  describe('createTheme', () => {
    it('creates a theme with version 1 bound to the application', async () => {
      const result = await service.createTheme('app-1', {
        title: 'New',
        description: 'Desc',
        label: 'dev',
      } as any);

      expect(result).toMatchObject({
        applicationId: 'app-1',
        title: 'New',
        version: 1,
      });
    });
  });

  describe('patchTheme', () => {
    const seedThemeDoc = (theme: Partial<Theme>) => {
      store.set(`${Collections.themes}/${theme.id}`, theme);
    };

    it('applies partial updates and bumps the version transactionally', async () => {
      seedThemeDoc({
        id: 't1',
        applicationId: 'app-1',
        title: 'Old',
        status: 'draft',
        version: 3,
      });

      const result = await service.patchTheme('app-1', 't1', {
        title: 'New',
        status: 'published',
      } as any);

      expect(result).toMatchObject({
        title: 'New',
        status: 'published',
        version: 4,
      });
      expect(store.get(`${Collections.themes}/t1`)).toMatchObject({
        title: 'New',
        version: 4,
      });
    });

    it('leaves fields absent from the dto untouched', async () => {
      seedThemeDoc({
        id: 't1',
        applicationId: 'app-1',
        title: 'Keep',
        description: 'Keep too',
        version: 1,
      });

      const result = await service.patchTheme('app-1', 't1', {
        status: 'archived',
      } as any);

      expect(result).toMatchObject({
        title: 'Keep',
        description: 'Keep too',
        status: 'archived',
        version: 2,
      });
    });

    it('throws NotFoundException for a missing theme', async () => {
      await expect(
        service.patchTheme('app-1', 'missing', {} as any),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws NotFoundException when the theme belongs to another application', async () => {
      seedThemeDoc({ id: 't1', applicationId: 'other-app', version: 1 });

      await expect(
        service.patchTheme('app-1', 't1', {} as any),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws ConflictException on a stale expectedVersion', async () => {
      seedThemeDoc({ id: 't1', applicationId: 'app-1', version: 2 });

      await expect(
        service.patchTheme('app-1', 't1', {
          title: 'New',
          expectedVersion: 1,
        } as any),
      ).rejects.toBeInstanceOf(ConflictException);
    });

    it('skips the version check when expectedVersion is omitted (last write wins)', async () => {
      seedThemeDoc({ id: 't1', applicationId: 'app-1', version: 5 });

      const result = await service.patchTheme('app-1', 't1', {
        title: 'New',
      } as any);

      expect(result.version).toBe(6);
    });
  });
});
