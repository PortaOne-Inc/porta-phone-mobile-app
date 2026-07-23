import {
  BadRequestException,
  ConflictException,
  ForbiddenException,
  NotFoundException,
} from '@nestjs/common';
import * as admin from 'firebase-admin';

import { ApplicationsService } from './applications.service';
import { Application } from './entities/application';
import { Theme } from '../themes/entities/theme';
import { Collections } from '../../common';
import { OwnershipService } from '../../common/data/ownership.service';
import { InMemoryRepo } from '../../testing/in-memory-repo';
import {
  createFakeFirestore,
  FakeFirestoreStore,
  storeKey,
} from '../../testing/fake-firestore';

jest.mock('firebase-admin', () => ({
  firestore: jest.fn(),
}));

/**
 * Characterization tests: they pin the CURRENT behavior of the service.
 * Ownership is enforced (uid -> application.user) and every mutating write
 * is a transactional read-check-write guarded by expectedVersion.
 */
describe('ApplicationsService', () => {
  let appRepo: InMemoryRepo<Application>;
  let themeRepo: InMemoryRepo<Theme>;
  let themesService: { deleteTheme: jest.Mock };
  let store: FakeFirestoreStore;
  let service: ApplicationsService;

  /** Ownership reads go through fireorm; the transaction reads the store. */
  const seedApp = (app: Partial<Application>) => {
    appRepo.seed(app as Application);
    store.set(storeKey(Collections.applications, app.id!), app);
  };

  const storedApp = (id: string) =>
    store.get(storeKey(Collections.applications, id)) as Application;

  beforeEach(() => {
    appRepo = new InMemoryRepo<Application>();
    themeRepo = new InMemoryRepo<Theme>();
    themesService = { deleteTheme: jest.fn().mockResolvedValue(undefined) };
    store = new Map();
    (admin.firestore as unknown as jest.Mock).mockReturnValue(
      createFakeFirestore(store),
    );
    const ownership = new OwnershipService(appRepo as any, themeRepo as any);
    service = new ApplicationsService(
      appRepo as any,
      themeRepo as any,
      ownership,
      themesService as any,
    );
  });

  describe('createApplication', () => {
    it('stores the application with user taken from the uid argument', async () => {
      const result = await service.createApplication('user-1', {
        name: 'My App',
        user: 'someone-else',
      } as Application);

      expect(result.user).toBe('user-1');
      expect(appRepo.docs.get(result.id)!.user).toBe('user-1');
    });

    it('propagates repository failures', async () => {
      jest.spyOn(appRepo, 'create').mockRejectedValue(new Error('boom'));

      await expect(
        service.createApplication('user-1', { name: 'x' } as Application),
      ).rejects.toThrow('boom');
    });
  });

  describe('findApplicationById', () => {
    it('returns the application to its owner', async () => {
      seedApp({ id: 'app-1', user: 'user-1', name: 'A' });

      expect(
        await service.findApplicationById('user-1', 'app-1'),
      ).toMatchObject({ id: 'app-1' });
    });

    it('throws NotFoundException for a missing application', async () => {
      await expect(
        service.findApplicationById('user-1', 'missing'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      seedApp({ id: 'app-1', user: 'owner' });

      await expect(
        service.findApplicationById('intruder', 'app-1'),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });
  });

  describe('updateApplication', () => {
    it('merges the dto and bumps the version transactionally', async () => {
      seedApp({ id: 'app-1', user: 'user-1', name: 'Old', version: 2 });

      const result = await service.updateApplication('user-1', 'app-1', {
        name: 'New',
      } as Application);

      expect(result.name).toBe('New');
      expect(result.version).toBe(3);
      expect(storedApp('app-1')).toMatchObject({ name: 'New', version: 3 });
    });

    it('throws NotFoundException for a missing application', async () => {
      await expect(
        service.updateApplication('user-1', 'missing', {} as Application),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      seedApp({ id: 'app-1', user: 'owner', name: 'Keep' });

      await expect(
        service.updateApplication('intruder', 'app-1', {
          name: 'Hacked',
        } as Application),
      ).rejects.toBeInstanceOf(ForbiddenException);
      expect(storedApp('app-1').name).toBe('Keep');
    });

    it('ignores attempts to change the owner, the id or the version via the dto', async () => {
      seedApp({ id: 'app-1', user: 'owner', name: 'Old', version: 1 });

      const result = await service.updateApplication('owner', 'app-1', {
        id: 'other-id',
        user: 'attacker',
        version: 99,
        name: 'New',
      } as Application);

      expect(result.user).toBe('owner');
      expect(result.id).toBe('app-1');
      expect(result.version).toBe(2);
      expect(storedApp('app-1').user).toBe('owner');
    });

    it('throws ConflictException on a stale expectedVersion', async () => {
      seedApp({ id: 'app-1', user: 'u', name: 'v2', version: 2 });

      await expect(
        service.updateApplication('u', 'app-1', {
          name: 'stale',
          expectedVersion: 1,
        } as Application & { expectedVersion?: number }),
      ).rejects.toBeInstanceOf(ConflictException);
      expect(storedApp('app-1').name).toBe('v2');
    });

    it('accepts a matching expectedVersion', async () => {
      seedApp({ id: 'app-1', user: 'u', name: 'v2', version: 2 });

      const result = await service.updateApplication('u', 'app-1', {
        name: 'v3',
        expectedVersion: 2,
      } as Application & { expectedVersion?: number });

      expect(result).toMatchObject({ name: 'v3', version: 3 });
    });

    it('skips the version check when expectedVersion is omitted (last write wins)', async () => {
      seedApp({ id: 'app-1', user: 'u', name: 'v5', version: 5 });

      const result = await service.updateApplication('u', 'app-1', {
        name: 'newer',
      } as Application);

      expect(result.version).toBe(6);
    });
  });

  describe('removeApplication', () => {
    it('deletes an owned application', async () => {
      seedApp({ id: 'app-1', user: 'user-1' });

      await service.removeApplication('user-1', 'app-1');

      expect(appRepo.docs.has('app-1')).toBe(false);
    });

    it('throws ForbiddenException for a foreign application and keeps it', async () => {
      seedApp({ id: 'app-1', user: 'owner' });

      await expect(
        service.removeApplication('intruder', 'app-1'),
      ).rejects.toBeInstanceOf(ForbiddenException);
      expect(appRepo.docs.has('app-1')).toBe(true);
    });

    it('propagates repository failures', async () => {
      seedApp({ id: 'app-1', user: 'u' });
      jest.spyOn(appRepo, 'delete').mockRejectedValue(new Error('boom'));

      await expect(service.removeApplication('u', 'app-1')).rejects.toThrow(
        'boom',
      );
    });

    it('cascade-deletes the themes of the application', async () => {
      seedApp({ id: 'app-1', user: 'user-1' });
      themeRepo.seed(
        { id: 't1', applicationId: 'app-1' } as Theme,
        { id: 't2', applicationId: 'app-1' } as Theme,
        { id: 't3', applicationId: 'other-app' } as Theme,
      );

      await service.removeApplication('user-1', 'app-1');

      expect(
        themesService.deleteTheme.mock.calls.map((c) => c[2]).sort(),
      ).toEqual(['t1', 't2']);
      expect(
        themesService.deleteTheme.mock.calls.every(
          (c) => c[0] === 'user-1' && c[1] === 'app-1',
        ),
      ).toBe(true);
      expect(appRepo.docs.has('app-1')).toBe(false);
    });

    it('still deletes the application when a theme fails to delete', async () => {
      seedApp({ id: 'app-1', user: 'user-1' });
      themeRepo.seed({ id: 't1', applicationId: 'app-1' } as Theme);
      themesService.deleteTheme.mockRejectedValue(new Error('stuck theme'));

      await service.removeApplication('user-1', 'app-1');

      expect(appRepo.docs.has('app-1')).toBe(false);
    });
  });

  describe('listApplications', () => {
    it('returns only applications of the given user', async () => {
      seedApp({ id: 'a1', user: 'user-1' });
      seedApp({ id: 'a2', user: 'user-2' });
      seedApp({ id: 'a3', user: 'user-1' });

      const result = await service.listApplications('user-1');

      expect(result.map((a) => a.id).sort()).toEqual(['a1', 'a3']);
    });
  });

  describe('getApplicationEnvironment', () => {
    it('returns the environment map to the owner', async () => {
      seedApp({ id: 'app-1', user: 'user-1', environment: { KEY: 'value' } });

      expect(
        await service.getApplicationEnvironment('user-1', 'app-1'),
      ).toEqual({ KEY: 'value' });
    });

    it('returns an empty object when the application has no environment', async () => {
      seedApp({ id: 'app-1', user: 'user-1' });

      expect(
        await service.getApplicationEnvironment('user-1', 'app-1'),
      ).toEqual({});
    });

    it('throws NotFoundException for a missing application', async () => {
      await expect(
        service.getApplicationEnvironment('user-1', 'missing'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      seedApp({ id: 'app-1', user: 'owner' });

      await expect(
        service.getApplicationEnvironment('intruder', 'app-1'),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });
  });

  describe('updateApplicationEnvironment', () => {
    it('shallow-merges new keys and bumps the version', async () => {
      seedApp({
        id: 'app-1',
        user: 'user-1',
        environment: { KEEP: '1', OVERRIDE: 'old' },
        version: 1,
      });

      const result = await service.updateApplicationEnvironment(
        'user-1',
        'app-1',
        { OVERRIDE: 'new', ADDED: true },
      );

      expect(result.environment).toEqual({
        KEEP: '1',
        OVERRIDE: 'new',
        ADDED: true,
      });
      expect(result.version).toBe(2);
    });

    it('throws ConflictException on a stale expectedVersion', async () => {
      seedApp({
        id: 'app-1',
        user: 'u',
        environment: { KEY: 'current' },
        version: 3,
      });

      await expect(
        service.updateApplicationEnvironment('u', 'app-1', { KEY: 'stale' }, 2),
      ).rejects.toBeInstanceOf(ConflictException);
      expect(storedApp('app-1').environment).toEqual({ KEY: 'current' });
    });

    it('skips the version check when expectedVersion is omitted (last write wins)', async () => {
      seedApp({ id: 'app-1', user: 'u', environment: {}, version: 5 });

      const result = await service.updateApplicationEnvironment('u', 'app-1', {
        KEY: 'v',
      });

      expect(result.version).toBe(6);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      seedApp({ id: 'app-1', user: 'owner' });

      await expect(
        service.updateApplicationEnvironment('intruder', 'app-1', {}),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });
  });

  describe('updateThemeBindings', () => {
    it('throws NotFoundException for a missing application', async () => {
      await expect(
        service.updateThemeBindings('user-1', 'missing', {} as any),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      seedApp({ id: 'app-1', user: 'owner' });

      await expect(
        service.updateThemeBindings('intruder', 'app-1', {} as any),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });

    it('rejects theme ids that do not belong to the application', async () => {
      seedApp({ id: 'app-1', user: 'user-1' });
      themeRepo.seed({ id: 't1', applicationId: 'other-app' } as Theme);

      await expect(
        service.updateThemeBindings('user-1', 'app-1', {
          defaultThemeId: 't1',
        } as any),
      ).rejects.toBeInstanceOf(BadRequestException);
    });

    it('merges themeByEnv, sets the default theme and bumps the version', async () => {
      seedApp({
        id: 'app-1',
        user: 'user-1',
        themeByEnv: { dev: 't-dev' },
        version: 1,
      });
      themeRepo.seed(
        { id: 't-prod', applicationId: 'app-1' } as Theme,
        { id: 't-default', applicationId: 'app-1' } as Theme,
      );

      const result = await service.updateThemeBindings('user-1', 'app-1', {
        defaultThemeId: 't-default',
        themeByEnv: { prod: 't-prod' },
      } as any);

      expect(result.theme).toBe('t-default');
      expect(result.themeByEnv).toEqual({ dev: 't-dev', prod: 't-prod' });
      expect(result.version).toBe(2);
    });

    it('throws ConflictException on a stale expectedVersion', async () => {
      seedApp({ id: 'app-1', user: 'user-1', version: 2 });

      await expect(
        service.updateThemeBindings('user-1', 'app-1', {
          expectedVersion: 1,
        } as any),
      ).rejects.toBeInstanceOf(ConflictException);
    });
  });

  describe('resolveThemeIdForBuild', () => {
    it('prefers themeByEnv[env] over everything else', async () => {
      seedApp({
        id: 'app-1',
        user: 'user-1',
        theme: 't-default',
        themeByEnv: { prod: 't-prod' },
      });

      expect(
        await service.resolveThemeIdForBuild('user-1', 'app-1', 'prod'),
      ).toEqual({ themeId: 't-prod' });
    });

    it('falls back to the default theme binding', async () => {
      seedApp({ id: 'app-1', user: 'user-1', theme: 't-default' });

      expect(
        await service.resolveThemeIdForBuild('user-1', 'app-1', 'prod'),
      ).toEqual({ themeId: 't-default' });
    });

    it('falls back to a theme labeled with the env', async () => {
      seedApp({ id: 'app-1', user: 'user-1' });
      themeRepo.seed(
        { id: 't1', applicationId: 'app-1', label: 'dev' } as Theme,
        { id: 't2', applicationId: 'app-1', label: 'prod' } as Theme,
      );

      expect(
        await service.resolveThemeIdForBuild('user-1', 'app-1', 'prod'),
      ).toEqual({ themeId: 't2' });
    });

    it('falls back to any theme of the application', async () => {
      seedApp({ id: 'app-1', user: 'user-1' });
      themeRepo.seed({ id: 't1', applicationId: 'app-1' } as Theme);

      expect(
        await service.resolveThemeIdForBuild('user-1', 'app-1', 'prod'),
      ).toEqual({ themeId: 't1' });
    });

    it('throws NotFoundException when the application has no themes', async () => {
      seedApp({ id: 'app-1', user: 'user-1' });

      await expect(
        service.resolveThemeIdForBuild('user-1', 'app-1', 'prod'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      seedApp({ id: 'app-1', user: 'owner', theme: 't1' });

      await expect(
        service.resolveThemeIdForBuild('intruder', 'app-1', 'prod'),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });
  });
});
