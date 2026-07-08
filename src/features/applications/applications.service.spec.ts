import {
  BadRequestException,
  ForbiddenException,
  NotFoundException,
} from '@nestjs/common';

import { ApplicationsService } from './applications.service';
import { Application } from './entities/application';
import { Theme } from '../themes/entities/theme';
import { OwnershipService } from '../../common/data/ownership.service';
import { InMemoryRepo } from '../../testing/in-memory-repo';

/**
 * Characterization tests: they pin the CURRENT behavior of the service.
 * Ownership is now enforced (uid -> application.user); the remaining known
 * gaps (errors swallowed to null, no optimistic locking) are still pinned
 * explicitly and will flip in later steps.
 */
describe('ApplicationsService', () => {
  let appRepo: InMemoryRepo<Application>;
  let themeRepo: InMemoryRepo<Theme>;
  let themesService: { deleteTheme: jest.Mock };
  let service: ApplicationsService;

  beforeEach(() => {
    appRepo = new InMemoryRepo<Application>();
    themeRepo = new InMemoryRepo<Theme>();
    themesService = { deleteTheme: jest.fn().mockResolvedValue(undefined) };
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

      expect(result).not.toBeNull();
      expect(result!.user).toBe('user-1');
      expect(appRepo.docs.get(result!.id)!.user).toBe('user-1');
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
      appRepo.seed({ id: 'app-1', user: 'user-1', name: 'A' } as Application);

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
      appRepo.seed({ id: 'app-1', user: 'owner' } as Application);

      await expect(
        service.findApplicationById('intruder', 'app-1'),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });
  });

  describe('updateApplication', () => {
    it('merges the dto into the stored application', async () => {
      appRepo.seed({ id: 'app-1', user: 'user-1', name: 'Old' } as Application);

      const result = await service.updateApplication('user-1', 'app-1', {
        name: 'New',
      } as Application);

      expect(result!.name).toBe('New');
      expect(appRepo.docs.get('app-1')!.name).toBe('New');
    });

    it('throws NotFoundException for a missing application', async () => {
      await expect(
        service.updateApplication('user-1', 'missing', {} as Application),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      appRepo.seed({ id: 'app-1', user: 'owner', name: 'Keep' } as Application);

      await expect(
        service.updateApplication('intruder', 'app-1', {
          name: 'Hacked',
        } as Application),
      ).rejects.toBeInstanceOf(ForbiddenException);
      expect(appRepo.docs.get('app-1')!.name).toBe('Keep');
    });

    it('ignores attempts to change the owner or the id via the dto', async () => {
      appRepo.seed({ id: 'app-1', user: 'owner', name: 'Old' } as Application);

      const result = await service.updateApplication('owner', 'app-1', {
        id: 'other-id',
        user: 'attacker',
        name: 'New',
      } as Application);

      expect(result!.user).toBe('owner');
      expect(result!.id).toBe('app-1');
      expect(appRepo.docs.get('app-1')!.user).toBe('owner');
    });

    it('has no optimistic locking: a stale write silently wins', async () => {
      appRepo.seed({ id: 'app-1', user: 'u', name: 'v1' } as Application);

      await service.updateApplication('u', 'app-1', {
        name: 'v2',
      } as Application);
      const result = await service.updateApplication('u', 'app-1', {
        name: 'stale',
      } as Application);

      expect(result!.name).toBe('stale');
    });

    it('propagates repository failures', async () => {
      appRepo.seed({ id: 'app-1', user: 'u' } as Application);
      jest.spyOn(appRepo, 'update').mockRejectedValue(new Error('boom'));

      await expect(
        service.updateApplication('u', 'app-1', {} as Application),
      ).rejects.toThrow('boom');
    });
  });

  describe('removeApplication', () => {
    it('deletes an owned application', async () => {
      appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);

      await service.removeApplication('user-1', 'app-1');

      expect(appRepo.docs.has('app-1')).toBe(false);
    });

    it('throws ForbiddenException for a foreign application and keeps it', async () => {
      appRepo.seed({ id: 'app-1', user: 'owner' } as Application);

      await expect(
        service.removeApplication('intruder', 'app-1'),
      ).rejects.toBeInstanceOf(ForbiddenException);
      expect(appRepo.docs.has('app-1')).toBe(true);
    });

    it('propagates repository failures', async () => {
      appRepo.seed({ id: 'app-1', user: 'u' } as Application);
      jest.spyOn(appRepo, 'delete').mockRejectedValue(new Error('boom'));

      await expect(service.removeApplication('u', 'app-1')).rejects.toThrow(
        'boom',
      );
    });

    it('cascade-deletes the themes of the application', async () => {
      appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);
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
      appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);
      themeRepo.seed({ id: 't1', applicationId: 'app-1' } as Theme);
      themesService.deleteTheme.mockRejectedValue(new Error('stuck theme'));

      await service.removeApplication('user-1', 'app-1');

      expect(appRepo.docs.has('app-1')).toBe(false);
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
    it('returns the environment map to the owner', async () => {
      appRepo.seed({
        id: 'app-1',
        user: 'user-1',
        environment: { KEY: 'value' },
      } as Application);

      expect(
        await service.getApplicationEnvironment('user-1', 'app-1'),
      ).toEqual({ KEY: 'value' });
    });

    it('returns an empty object when the application has no environment', async () => {
      appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);

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
      appRepo.seed({ id: 'app-1', user: 'owner' } as Application);

      await expect(
        service.getApplicationEnvironment('intruder', 'app-1'),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });
  });

  describe('updateApplicationEnvironment', () => {
    it('shallow-merges new keys over the existing environment', async () => {
      appRepo.seed({
        id: 'app-1',
        user: 'user-1',
        environment: { KEEP: '1', OVERRIDE: 'old' },
      } as Application);

      const result = await service.updateApplicationEnvironment(
        'user-1',
        'app-1',
        { OVERRIDE: 'new', ADDED: true },
      );

      expect(result!.environment).toEqual({
        KEEP: '1',
        OVERRIDE: 'new',
        ADDED: true,
      });
    });

    it('has no optimistic locking (no expectedVersion support)', async () => {
      appRepo.seed({
        id: 'app-1',
        user: 'u',
        environment: { KEY: 'first' },
      } as Application);

      await service.updateApplicationEnvironment('u', 'app-1', {
        KEY: 'second',
      });
      const result = await service.updateApplicationEnvironment('u', 'app-1', {
        KEY: 'stale',
      });

      expect(result!.environment).toEqual({ KEY: 'stale' });
    });

    it('throws ForbiddenException for a foreign application', async () => {
      appRepo.seed({ id: 'app-1', user: 'owner' } as Application);

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
      appRepo.seed({ id: 'app-1', user: 'owner' } as Application);

      await expect(
        service.updateThemeBindings('intruder', 'app-1', {} as any),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });

    it('rejects theme ids that do not belong to the application', async () => {
      appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);
      themeRepo.seed({ id: 't1', applicationId: 'other-app' } as Theme);

      await expect(
        service.updateThemeBindings('user-1', 'app-1', {
          defaultThemeId: 't1',
        } as any),
      ).rejects.toBeInstanceOf(BadRequestException);
    });

    it('merges themeByEnv and sets the default theme', async () => {
      appRepo.seed({
        id: 'app-1',
        user: 'user-1',
        themeByEnv: { dev: 't-dev' },
      } as Application);
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
    });
  });

  describe('resolveThemeIdForBuild', () => {
    it('prefers themeByEnv[env] over everything else', async () => {
      appRepo.seed({
        id: 'app-1',
        user: 'user-1',
        theme: 't-default',
        themeByEnv: { prod: 't-prod' },
      } as Application);

      expect(
        await service.resolveThemeIdForBuild('user-1', 'app-1', 'prod'),
      ).toEqual({ themeId: 't-prod' });
    });

    it('falls back to the default theme binding', async () => {
      appRepo.seed({
        id: 'app-1',
        user: 'user-1',
        theme: 't-default',
      } as Application);

      expect(
        await service.resolveThemeIdForBuild('user-1', 'app-1', 'prod'),
      ).toEqual({ themeId: 't-default' });
    });

    it('falls back to a theme labeled with the env', async () => {
      appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);
      themeRepo.seed(
        { id: 't1', applicationId: 'app-1', label: 'dev' } as Theme,
        { id: 't2', applicationId: 'app-1', label: 'prod' } as Theme,
      );

      expect(
        await service.resolveThemeIdForBuild('user-1', 'app-1', 'prod'),
      ).toEqual({ themeId: 't2' });
    });

    it('falls back to any theme of the application', async () => {
      appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);
      themeRepo.seed({ id: 't1', applicationId: 'app-1' } as Theme);

      expect(
        await service.resolveThemeIdForBuild('user-1', 'app-1', 'prod'),
      ).toEqual({ themeId: 't1' });
    });

    it('throws NotFoundException when the application has no themes', async () => {
      appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);

      await expect(
        service.resolveThemeIdForBuild('user-1', 'app-1', 'prod'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      appRepo.seed({ id: 'app-1', user: 'owner', theme: 't1' } as Application);

      await expect(
        service.resolveThemeIdForBuild('intruder', 'app-1', 'prod'),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });
  });
});
