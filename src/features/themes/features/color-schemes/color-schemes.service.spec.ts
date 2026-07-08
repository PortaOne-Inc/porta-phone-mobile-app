import {
  ConflictException,
  ForbiddenException,
  NotFoundException,
} from '@nestjs/common';

import { ColorSchemesService } from './color-schemes.service';
import { ColorScheme } from './entities/color-scheme.entity';
import { Application } from '../../../applications/entities/application';
import { Theme } from '../../entities/theme';
import { OwnershipService } from '../../../../common/data/ownership.service';
import { InMemoryRepo } from '../../../../testing/in-memory-repo';

/**
 * Characterization tests: pin the CURRENT behavior. Ownership is now
 * enforced (uid -> application -> theme); the non-transactional version
 * check is still a known gap.
 */
describe('ColorSchemesService', () => {
  let repo: InMemoryRepo<ColorScheme>;
  let appRepo: InMemoryRepo<Application>;
  let themeRepo: InMemoryRepo<Theme>;
  let service: ColorSchemesService;

  const seedScheme = (overrides: Partial<ColorScheme> = {}): ColorScheme => {
    const scheme: ColorScheme = {
      id: 't1_light',
      applicationId: 'app-1',
      themeId: 't1',
      variant: 'light',
      config: { seed: '#112233' },
      version: 1,
      createdAt: '2026-01-01T00:00:00.000Z',
      updatedAt: '2026-01-01T00:00:00.000Z',
      ...overrides,
    };
    repo.seed(scheme);
    return scheme;
  };

  beforeEach(() => {
    repo = new InMemoryRepo<ColorScheme>();
    appRepo = new InMemoryRepo<Application>();
    themeRepo = new InMemoryRepo<Theme>();
    appRepo.seed({ id: 'app-1', user: 'user-1' } as Application);
    themeRepo.seed({ id: 't1', applicationId: 'app-1' } as Theme);
    const ownership = new OwnershipService(appRepo as any, themeRepo as any);
    service = new ColorSchemesService(repo as any, ownership);
  });

  describe('getByThemeVariant', () => {
    it('returns the scheme addressed as {themeId}_{variant}', async () => {
      seedScheme();

      const result = await service.getByThemeVariant(
        'user-1',
        'app-1',
        't1',
        'light',
      );

      expect(result.id).toBe('t1_light');
    });

    it('throws NotFoundException for a missing scheme', async () => {
      await expect(
        service.getByThemeVariant('user-1', 'app-1', 't1', 'dark'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws NotFoundException when the scheme belongs to another application', async () => {
      seedScheme({ applicationId: 'other-app' });

      await expect(
        service.getByThemeVariant('user-1', 'app-1', 't1', 'light'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      seedScheme();

      await expect(
        service.getByThemeVariant('intruder', 'app-1', 't1', 'light'),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });
  });

  describe('upsertByThemeVariant', () => {
    it('creates a new scheme with version 1', async () => {
      const result = await service.upsertByThemeVariant(
        'user-1',
        'app-1',
        't1',
        'dark',
        { config: { seed: '#000000' } },
      );

      expect(result).toMatchObject({
        id: 't1_dark',
        applicationId: 'app-1',
        themeId: 't1',
        variant: 'dark',
        version: 1,
      });
    });

    it('deep-merges the config patch and bumps the version', async () => {
      seedScheme({
        config: { colors: { primary: '#111111', secondary: '#222222' } },
        version: 3,
      });

      const result = await service.upsertByThemeVariant(
        'user-1',
        'app-1',
        't1',
        'light',
        { config: { colors: { primary: '#999999' } } },
      );

      expect(result.config).toEqual({
        colors: { primary: '#999999', secondary: '#222222' },
      });
      expect(result.version).toBe(4);
    });

    it('keeps the existing config but still bumps the version on an empty patch', async () => {
      seedScheme({ config: { seed: '#112233' }, version: 1 });

      const result = await service.upsertByThemeVariant(
        'user-1',
        'app-1',
        't1',
        'light',
        { config: {} },
      );

      expect(result.config).toEqual({ seed: '#112233' });
      expect(result.version).toBe(2);
    });

    it('throws ConflictException on a stale expectedVersion', async () => {
      seedScheme({ version: 2 });

      await expect(
        service.upsertByThemeVariant('user-1', 'app-1', 't1', 'light', {
          config: { seed: '#000000' },
          expectedVersion: 1,
        }),
      ).rejects.toBeInstanceOf(ConflictException);
    });

    it('accepts a matching expectedVersion', async () => {
      seedScheme({ version: 2 });

      const result = await service.upsertByThemeVariant(
        'user-1',
        'app-1',
        't1',
        'light',
        { config: {}, expectedVersion: 2 },
      );

      expect(result.version).toBe(3);
    });

    it('skips the version check when expectedVersion is omitted (last write wins)', async () => {
      seedScheme({ version: 5 });

      const result = await service.upsertByThemeVariant(
        'user-1',
        'app-1',
        't1',
        'light',
        { config: { seed: '#ffffff' } },
      );

      expect(result.version).toBe(6);
    });

    it('throws ForbiddenException for a foreign application', async () => {
      seedScheme();

      await expect(
        service.upsertByThemeVariant('intruder', 'app-1', 't1', 'light', {
          config: { seed: '#000000' },
        }),
      ).rejects.toBeInstanceOf(ForbiddenException);
    });

    it('throws NotFoundException when the theme belongs to another application', async () => {
      themeRepo.seed({ id: 't-foreign', applicationId: 'other-app' } as Theme);

      await expect(
        service.upsertByThemeVariant('user-1', 'app-1', 't-foreign', 'light', {
          config: { seed: '#000000' },
        }),
      ).rejects.toBeInstanceOf(NotFoundException);
    });
  });

  describe('ensurePair', () => {
    it('creates both variants when none exist', async () => {
      const result = await service.ensurePair('user-1', 'app-1', 't1');

      expect(result.light.id).toBe('t1_light');
      expect(result.dark.id).toBe('t1_dark');
      expect(repo.docs.size).toBe(2);
    });

    it('bumps versions of existing variants instead of resetting them', async () => {
      seedScheme({ version: 2 });

      const result = await service.ensurePair('user-1', 'app-1', 't1');

      expect(result.light.version).toBe(3);
      expect(result.dark.version).toBe(1);
    });
  });

  describe('listForTheme', () => {
    it('returns only variants of the given theme and application', async () => {
      seedScheme();
      seedScheme({ id: 't1_dark', variant: 'dark' });
      seedScheme({ id: 't2_light', themeId: 't2' });
      seedScheme({ id: 't1x_light', applicationId: 'other-app' });

      const result = await service.listForTheme('user-1', 'app-1', 't1');

      expect(result.map((s) => s.id).sort()).toEqual(['t1_dark', 't1_light']);
    });
  });
});
