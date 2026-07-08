import { ForbiddenException, NotFoundException } from '@nestjs/common';

import { OwnershipService } from './ownership.service';
import { Application } from '../../features/applications/entities/application';
import { Theme } from '../../features/themes/entities/theme';
import { InMemoryRepo } from '../../testing/in-memory-repo';

describe('OwnershipService', () => {
  let appRepo: InMemoryRepo<Application>;
  let themeRepo: InMemoryRepo<Theme>;
  let service: OwnershipService;

  beforeEach(() => {
    appRepo = new InMemoryRepo<Application>();
    themeRepo = new InMemoryRepo<Theme>();
    service = new OwnershipService(appRepo as any, themeRepo as any);
  });

  describe('assertOwnsApplication', () => {
    it('returns the application to its owner', async () => {
      appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);

      const result = await service.assertOwnsApplication('user-1', 'app-1');

      expect(result).toMatchObject({ id: 'app-1', user: 'user-1' });
    });

    it('throws NotFoundException for a missing application', async () => {
      await expect(
        service.assertOwnsApplication('user-1', 'missing'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      appRepo.seed({ id: 'app-1', user: 'owner' } as Application);

      await expect(
        service.assertOwnsApplication('intruder', 'app-1'),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });

    it('treats a repository read failure as NotFoundException', async () => {
      jest.spyOn(appRepo, 'findById').mockRejectedValue(new Error('boom'));

      await expect(
        service.assertOwnsApplication('user-1', 'app-1'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });
  });

  describe('assertOwnsTheme', () => {
    beforeEach(() => {
      appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);
    });

    it('returns the theme when the caller owns its application', async () => {
      themeRepo.seed({ id: 't1', applicationId: 'app-1' } as Theme);

      const result = await service.assertOwnsTheme('user-1', 'app-1', 't1');

      expect(result).toMatchObject({ id: 't1', applicationId: 'app-1' });
    });

    it('throws ForbiddenException before touching the theme when the app is foreign', async () => {
      themeRepo.seed({ id: 't1', applicationId: 'app-1' } as Theme);

      await expect(
        service.assertOwnsTheme('intruder', 'app-1', 't1'),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });

    it('throws NotFoundException for a missing theme', async () => {
      await expect(
        service.assertOwnsTheme('user-1', 'app-1', 'missing'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws NotFoundException when the theme belongs to another application', async () => {
      themeRepo.seed({ id: 't1', applicationId: 'other-app' } as Theme);

      await expect(
        service.assertOwnsTheme('user-1', 'app-1', 't1'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });
  });
});
