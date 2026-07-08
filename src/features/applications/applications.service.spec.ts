import { BadRequestException, NotFoundException } from '@nestjs/common';

import { ApplicationsService } from './applications.service';
import { Application } from './entities/application';
import { Theme } from '../themes/entities/theme';
import { InMemoryRepo } from '../../testing/in-memory-repo';

/**
 * Characterization tests: they pin the CURRENT behavior of the service,
 * including known gaps (no ownership enforcement, errors swallowed to null,
 * no optimistic locking). When a gap is fixed, update the matching test.
 */
describe('ApplicationsService', () => {
  let appRepo: InMemoryRepo<Application>;
  let themeRepo: InMemoryRepo<Theme>;
  let service: ApplicationsService;

  beforeEach(() => {
    appRepo = new InMemoryRepo<Application>();
    themeRepo = new InMemoryRepo<Theme>();
    service = new ApplicationsService(appRepo as any, themeRepo as any);
  });

  describe('createApplication', () => {
    it('stores the application with user taken from the uid argument', async () => {
      const result = await service.createApplication('user-1', {
        name: 'My App',
        user: 'someone-else',
      } as Application);

      expect(result).not.toBeNull();
      expect(result!.user).toBe('user-1');
      expect(appRepo.docs.get(result!.id)!.user).toBe('user-1');
    });

    it('rejects on repository failure (the create promise is returned without await, so the catch never fires)', async () => {
      jest.spyOn(appRepo, 'create').mockRejectedValue(new Error('boom'));

      await expect(
        service.createApplication('user-1', { name: 'x' } as Application),
      ).rejects.toThrow('boom');
    });
  });

  describe('findApplicationById', () => {
    it('returns the application by id', async () => {
      appRepo.seed({ id: 'app-1', user: 'user-1', name: 'A' } as Application);

      expect(await service.findApplicationById('app-1')).toMatchObject({
        id: 'app-1',
      });
    });

    it('returns null for a missing application', async () => {
      expect(await service.findApplicationById('missing')).toBeNull();
    });

    it('takes no uid: any caller can read any application (no ownership check)', async () => {
      appRepo.seed({ id: 'app-1', user: 'owner' } as Application);

      const result = await service.findApplicationById('app-1');

      expect(result!.user).toBe('owner');
    });

    it('swallows repository errors and returns null', async () => {
      jest.spyOn(appRepo, 'findById').mockRejectedValue(new Error('boom'));

      expect(await service.findApplicationById('app-1')).toBeNull();
    });
  });

  describe('updateApplication', () => {
    it('merges the dto into the stored application', async () => {
      appRepo.seed({ id: 'app-1', user: 'user-1', name: 'Old' } as Application);

      const result = await service.updateApplication('app-1', {
        name: 'New',
      } as Application);

      expect(result!.name).toBe('New');
      expect(appRepo.docs.get('app-1')!.name).toBe('New');
    });

    it('returns null for a missing application', async () => {
      expect(
        await service.updateApplication('missing', {} as Application),
      ).toBeNull();
    });

    it('allows overwriting the owner (user) field - no protection', async () => {
      appRepo.seed({ id: 'app-1', user: 'owner' } as Application);

      const result = await service.updateApplication('app-1', {
        user: 'attacker',
      } as Application);

      expect(result!.user).toBe('attacker');
    });

    it('has no optimistic locking: a stale write silently wins', async () => {
      appRepo.seed({ id: 'app-1', user: 'u', name: 'v1' } as Application);

      await service.updateApplication('app-1', { name: 'v2' } as Application);
      const result = await service.updateApplication('app-1', {
        name: 'stale',
      } as Application);

      expect(result!.name).toBe('stale');
    });

    it('swallows repository errors and returns null', async () => {
      appRepo.seed({ id: 'app-1', user: 'u' } as Application);
      jest.spyOn(appRepo, 'update').mockRejectedValue(new Error('boom'));

      expect(
        await service.updateApplication('app-1', {} as Application),
      ).toBeNull();
    });
  });

  describe('removeApplication', () => {
    it('deletes the application', async () => {
      appRepo.seed({ id: 'app-1', user: 'u' } as Application);

      await service.removeApplication('app-1');

      expect(appRepo.docs.has('app-1')).toBe(false);
    });

    it('swallows repository errors and returns null', async () => {
      jest.spyOn(appRepo, 'delete').mockRejectedValue(new Error('boom'));

      expect(await service.removeApplication('app-1')).toBeNull();
    });
  });

  describe('listApplications', () => {
    it('returns only applications of the given user', async () => {
      appRepo.seed(
        { id: 'a1', user: 'user-1' } as Application,
        { id: 'a2', user: 'user-2' } as Application,
        { id: 'a3', user: 'user-1' } as Application,
      );

      const result = await service.listApplications('user-1');

      expect(result!.map((a) => a.id).sort()).toEqual(['a1', 'a3']);
    });
  });

  describe('getApplicationEnvironment', () => {
    it('returns the environment map', async () => {
      appRepo.seed({
        id: 'app-1',
        environment: { KEY: 'value' },
      } as Application);

      expect(await service.getApplicationEnvironment('app-1')).toEqual({
        KEY: 'value',
      });
    });

    it('returns an empty object when the application has no environment', async () => {
      appRepo.seed({ id: 'app-1' } as Application);

      expect(await service.getApplicationEnvironment('app-1')).toEqual({});
    });

    it('returns null for a missing application', async () => {
      expect(await service.getApplicationEnvironment('missing')).toBeNull();
    });
  });

  describe('updateApplicationEnvironment', () => {
    it('shallow-merges new keys over the existing environment', async () => {
      appRepo.seed({
        id: 'app-1',
        environment: { KEEP: '1', OVERRIDE: 'old' },
      } as Application);

      const result = await service.updateApplicationEnvironment('app-1', {
        OVERRIDE: 'new',
        ADDED: true,
      });

      expect(result!.environment).toEqual({
        KEEP: '1',
        OVERRIDE: 'new',
        ADDED: true,
      });
    });

    it('has no optimistic locking (no expectedVersion support)', async () => {
      appRepo.seed({
        id: 'app-1',
        environment: { KEY: 'first' },
      } as Application);

      await service.updateApplicationEnvironment('app-1', { KEY: 'second' });
      const result = await service.updateApplicationEnvironment('app-1', {
        KEY: 'stale',
      });

      expect(result!.environment).toEqual({ KEY: 'stale' });
    });

    it('returns null for a missing application', async () => {
      expect(
        await service.updateApplicationEnvironment('missing', {}),
      ).toBeNull();
    });
  });

  describe('updateThemeBindings', () => {
    it('throws NotFoundException for a missing application', async () => {
      await expect(
        service.updateThemeBindings('missing', {} as any),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('rejects theme ids that do not belong to the application', async () => {
      appRepo.seed({ id: 'app-1' } as Application);
      themeRepo.seed({ id: 't1', applicationId: 'other-app' } as Theme);

      await expect(
        service.updateThemeBindings('app-1', { defaultThemeId: 't1' } as any),
      ).rejects.toBeInstanceOf(BadRequestException);
    });

    it('merges themeByEnv and sets the default theme', async () => {
      appRepo.seed({
        id: 'app-1',
        themeByEnv: { dev: 't-dev' },
      } as Application);
      themeRepo.seed(
        { id: 't-prod', applicationId: 'app-1' } as Theme,
        { id: 't-default', applicationId: 'app-1' } as Theme,
      );

      const result = await service.updateThemeBindings('app-1', {
        defaultThemeId: 't-default',
        themeByEnv: { prod: 't-prod' },
      } as any);

      expect(result.theme).toBe('t-default');
      expect(result.themeByEnv).toEqual({ dev: 't-dev', prod: 't-prod' });
    });
  });

  describe('resolveThemeIdForBuild', () => {
    it('prefers themeByEnv[env] over everything else', async () => {
      appRepo.seed({
        id: 'app-1',
        theme: 't-default',
        themeByEnv: { prod: 't-prod' },
      } as Application);

      expect(await service.resolveThemeIdForBuild('app-1', 'prod')).toEqual({
        themeId: 't-prod',
      });
    });

    it('falls back to the default theme binding', async () => {
      appRepo.seed({ id: 'app-1', theme: 't-default' } as Application);

      expect(await service.resolveThemeIdForBuild('app-1', 'prod')).toEqual({
        themeId: 't-default',
      });
    });

    it('falls back to a theme labeled with the env', async () => {
      appRepo.seed({ id: 'app-1' } as Application);
      themeRepo.seed(
        { id: 't1', applicationId: 'app-1', label: 'dev' } as Theme,
        { id: 't2', applicationId: 'app-1', label: 'prod' } as Theme,
      );

      expect(await service.resolveThemeIdForBuild('app-1', 'prod')).toEqual({
        themeId: 't2',
      });
    });

    it('falls back to any theme of the application', async () => {
      appRepo.seed({ id: 't1-holder' } as Application);
      appRepo.seed({ id: 'app-1' } as Application);
      themeRepo.seed({ id: 't1', applicationId: 'app-1' } as Theme);

      expect(await service.resolveThemeIdForBuild('app-1', 'prod')).toEqual({
        themeId: 't1',
      });
    });

    it('throws NotFoundException when the application has no themes', async () => {
      appRepo.seed({ id: 'app-1' } as Application);

      await expect(
        service.resolveThemeIdForBuild('app-1', 'prod'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws NotFoundException for a missing application', async () => {
      await expect(
        service.resolveThemeIdForBuild('missing', 'prod'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });
  });
});
