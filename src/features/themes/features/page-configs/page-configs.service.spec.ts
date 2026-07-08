import { ConflictException, NotFoundException } from '@nestjs/common';

import { PageConfigsService } from './page-configs.service';
import { PageConfigEntity } from './entities/page-config.entity';
import { InMemoryRepo } from '../../../../testing/in-memory-repo';

/**
 * Characterization tests: pin the CURRENT behavior, including known gaps
 * (no uid/ownership at the service layer, non-transactional version check).
 */
describe('PageConfigsService', () => {
  let repo: InMemoryRepo<PageConfigEntity>;
  let assets: { getSignedUrlByIdForApp: jest.Mock };
  let service: PageConfigsService;

  const seedConfig = (
    overrides: Partial<PageConfigEntity> = {},
  ): PageConfigEntity => {
    const entity: PageConfigEntity = {
      id: 't1_light',
      applicationId: 'app-1',
      themeId: 't1',
      variant: 'light',
      config: { login: { title: 'Welcome' } },
      version: 1,
      createdAt: '2026-01-01T00:00:00.000Z',
      updatedAt: '2026-01-01T00:00:00.000Z',
      ...overrides,
    };
    repo.seed(entity);
    return entity;
  };

  beforeEach(() => {
    repo = new InMemoryRepo<PageConfigEntity>();
    assets = { getSignedUrlByIdForApp: jest.fn() };
    service = new PageConfigsService(repo as any, assets as any);
  });

  describe('getByThemeVariant', () => {
    it('returns the config addressed as {themeId}_{variant}', async () => {
      seedConfig();

      const result = await service.getByThemeVariant('app-1', 't1', 'light');

      expect(result.id).toBe('t1_light');
      expect(result.config).toEqual({ login: { title: 'Welcome' } });
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
        config: { login: { title: 'Hi' } },
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
        config: { login: { title: 'Welcome', subtitle: 'Sign in' } },
        version: 2,
      });

      const result = await service.upsertByThemeVariant(
        'app-1',
        't1',
        'light',
        { config: { login: { title: 'Hello' } } },
      );

      expect(result.config).toEqual({
        login: { title: 'Hello', subtitle: 'Sign in' },
      });
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
        { config: { login: { title: 'Stale' } } },
      );

      expect(result.version).toBe(6);
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
