/**
 * Firestore-emulator smoke: exercises the real fireorm repositories, the
 * ownership boundary and the transactional patchTheme path against an
 * actual Firestore instance.
 *
 * Run via `npm run test:e2e` (firebase emulators:exec sets
 * FIRESTORE_EMULATOR_HOST and provides the emulator).
 */
import { ConflictException, ForbiddenException } from '@nestjs/common';
import * as admin from 'firebase-admin';
import { getRepository, initialize } from 'fireorm';

import { ApplicationsService } from '../src/features/applications/applications.service';
import { Application } from '../src/features/applications/entities/application';
import { ThemesService } from '../src/features/themes/themes.service';
import { Theme } from '../src/features/themes/entities/theme';
import { ColorSchemesService } from '../src/features/themes/features/color-schemes/color-schemes.service';
import { ColorScheme } from '../src/features/themes/features/color-schemes/entities/color-scheme.entity';
import { OwnershipService } from '../src/common/data/ownership.service';

jest.setTimeout(30000);

if (!process.env.FIRESTORE_EMULATOR_HOST) {
  throw new Error(
    'FIRESTORE_EMULATOR_HOST is not set - run this suite via `npm run test:e2e`',
  );
}

const UID = 'e2e-user';

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
    const ownership = new OwnershipService(appRepo as any, themeRepo as any);

    colorSchemes = new ColorSchemesService(colorSchemeRepo as any, ownership);
    // Only repository-backed methods are exercised, so the asset/artifact/
    // storage collaborators are not needed here.
    themes = new ThemesService(
      themeRepo as any,
      appRepo as any,
      {} as any,
      {} as any,
      {} as any,
      ownership,
    );
    applications = new ApplicationsService(
      appRepo as any,
      themeRepo as any,
      ownership,
      themes,
    );
  });

  afterAll(async () => {
    // Close the admin app so jest can exit without dangling gRPC handles.
    await Promise.all(admin.apps.map((app) => app?.delete()));
  });

  const createApp = async (name: string): Promise<string> => {
    const created = await applications.createApplication(UID, {
      name,
    } as unknown as Application);
    expect(created).not.toBeNull();
    return created!.id;
  };

  it('application lifecycle: create, read, environment merge, list by user', async () => {
    const created = await applications.createApplication(UID, {
      name: 'E2E App',
      environment: { KEEP: 'yes', OVERRIDE: 'old' },
    } as unknown as Application);
    expect(created).not.toBeNull();
    const appId = created!.id;

    const found = await applications.findApplicationById(UID, appId);
    expect(found).toMatchObject({ id: appId, user: UID });

    const updated = await applications.updateApplicationEnvironment(
      UID,
      appId,
      { OVERRIDE: 'new' },
    );
    expect(updated!.environment).toEqual({ KEEP: 'yes', OVERRIDE: 'new' });

    const list = await applications.listApplications(UID);
    expect(list!.map((a) => a.id)).toContain(appId);
  });

  it('application writes are versioned and conflict on a stale expectedVersion', async () => {
    const appId = await createApp('Versioned App');

    const first = await applications.updateApplicationEnvironment(UID, appId, {
      A: '1',
    });
    expect(first.version).toBe(1);

    await expect(
      applications.updateApplicationEnvironment(UID, appId, { A: 'stale' }, 0),
    ).rejects.toBeInstanceOf(ConflictException);

    const second = await applications.updateApplicationEnvironment(
      UID,
      appId,
      { B: '2' },
      1,
    );
    expect(second.version).toBe(2);
    expect(second.environment).toEqual({ A: '1', B: '2' });
  });

  it('ownership boundary: a foreign uid is rejected end-to-end', async () => {
    const appId = await createApp('Ownership App');

    await expect(
      applications.findApplicationById('intruder', appId),
    ).rejects.toBeInstanceOf(ForbiddenException);

    const theme = await themes.createTheme(
      appId,
      { title: 'Private', description: 'mine', label: 'dev' } as any,
      UID,
    );

    await expect(
      themes.patchTheme(
        appId,
        theme.id,
        { title: 'Hacked' } as any,
        'intruder',
      ),
    ).rejects.toBeInstanceOf(ForbiddenException);

    await expect(
      colorSchemes.upsertByThemeVariant('intruder', appId, theme.id, 'light', {
        config: { seed: '#000000' },
      }),
    ).rejects.toBeInstanceOf(ForbiddenException);
  });

  it('resolveThemeIdForBuild follows the documented precedence', async () => {
    const appId = await createApp('Resolve App');

    const theme = await themes.createTheme(
      appId,
      {
        title: 'Prod theme',
        description: 'labeled prod',
        label: 'prod',
      } as any,
      UID,
    );

    // No bindings yet: falls through to the label match.
    const byLabel = await applications.resolveThemeIdForBuild(
      UID,
      appId,
      'prod',
    );
    expect(byLabel.themeId).toBe(theme.id);

    // Default binding wins over the label.
    await applications.updateThemeBindings(UID, appId, {
      defaultThemeId: theme.id,
    } as any);
    const byDefault = await applications.resolveThemeIdForBuild(
      UID,
      appId,
      'dev',
    );
    expect(byDefault.themeId).toBe(theme.id);
  });

  it('color scheme optimistic locking against real Firestore', async () => {
    const appId = await createApp('Colors App');
    const theme = await themes.createTheme(
      appId,
      { title: 'Colored', description: 'x', label: 'dev' } as any,
      UID,
    );

    const created = await colorSchemes.upsertByThemeVariant(
      UID,
      appId,
      theme.id,
      'light',
      { config: { seed: '#112233' } },
    );
    expect(created.version).toBe(1);

    await expect(
      colorSchemes.upsertByThemeVariant(UID, appId, theme.id, 'light', {
        config: { seed: '#000000' },
        expectedVersion: 0,
      }),
    ).rejects.toBeInstanceOf(ConflictException);

    const merged = await colorSchemes.upsertByThemeVariant(
      UID,
      appId,
      theme.id,
      'light',
      { config: { extra: true }, expectedVersion: 1 },
    );
    expect(merged.version).toBe(2);
    expect(merged.config).toEqual({ seed: '#112233', extra: true });
  });

  it('patchTheme is transactional and enforces expectedVersion', async () => {
    const appId = await createApp('Patch App');
    const theme = await themes.createTheme(
      appId,
      { title: 'Patch me', description: 'initial', label: 'dev' } as any,
      UID,
    );

    const patched = await themes.patchTheme(
      appId,
      theme.id,
      { title: 'Patched', expectedVersion: 1 } as any,
      UID,
    );
    expect(patched).toMatchObject({ title: 'Patched', version: 2 });

    await expect(
      themes.patchTheme(
        appId,
        theme.id,
        { title: 'Stale write', expectedVersion: 1 } as any,
        UID,
      ),
    ).rejects.toBeInstanceOf(ConflictException);
  });
});
