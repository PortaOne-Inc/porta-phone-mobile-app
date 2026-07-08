import { ConflictException, NotFoundException } from '@nestjs/common';

import { ColorSchemesService } from './color-schemes.service';
import { ColorScheme } from './entities/color-scheme.entity';
import { InMemoryRepo } from '../../../../testing/in-memory-repo';

/**
 * Characterization tests: pin the CURRENT behavior, including known gaps
 * (no uid/ownership at the service layer, non-transactional version check).
 */
describe('ColorSchemesService', () => {
  let repo: InMemoryRepo<ColorScheme>;
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
    service = new ColorSchemesService(repo as any);
  });

  describe('getByThemeVariant', () => {
    it('returns the scheme addressed as {themeId}_{variant}', async () => {
      seedScheme();

      const result = await service.getByThemeVariant('app-1', 't1', 'light');

      expect(result.id).toBe('t1_light');
    });

    it('throws NotFoundException for a missing scheme', async () => {
      await expect(
        service.getByThemeVariant('app-1', 't1', 'dark'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws NotFoundException when the scheme belongs to another application', async () => {
      seedScheme({ applicationId: 'other-app' });

      await expect(
        service.getByThemeVariant('app-1', 't1', 'light'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('takes no uid: ownership is not enforced at the service layer', async () => {
      seedScheme();

      await expect(
        service.getByThemeVariant('app-1', 't1', 'light'),
      ).resolves.toBeDefined();
    });
  });

  describe('upsertByThemeVariant', () => {
    it('creates a new scheme with version 1', async () => {
      const result = await service.upsertByThemeVariant('app-1', 't1', 'dark', {
        config: { seed: '#000000' },
      });

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
        service.upsertByThemeVariant('app-1', 't1', 'light', {
          config: { seed: '#000000' },
          expectedVersion: 1,
        }),
      ).rejects.toBeInstanceOf(ConflictException);
    });

    it('accepts a matching expectedVersion', async () => {
      seedScheme({ version: 2 });

      const result = await service.upsertByThemeVariant(
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
        'app-1',
        't1',
        'light',
        { config: { seed: '#ffffff' } },
      );

      expect(result.version).toBe(6);
    });
  });

  describe('ensurePair', () => {
    it('creates both variants when none exist', async () => {
      const result = await service.ensurePair('app-1', 't1');

      expect(result.light.id).toBe('t1_light');
      expect(result.dark.id).toBe('t1_dark');
      expect(repo.docs.size).toBe(2);
    });

    it('bumps versions of existing variants instead of resetting them', async () => {
      seedScheme({ version: 2 });

      const result = await service.ensurePair('app-1', 't1');

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

      const result = await service.listForTheme('app-1', 't1');

      expect(result.map((s) => s.id).sort()).toEqual(['t1_dark', 't1_light']);
    });
  });
});
