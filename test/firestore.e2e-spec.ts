/**
 * Firestore-emulator smoke: exercises the real fireorm repositories and the
 * transactional patchTheme path against an actual Firestore instance.
 *
 * Run via `npm run test:e2e` (firebase emulators:exec sets
 * FIRESTORE_EMULATOR_HOST and provides the emulator).
 */
import { ConflictException } from '@nestjs/common';
import * as admin from 'firebase-admin';
import { getRepository, initialize } from 'fireorm';

import { ApplicationsService } from '../src/features/applications/applications.service';
import { Application } from '../src/features/applications/entities/application';
import { ThemesService } from '../src/features/themes/themes.service';
import { Theme } from '../src/features/themes/entities/theme';
import { ColorSchemesService } from '../src/features/themes/features/color-schemes/color-schemes.service';
import { ColorScheme } from '../src/features/themes/features/color-schemes/entities/color-scheme.entity';

jest.setTimeout(30000);

if (!process.env.FIRESTORE_EMULATOR_HOST) {
  throw new Error(
    'FIRESTORE_EMULATOR_HOST is not set - run this suite via `npm run test:e2e`',
  );
}

describe('Firestore emulator smoke', () => {
  let applications: ApplicationsService;
  let themes: ThemesService;
  let colorSchemes: ColorSchemesService;

  beforeAll(() => {
    admin.initializeApp({ projectId: 'demo-test' });
    initialize(admin.firestore(), { validateModels: false });

    const appRepo = getRepository(Application);
    const themeRepo = getRepository(Theme);
    const colorSchemeRepo = getRepository(ColorScheme);

    applications = new ApplicationsService(appRepo as any, themeRepo as any);
    colorSchemes = new ColorSchemesService(colorSchemeRepo as any);
    // Only repository-backed methods are exercised, so the asset/artifact/
    // storage collaborators are not needed here.
    themes = new ThemesService(
      themeRepo as any,
      appRepo as any,
      {} as any,
      {} as any,
      {} as any,
    );
  });

  afterAll(async () => {
    // Close the admin app so jest can exit without dangling gRPC handles.
    await Promise.all(admin.apps.map((app) => app?.delete()));
  });

  it('application lifecycle: create, read, environment merge, list by user', async () => {
    const created = await applications.createApplication('e2e-user', {
      name: 'E2E App',
      environment: { KEEP: 'yes', OVERRIDE: 'old' },
    } as unknown as Application);
    expect(created).not.toBeNull();
    const appId = created!.id;

    const found = await applications.findApplicationById(appId);
    expect(found).toMatchObject({ id: appId, user: 'e2e-user' });

    const updated = await applications.updateApplicationEnvironment(appId, {
      OVERRIDE: 'new',
    });
    expect(updated!.environment).toEqual({ KEEP: 'yes', OVERRIDE: 'new' });

    const list = await applications.listApplications('e2e-user');
    expect(list!.map((a) => a.id)).toContain(appId);
  });

  it('resolveThemeIdForBuild follows the documented precedence', async () => {
    const app = await applications.createApplication('e2e-user', {
      name: 'Resolve App',
    } as unknown as Application);
    const appId = app!.id;

    const theme = await themes.createTheme(appId, {
      title: 'Prod theme',
      description: 'labeled prod',
      label: 'prod',
    } as any);

    // No bindings yet: falls through to the label match.
    const byLabel = await applications.resolveThemeIdForBuild(appId, 'prod');
    expect(byLabel.themeId).toBe(theme.id);

    // Default binding wins over the label.
    await applications.updateThemeBindings(appId, {
      defaultThemeId: theme.id,
    } as any);
    const byDefault = await applications.resolveThemeIdForBuild(appId, 'dev');
    expect(byDefault.themeId).toBe(theme.id);
  });

  it('color scheme optimistic locking against real Firestore', async () => {
    const created = await colorSchemes.upsertByThemeVariant(
      'e2e-app',
      'e2e-theme',
      'light',
      { config: { seed: '#112233' } },
    );
    expect(created.version).toBe(1);

    await expect(
      colorSchemes.upsertByThemeVariant('e2e-app', 'e2e-theme', 'light', {
        config: { seed: '#000000' },
        expectedVersion: 0,
      }),
    ).rejects.toBeInstanceOf(ConflictException);

    const merged = await colorSchemes.upsertByThemeVariant(
      'e2e-app',
      'e2e-theme',
      'light',
      { config: { extra: true }, expectedVersion: 1 },
    );
    expect(merged.version).toBe(2);
    expect(merged.config).toEqual({ seed: '#112233', extra: true });
  });

  it('patchTheme is transactional and enforces expectedVersion', async () => {
    const theme = await themes.createTheme('e2e-app-2', {
      title: 'Patch me',
      description: 'initial',
      label: 'dev',
    } as any);

    const patched = await themes.patchTheme('e2e-app-2', theme.id, {
      title: 'Patched',
      expectedVersion: 1,
    } as any);
    expect(patched).toMatchObject({ title: 'Patched', version: 2 });

    await expect(
      themes.patchTheme('e2e-app-2', theme.id, {
        title: 'Stale write',
        expectedVersion: 1,
      } as any),
    ).rejects.toBeInstanceOf(ConflictException);
  });
});
