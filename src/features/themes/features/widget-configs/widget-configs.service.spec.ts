import { ConflictException, NotFoundException } from '@nestjs/common';

import { WidgetConfigsService } from './widget-configs.service';
import { WidgetConfigEntity } from './entities/widget-config.entity';
import { InMemoryRepo } from '../../../../testing/in-memory-repo';

/**
 * Characterization tests: pin the CURRENT behavior, including known gaps
 * (no uid/ownership at the service layer, non-transactional version check).
 */
describe('WidgetConfigsService', () => {
  let repo: InMemoryRepo<WidgetConfigEntity>;
  let assets: { getSignedUrlByIdForApp: jest.Mock };
  let service: WidgetConfigsService;

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
    return entity;
  };

  beforeEach(() => {
    repo = new InMemoryRepo<WidgetConfigEntity>();
    assets = { getSignedUrlByIdForApp: jest.fn() };
    service = new WidgetConfigsService(repo as any, assets as any);
  });

  describe('getByThemeVariant', () => {
    it('returns the config addressed as {themeId}_{variant}', async () => {
      seedConfig();

      const result = await service.getByThemeVariant('app-1', 't1', 'light');

      expect(result.id).toBe('t1_light');
      expect(result.config).toEqual({ fontFamily: 'Inter' });
    });

    it('throws NotFoundException for a missing config', async () => {
      await expect(
        service.getByThemeVariant('app-1', 't1', 'dark'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });

    it('throws NotFoundException when the config belongs to another application', async () => {
      seedConfig({ applicationId: 'other-app' });

      await expect(
        service.getByThemeVariant('app-1', 't1', 'light'),
      ).rejects.toBeInstanceOf(NotFoundException);
    });
  });

  describe('upsertByThemeVariant', () => {
    it('creates a new config with version 1', async () => {
      const result = await service.upsertByThemeVariant('app-1', 't1', 'dark', {
        config: { fontFamily: 'Roboto' },
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
      seedConfig({
        config: { buttons: { radius: 4, elevation: 2 } },
        version: 2,
      });

      const result = await service.upsertByThemeVariant(
        'app-1',
        't1',
        'light',
        { config: { buttons: { radius: 8 } } },
      );

      expect(result.config).toEqual({ buttons: { radius: 8, elevation: 2 } });
      expect(result.version).toBe(3);
    });

    it('throws ConflictException on a stale expectedVersion', async () => {
      seedConfig({ version: 2 });

      await expect(
        service.upsertByThemeVariant('app-1', 't1', 'light', {
          config: {},
          expectedVersion: 1,
        }),
      ).rejects.toBeInstanceOf(ConflictException);
    });

    it('skips the version check when expectedVersion is omitted (last write wins)', async () => {
      seedConfig({ version: 5 });

      const result = await service.upsertByThemeVariant(
        'app-1',
        't1',
        'light',
        { config: { fontFamily: 'Roboto' } },
      );

      expect(result.version).toBe(6);
    });
  });

  describe('ensurePair', () => {
    it('creates both variants when none exist', async () => {
      const result = await service.ensurePair('app-1', 't1');

      expect(result.light.id).toBe('t1_light');
      expect(result.dark.id).toBe('t1_dark');
    });
  });

  describe('listForTheme', () => {
    it('returns only variants of the given theme and application', async () => {
      seedConfig();
      seedConfig({ id: 't1_dark', variant: 'dark' });
      seedConfig({ id: 't2_light', themeId: 't2' });

      const result = await service.listForTheme('app-1', 't1');

      expect(result.map((c) => c.id).sort()).toEqual(['t1_dark', 't1_light']);
    });
  });
});
