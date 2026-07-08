import { ForbiddenException, NotFoundException } from '@nestjs/common';

import { ApplicationCapabilitiesService } from './capabilities.service';
import { ApplicationCapabilities } from './entities/capability.entity';
import { Application } from '../../entities/application';
import { Theme } from '../../../themes/entities/theme';
import { OwnershipService } from '../../../../common/data/ownership.service';
import { InMemoryRepo } from '../../../../testing/in-memory-repo';

/**
 * Ownership enforcement tests for the capabilities service. update() runs a
 * real admin.firestore() transaction and is intentionally NOT unit-tested
 * here (mocking firebase-admin would only pin the mock, not the behavior);
 * its ownership assert is the same call covered by get()/getOrCreate().
 */
describe('ApplicationCapabilitiesService', () => {
  let appRepo: InMemoryRepo<Application>;
  let themeRepo: InMemoryRepo<Theme>;
  let capsRepo: InMemoryRepo<ApplicationCapabilities>;
  let service: ApplicationCapabilitiesService;

  beforeEach(() => {
    appRepo = new InMemoryRepo<Application>();
    themeRepo = new InMemoryRepo<Theme>();
    capsRepo = new InMemoryRepo<ApplicationCapabilities>();
    const ownership = new OwnershipService(appRepo as any, themeRepo as any);
    service = new ApplicationCapabilitiesService(capsRepo as any, ownership);
    appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);
  });

  describe('get', () => {
    it('returns the capabilities document to the application owner', async () => {
      capsRepo.seed({
        id: 'app-1',
        applicationId: 'app-1',
        version: 3,
      } as ApplicationCapabilities);

      const result = await service.get('user-1', 'app-1');

      expect(result).toMatchObject({ id: 'app-1', version: 3 });
    });

    it('throws ForbiddenException for a foreign application', async () => {
      capsRepo.seed({
        id: 'app-1',
        applicationId: 'app-1',
      } as ApplicationCapabilities);

      await expect(service.get('intruder', 'app-1')).rejects.toBeInstanceOf(
        ForbiddenException,
      );
    });

    it('throws NotFoundException for a missing application', async () => {
      await expect(service.get('user-1', 'missing')).rejects.toBeInstanceOf(
        NotFoundException,
      );
    });

    it('throws NotFoundException when the owned application has no capabilities document', async () => {
      await expect(service.get('user-1', 'app-1')).rejects.toBeInstanceOf(
        NotFoundException,
      );
    });
  });

  describe('getOrCreate', () => {
    it('creates a default document with updatedBy taken from the uid', async () => {
      const result = await service.getOrCreate('user-1', 'app-1');

      expect(result).toMatchObject({
        id: 'app-1',
        applicationId: 'app-1',
        version: 0,
        updatedBy: 'user-1',
        updatedFrom: 'api',
      });
      expect(capsRepo.docs.has('app-1')).toBe(true);
    });

    it('returns the existing document unchanged', async () => {
      capsRepo.seed({
        id: 'app-1',
        applicationId: 'app-1',
        version: 7,
        updatedBy: 'someone',
      } as ApplicationCapabilities);

      const result = await service.getOrCreate('user-1', 'app-1');

      expect(result).toMatchObject({ version: 7, updatedBy: 'someone' });
    });

    it('throws ForbiddenException for a foreign application and creates nothing', async () => {
      await expect(
        service.getOrCreate('intruder', 'app-1'),
      ).rejects.toBeInstanceOf(ForbiddenException);
      expect(capsRepo.docs.size).toBe(0);
    });

    it('throws NotFoundException for a missing application', async () => {
      await expect(
        service.getOrCreate('user-1', 'missing'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });
  });
});
