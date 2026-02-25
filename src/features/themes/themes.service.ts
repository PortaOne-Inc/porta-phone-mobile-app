import * as admin from 'firebase-admin';
import { ConflictException, ForbiddenException, Injectable, Logger, NotFoundException } from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';
import { v4 as uuidv4 } from 'uuid';

import { Theme } from './entities/theme';
import { Application } from '../applications/entities/application';
import { Asset } from '../assets/entities/asset.entity';
import { ArtifactsService } from '../artifacts';
import { AssetsService } from '../assets/assets.service';
import { resolveImageSourceUrlsDeep, extractAssetIdsDeep, remapAssetIdsDeep } from '../../common';
import { CloudStorageService } from '../common';
import { Collections, nowIso, UploadNamespaces } from '../../common';
import { CreateThemeDto, UpdateThemeDto } from './dto/themes.dto';

const ASSET_URL_TTL_SEC = 3600;

type DeleteOpts = {
  purgeOrphanAssets?: boolean;
};

type LegacyAssetItem = {
  id: number | string;
  name: string;
  description: string | null;
  url: string;
  type: string | null;
};

type LegacySplash = {
  originalAssetId: number | string | null;
  pictureUrl: string | null;
  color: string | null;
  padding: number;
  fit:
    | 'fill'
    | 'contain'
    | 'cover'
    | 'fitWidth'
    | 'fitHeight'
    | 'none'
    | 'scaleDown';
};

type LegacyLaunch = {
  originalAssetId: number | string | null;
  notificationLogoUrl: string | null;
  adaptiveIconForegroundUrl: string | null;
  androidLauncherIconUrl: string | null;
  iosLauncherIconUrl: string | null;
  webLauncherIconUrl: string | null;
  adaptiveIconBackgroundUrl: string | null;
  backgroundColor: string | null;
};

type AggregatedTheme = Theme & {
  assets: LegacyAssetItem[];
  splashAssets: LegacySplash;
  launchAssets: LegacyLaunch;
  colorSchemeConfig?: any;
  themeWidgetConfig?: any;
  appConfig?: any;
  themePageConfig?: any;
};

@Injectable()
export class ThemesService {
  private readonly logger = new Logger(ThemesService.name);

  constructor(
    @InjectRepository(Theme)
    private readonly themeRepository: BaseFirestoreRepository<Theme>,
    @InjectRepository(Application)
    private readonly applicationRepository: BaseFirestoreRepository<Application>,
    private readonly artifacts: ArtifactsService,
    private readonly assetsService: AssetsService,
    private readonly cloud: CloudStorageService,
  ) {
  }

  // -------------------- Public API --------------------

  async getThemesByApplicationId(
    applicationId: string,
    uid: string,
  ): Promise<AggregatedTheme[]> {
    const themes = await this.themeRepository
      .whereEqualTo('applicationId', applicationId)
      .find();
    return Promise.all(themes.map((t) => this.aggregateTheme(t, uid)));
  }

  async getAllThemes(uid: string): Promise<AggregatedTheme[]> {
    const themes = await this.themeRepository.find();
    return Promise.all(themes.map((t) => this.aggregateTheme(t, uid)));
  }

  async getAggregatedLegacyThemeById(
    applicationId: string,
    themeId: string,
    uid: string,
  ) {
    const theme = await this.themeRepository.findById(themeId);
    if (!theme || theme.applicationId !== applicationId) {
      throw new NotFoundException(`Theme with ID ${themeId} not found`);
    }

    const [
      assetsLegacy,
      splashLegacy,
      launchLegacy,
      widgetCfgRaw,
      colorSchemeRaw,
      pageCfgRaw,
    ] = await Promise.all([
      this.loadAssetsLegacy(uid, theme.applicationId),
      this.loadSplash(theme.applicationId, theme.id, uid),
      this.loadLaunch(theme.applicationId, theme.id, uid),
      this.loadThemeWidgetConfig(theme.applicationId, theme.id),
      this.loadColorSchemeConfig(theme.applicationId, theme.id),
      this.loadThemePageConfig(theme.applicationId, theme.id),
    ]);

    const colors = buildLegacyColors(colorSchemeRaw);
    const images = buildLegacyImages(widgetCfgRaw, launchLegacy);
    const themePageConfig = buildLegacyPageConfig(pageCfgRaw);
    const themeWidgetConfig = buildLegacyWidgetConfig(widgetCfgRaw);

    return {
      id: theme.id,
      fontFamily: null,
      name: theme.title ?? (theme as any).name ?? 'Original',
      style: null,
      applicationId: theme.applicationId,
      texts: {
        contactEmail: null,
        greeting: 'Webtrit',
      },
      images,
      colors,
      splashAsset: {
        originalAssetId: splashLegacy.originalAssetId,
        pictureUrl: splashLegacy.pictureUrl,
        color: splashLegacy.color,
      },
      launchAssets: launchLegacy,
      splashAssets: splashLegacy,
      themePageConfig,
      themeWidgetConfig,
      assets: assetsLegacy,
      ...((theme as any).appConfig
        ? {appConfig: (theme as any).appConfig}
        : {}),
    };
  }

  async getThemeById(applicationId: string, themeId: string, uid: string) {
    const theme = await this.themeRepository.findById(themeId);
    if (!theme || theme.applicationId !== applicationId) {
      throw new NotFoundException(`Theme with ID ${themeId} not found`);
    }
    return theme;
  }

  async createTheme(
    applicationId: string,
    dto: CreateThemeDto,
    uid?: string,
  ): Promise<Theme> {
    return this.themeRepository.create({
      applicationId,
      title: dto.title,
      description: dto.description,
      label: dto.label,
      version: 1,
    } as Theme);
  }

  async patchTheme(
    applicationId: string,
    themeId: string,
    dto: UpdateThemeDto,
    uid?: string,
  ): Promise<Theme> {
    const db = admin.firestore();
    const ref = db.collection(Collections.themes).doc(themeId);

    const result = await db.runTransaction(async (tx) => {
      const snap = await tx.get(ref);
      if (!snap.exists) {
        throw new NotFoundException(`Theme with ID ${themeId} not found`);
      }

      const current = snap.data() as Theme;
      if (current.applicationId !== applicationId) {
        throw new NotFoundException(`Theme with ID ${themeId} not found`);
      }

      if (
        typeof dto.expectedVersion === 'number' &&
        dto.expectedVersion !== (current.version ?? 0)
      ) {
        throw new ConflictException(
          `Version mismatch: expected ${dto.expectedVersion}, actual ${current.version ?? 0}`,
        );
      }

      const next: Theme = { ...current, id: themeId };
      if (dto.title !== undefined) next.title = dto.title;
      if (dto.description !== undefined) next.description = dto.description;
      if (dto.label !== undefined) next.label = dto.label;
      if (dto.status !== undefined) next.status = dto.status;
      next.version = (current.version ?? 0) + 1;
      next.updatedAt = nowIso();

      tx.set(ref, next);
      return next;
    });

    return result;
  }

  async deleteTheme(
    uid: string,
    applicationId: string,
    themeId: string,
    opts: DeleteOpts = {},
  ): Promise<void> {
    const theme = await this.themeRepository.findById(themeId);
    if (!theme || theme.applicationId !== applicationId) {
      throw new NotFoundException(`Theme with ID ${themeId} not found`);
    }

    const db = admin.firestore();

    // 1. Collect all Firestore document refs to delete atomically
    const refsToDelete: FirebaseFirestore.DocumentReference[] = [];
    const artifactIdsToClean: string[] = [];

    // Feature entitlements
    const feCol = db.collection(Collections.themeFeatureEntitlements);
    const feLegacySnap = await feCol.doc(themeId).get();
    if (feLegacySnap.exists) refsToDelete.push(feLegacySnap.ref);
    const feQuery = await feCol.where('themeId', '==', themeId).get();
    feQuery.docs.forEach((d) => refsToDelete.push(d.ref));

    // Launch assets — collect doc ref + artifact IDs for storage cleanup
    const launchRef = db.collection(Collections.themeAssetsLauncher).doc(themeId);
    const launchSnap = await launchRef.get();
    if (launchSnap.exists) {
      refsToDelete.push(launchRef);
      const outs = (launchSnap.data() as any)?.outputsArtifacts ?? {};
      [
        outs.androidLegacyArtifactId,
        outs.androidAdaptiveForegroundArtifactId,
        outs.androidAdaptiveBackgroundArtifactId,
        outs.iosArtifactId,
        outs.webArtifactId,
      ]
        .filter(Boolean)
        .forEach((id: string) => artifactIdsToClean.push(id));
    }

    // Splash assets — collect doc ref + artifact IDs for storage cleanup
    const splashRef = db.collection(Collections.themeAssetsSplash).doc(themeId);
    const splashSnap = await splashRef.get();
    if (splashSnap.exists) {
      refsToDelete.push(splashRef);
      const splashArtifactId = (splashSnap.data() as any)?.outputsArtifacts
        ?.splashArtifactId;
      if (splashArtifactId) artifactIdsToClean.push(splashArtifactId);
    }

    // Widget configs
    const widgetQuery = await db
      .collection(Collections.themeConfigWidgets)
      .where('themeId', '==', themeId)
      .get();
    widgetQuery.docs.forEach((d) => refsToDelete.push(d.ref));

    // Color scheme configs
    const csCol = db.collection(Collections.themeConfigColorSchemes);
    const csLegacySnap = await csCol.doc(themeId).get();
    if (csLegacySnap.exists) refsToDelete.push(csLegacySnap.ref);
    const csQuery = await csCol.where('themeId', '==', themeId).get();
    csQuery.docs.forEach((d) => refsToDelete.push(d.ref));

    // Page configs
    const pageQuery = await db
      .collection(Collections.themeConfigPages)
      .where('themeId', '==', themeId)
      .get();
    pageQuery.docs.forEach((d) => refsToDelete.push(d.ref));

    // Theme artifacts (Firestore docs)
    const themeArtifacts = await this.artifacts.findAll(
      uid,
      applicationId,
      themeId,
      {},
    );
    themeArtifacts.forEach((a) => artifactIdsToClean.push(a.id));

    // Theme entity itself
    const themeRef = db
      .collection(Collections.themes)
      .doc(theme.id);
    refsToDelete.push(themeRef);

    // 2. Atomic Firestore batch delete (max 500 per batch)
    this.logger.log({
      msg: 'deleteTheme: atomic batch delete',
      themeId,
      firestoreDocsCount: refsToDelete.length,
      artifactCount: artifactIdsToClean.length,
    });

    for (let i = 0; i < refsToDelete.length; i += 500) {
      const chunk = refsToDelete.slice(i, i + 500);
      const batch = db.batch();
      chunk.forEach((ref) => batch.delete(ref));
      await batch.commit();
    }

    // 3. Cloud Storage artifact cleanup — best-effort, never blocks the delete
    const uniqueArtifactIds = [...new Set(artifactIdsToClean)];
    if (uniqueArtifactIds.length > 0) {
      const results = await Promise.allSettled(
        uniqueArtifactIds.map((id) => this.artifacts.remove(uid, id)),
      );
      const failed = results.filter((r) => r.status === 'rejected');
      if (failed.length > 0) {
        this.logger.warn({
          msg: 'deleteTheme: some artifact cleanups failed',
          themeId,
          failedCount: failed.length,
          failedIds: uniqueArtifactIds.filter(
            (_, i) => results[i].status === 'rejected',
          ),
        });
      }
    }

    // 4. Optional orphan asset purge
    if (opts.purgeOrphanAssets) {
      await this.purgeOrphanAssets(uid, applicationId);
    }
  }

  async copyTheme(
    applicationId: string,
    sourceThemeId: string,
    overrides?: Partial<Pick<Theme, 'title' | 'description' | 'label'>>,
    uid?: string,
  ): Promise<Theme | null> {
    const source = await this.themeRepository.findById(sourceThemeId);
    if (!source || source.applicationId !== applicationId) {
      throw new NotFoundException(`Theme with ID ${sourceThemeId} not found`);
    }

    const newThemeId = uuidv4();
    const now = nowIso();
    const db = admin.firestore();
    const batch = db.batch();

    const target: Theme = {
      ...source,
      id: newThemeId,
      applicationId,
      title: overrides?.title ?? `${source.title ?? 'Theme'} (Copy)`,
      description: overrides?.description ?? source.description,
      label: overrides?.label ?? source.label,
      version: 1,
      createdAt: now,
      updatedAt: now,
    } as Theme;

    // Add theme doc to batch
    const themeRef = db.collection(Collections.themes).doc(newThemeId);
    batch.set(themeRef, { ...target });

    // Collect all sub-resource writes into the shared batch
    await Promise.all([
      this.collectWidgetConfigWrites(sourceThemeId, newThemeId, batch),
      this.collectColorSchemeWrites(sourceThemeId, newThemeId, batch),
      this.collectPageConfigWrites(sourceThemeId, newThemeId, batch),
      this.collectSplashWrites(sourceThemeId, newThemeId, batch),
      this.collectLaunchWrites(sourceThemeId, newThemeId, batch),
      this.collectFeatureAccessWrites(sourceThemeId, newThemeId, applicationId, batch),
    ]);

    // Single atomic commit
    await batch.commit();

    return this.aggregateTheme(target, 'system');
  }

  async copyThemeToApplication(
    uid: string,
    sourceApplicationId: string,
    sourceThemeId: string,
    targetApplicationId: string,
    overrides?: Partial<Pick<Theme, 'title' | 'description' | 'label'>>,
  ): Promise<Theme | null> {
    // 1. Validate source theme
    const source = await this.themeRepository.findById(sourceThemeId);
    if (!source || source.applicationId !== sourceApplicationId) {
      throw new NotFoundException(`Theme with ID ${sourceThemeId} not found`);
    }

    // 2. Validate target application exists and is owned by uid
    const targetApp = await this.applicationRepository.findById(targetApplicationId).catch(() => null);
    if (!targetApp) {
      throw new NotFoundException(`Target application ${targetApplicationId} not found`);
    }
    if (targetApp.user !== uid) {
      throw new ForbiddenException('You do not own the target application');
    }

    const db = admin.firestore();
    const newThemeId = uuidv4();
    const now = nowIso();

    // 3. Read all sub-resources in parallel
    const [widgetSnaps, colorSnaps, pageSnaps, splashSnap, launchSnap, feSnaps] =
      await Promise.all([
        db.collection(Collections.themeConfigWidgets).where('themeId', '==', sourceThemeId).get(),
        db.collection(Collections.themeConfigColorSchemes).where('themeId', '==', sourceThemeId).get(),
        db.collection(Collections.themeConfigPages).where('themeId', '==', sourceThemeId).get(),
        db.collection(Collections.themeAssetsSplash).doc(sourceThemeId).get(),
        db.collection(Collections.themeAssetsLauncher).doc(sourceThemeId).get(),
        db.collection(Collections.themeFeatureEntitlements).where('themeId', '==', sourceThemeId).get(),
      ]);

    // 4. Collect all referenced asset IDs
    const allAssetIds = new Set<string>();

    // From widget configs
    for (const doc of widgetSnaps.docs) {
      const data = doc.data();
      extractAssetIdsDeep(data?.config).forEach((id) => allAssetIds.add(id));
    }

    // From page configs
    for (const doc of pageSnaps.docs) {
      const data = doc.data();
      extractAssetIdsDeep(data?.config).forEach((id) => allAssetIds.add(id));
    }

    // From splash
    if (splashSnap.exists) {
      const src = (splashSnap.data() as any)?.source ?? {};
      if (src.foregroundAssetId) allAssetIds.add(src.foregroundAssetId);
      if (src.backgroundAssetId) allAssetIds.add(src.backgroundAssetId);
    }

    // From launch
    if (launchSnap.exists) {
      const src = (launchSnap.data() as any)?.source ?? {};
      if (src.foregroundAssetId) allAssetIds.add(src.foregroundAssetId);
      if (src.backgroundAssetId) allAssetIds.add(src.backgroundAssetId);
    }

    // 5. Deep copy each asset: GCS copy + new Firestore doc
    const idMap = new Map<string, string>();
    const createdAssetIds: string[] = [];
    const createdStoragePaths: string[] = [];

    for (const oldAssetId of allAssetIds) {
      const srcAsset = await this.assetsService.findOneByIdForApp(sourceApplicationId, oldAssetId);
      if (!srcAsset) continue;

      const newAssetId = uuidv4();
      const ext = this.extractExtension(srcAsset.storagePath);
      const newStoragePath = this.cloud.buildPath({
        uid,
        applicationId: targetApplicationId,
        namespace: UploadNamespaces.applicationAssets,
        id: newAssetId,
        ext,
      });

      // Server-side GCS copy
      await this.cloud.copyFile(srcAsset.storagePath, newStoragePath);
      createdStoragePaths.push(newStoragePath);

      // Create new asset doc
      const newAsset: Asset = {
        id: newAssetId,
        ownerId: uid,
        applicationId: targetApplicationId,
        storagePath: newStoragePath,
        mimeType: srcAsset.mimeType,
        size: srcAsset.size,
        checksum: srcAsset.checksum ?? null,
        createdAt: now,
        updatedAt: now,
        refCount: 0,
        usedBy: [],
      };
      await db.collection(Collections.applicationAssets).doc(newAssetId).set(newAsset);
      createdAssetIds.push(newAssetId);

      idMap.set(oldAssetId, newAssetId);
    }

    // 6. Build Firestore batch for all theme config docs
    try {
      const batch = db.batch();

      // Theme entity — strip undefined values to avoid Firestore rejection
      const target: Theme = {
        ...source,
        id: newThemeId,
        applicationId: targetApplicationId,
        title: overrides?.title ?? `${source.title ?? 'Theme'} (Copy)`,
        description: overrides?.description ?? source.description ?? '',
        label: overrides?.label ?? source.label ?? 'dev',
        version: 1,
        createdAt: now,
        updatedAt: now,
      } as Theme;
      const themeData = JSON.parse(JSON.stringify(target));
      batch.set(db.collection(Collections.themes).doc(newThemeId), themeData);

      // Widget configs — remap asset IDs in config
      for (const doc of widgetSnaps.docs) {
        const data = doc.data() as any;
        const variant = data?.variant ?? 'light';
        const newId = `${newThemeId}_${variant}`;
        const remappedConfig = idMap.size > 0 ? remapAssetIdsDeep(data?.config, idMap) : data?.config;
        batch.set(db.collection(Collections.themeConfigWidgets).doc(newId), {
          ...data,
          config: remappedConfig,
          themeId: newThemeId,
          applicationId: targetApplicationId,
          id: newId,
          version: 1,
          updatedAt: now,
        });
      }

      // Color schemes — no asset references
      for (const doc of colorSnaps.docs) {
        const data = doc.data() as any;
        const variant = data?.variant ?? doc.id.split('_')[1] ?? 'light';
        const newId = `${newThemeId}_${variant}`;
        batch.set(db.collection(Collections.themeConfigColorSchemes).doc(newId), {
          ...data,
          themeId: newThemeId,
          applicationId: targetApplicationId,
          id: newId,
          version: 1,
          updatedAt: now,
        });
      }

      // Page configs — remap asset IDs in config (ID must be ${themeId}_${variant})
      for (const doc of pageSnaps.docs) {
        const data = doc.data() as any;
        const variant = data?.variant ?? 'light';
        const newId = `${newThemeId}_${variant}`;
        const remappedConfig = idMap.size > 0 ? remapAssetIdsDeep(data?.config, idMap) : data?.config;
        batch.set(db.collection(Collections.themeConfigPages).doc(newId), {
          ...data,
          config: remappedConfig,
          themeId: newThemeId,
          applicationId: targetApplicationId,
          id: newId,
          version: 1,
          updatedAt: now,
        });
      }

      // Splash — remap source asset IDs, reset outputsArtifacts
      if (splashSnap.exists) {
        const data = splashSnap.data() as any;
        const src = { ...(data?.source ?? {}) };
        if (src.foregroundAssetId && idMap.has(src.foregroundAssetId)) {
          src.foregroundAssetId = idMap.get(src.foregroundAssetId);
        }
        if (src.backgroundAssetId && idMap.has(src.backgroundAssetId)) {
          src.backgroundAssetId = idMap.get(src.backgroundAssetId);
        }
        batch.set(db.collection(Collections.themeAssetsSplash).doc(newThemeId), {
          ...data,
          source: src,
          id: newThemeId,
          themeId: newThemeId,
          applicationId: targetApplicationId,
          outputsArtifacts: {},
          createdAt: now,
          updatedAt: now,
        });
      }

      // Launch — remap source asset IDs, reset outputsArtifacts
      if (launchSnap.exists) {
        const data = launchSnap.data() as any;
        const src = { ...(data?.source ?? {}) };
        if (src.foregroundAssetId && idMap.has(src.foregroundAssetId)) {
          src.foregroundAssetId = idMap.get(src.foregroundAssetId);
        }
        if (src.backgroundAssetId && idMap.has(src.backgroundAssetId)) {
          src.backgroundAssetId = idMap.get(src.backgroundAssetId);
        }
        batch.set(db.collection(Collections.themeAssetsLauncher).doc(newThemeId), {
          ...data,
          source: src,
          id: newThemeId,
          themeId: newThemeId,
          applicationId: targetApplicationId,
          outputsArtifacts: {},
          createdAt: now,
          updatedAt: now,
        });
      }

      // Feature entitlements
      for (const doc of feSnaps.docs) {
        const data = doc.data() as any;
        batch.set(db.collection(Collections.themeFeatureEntitlements).doc(newThemeId), {
          ...data,
          id: newThemeId,
          applicationId: targetApplicationId,
          themeId: newThemeId,
          version: 1,
          createdAt: now,
          updatedAt: now,
        });
      }

      // 7. Commit atomically
      await batch.commit();

      return this.aggregateTheme(target, uid);
    } catch (err) {
      // Rollback: best-effort cleanup of created assets
      this.logger.warn({
        msg: 'copyThemeToApplication: batch failed, rolling back assets',
        error: err instanceof Error ? err.message : err,
        assetCount: createdAssetIds.length,
      });

      await Promise.allSettled([
        ...createdAssetIds.map((id) =>
          db.collection(Collections.applicationAssets).doc(id).delete(),
        ),
        ...createdStoragePaths.map((p) => this.cloud.delete(p)),
      ]);

      throw err;
    }
  }

  private extractExtension(storagePath: string): string {
    const lastSegment = storagePath.split('/').pop() ?? '';
    const dotIndex = lastSegment.lastIndexOf('.');
    return dotIndex >= 0 ? lastSegment.slice(dotIndex) : '';
  }

  private async purgeOrphanAssets(uid: string, applicationId: string) {
    const assets = await this.assetsService.findAll(uid, applicationId, {
      includeUrl: false,
    });
    const orphans = assets.filter((a: any) => (a.refCount ?? 0) === 0);
    await Promise.all(
      orphans.map((a) =>
        this.assetsService.remove(uid, a.id).catch(() => undefined),
      ),
    );
  }

  // -------------------- Batch-collect helpers --------------------

  private async collectWidgetConfigWrites(
    srcThemeId: string,
    dstThemeId: string,
    batch: FirebaseFirestore.WriteBatch,
  ) {
    const col = admin.firestore().collection(Collections.themeConfigWidgets);
    const qByField = await col.where('themeId', '==', srcThemeId).get();
    const now = nowIso();

    if (!qByField.empty) {
      qByField.docs.forEach((doc) => {
        const data = doc.data();
        const variant = (data as any)?.variant ?? 'light';
        const newId = `${dstThemeId}_${variant}`;
        batch.set(col.doc(newId), {
          ...data,
          themeId: dstThemeId,
          id: newId,
          version: 1,
          updatedAt: now,
        });
      });
    } else {
      const legacyId = `${srcThemeId}_light`;
      const legacySnap = await col.doc(legacyId).get();
      if (legacySnap.exists) {
        const data = legacySnap.data() as any;
        const newId = `${dstThemeId}_light`;
        batch.set(col.doc(newId), {
          ...data,
          themeId: dstThemeId,
          id: newId,
          version: 1,
          updatedAt: now,
        });
      }
    }
  }

  private async collectColorSchemeWrites(
    srcThemeId: string,
    dstThemeId: string,
    batch: FirebaseFirestore.WriteBatch,
  ) {
    const col = admin.firestore().collection(Collections.themeConfigColorSchemes);
    const q = await col.where('themeId', '==', srcThemeId).get();
    const now = nowIso();

    if (!q.empty) {
      q.docs.forEach((d) => {
        const data = d.data() as any;
        const variant = data?.variant ?? d.id.split('_')[1] ?? 'light';
        const newId = `${dstThemeId}_${variant}`;
        batch.set(col.doc(newId), {
          ...data,
          themeId: dstThemeId,
          id: newId,
          version: 1,
          updatedAt: now,
        });
      });
    } else {
      const legacyRef = col.doc(srcThemeId);
      const legacySnap = await legacyRef.get();
      if (legacySnap.exists) {
        const data = legacySnap.data();
        batch.set(col.doc(dstThemeId), {
          ...data,
          themeId: dstThemeId,
          id: dstThemeId,
          version: 1,
          updatedAt: now,
        });
      }
    }
  }

  private async collectPageConfigWrites(
    srcThemeId: string,
    dstThemeId: string,
    batch: FirebaseFirestore.WriteBatch,
  ) {
    const col = admin.firestore().collection(Collections.themeConfigPages);
    const q = await col.where('themeId', '==', srcThemeId).get();
    if (q.empty) return;

    const now = nowIso();
    q.docs.forEach((d) => {
      const data = d.data() as any;
      const variant = data?.variant ?? d.id.split('_')[1] ?? 'light';
      const newId = `${dstThemeId}_${variant}`;
      batch.set(col.doc(newId), {
        ...data,
        themeId: dstThemeId,
        id: newId,
        version: 1,
        updatedAt: now,
      });
    });
  }

  private async collectSplashWrites(
    srcThemeId: string,
    dstThemeId: string,
    batch: FirebaseFirestore.WriteBatch,
  ) {
    const col = admin.firestore().collection(Collections.themeAssetsSplash);
    const snap = await col.doc(srcThemeId).get();
    if (!snap.exists) return;

    const data = snap.data() as any;
    const now = nowIso();
    batch.set(col.doc(dstThemeId), {
      ...data,
      id: dstThemeId,
      themeId: dstThemeId,
      outputsArtifacts: {},
      updatedAt: now,
      createdAt: now,
    });
  }

  private async collectLaunchWrites(
    srcThemeId: string,
    dstThemeId: string,
    batch: FirebaseFirestore.WriteBatch,
  ) {
    const col = admin.firestore().collection(Collections.themeAssetsLauncher);
    const snap = await col.doc(srcThemeId).get();
    if (!snap.exists) return;

    const data = snap.data() as any;
    const now = nowIso();
    batch.set(col.doc(dstThemeId), {
      ...data,
      id: dstThemeId,
      themeId: dstThemeId,
      outputsArtifacts: {},
      updatedAt: now,
      createdAt: now,
    });
  }

  private async collectFeatureAccessWrites(
    srcThemeId: string,
    dstThemeId: string,
    applicationId: string,
    batch: FirebaseFirestore.WriteBatch,
  ) {
    const col = admin.firestore().collection(Collections.themeFeatureEntitlements);
    const q = await col.where('themeId', '==', srcThemeId).get();
    if (q.empty) return;

    const now = nowIso();
    q.docs.forEach((d) => {
      const data = d.data() as any;
      batch.set(col.doc(dstThemeId), {
        ...data,
        id: dstThemeId,
        applicationId,
        themeId: dstThemeId,
        version: 1,
        createdAt: now,
        updatedAt: now,
      });
    });
  }

  // -------------------- Modern aggregate --------------------

  private async aggregateTheme(
    theme: Theme,
    uid: string,
  ): Promise<AggregatedTheme> {
    const [
      assetsLegacy,
      splash,
      launch,
      widgetCfgRaw,
      colorScheme,
      pageCfgRaw,
    ] = await Promise.all([
      this.loadAssetsLegacy(uid, theme.applicationId),
      this.loadSplash(theme.applicationId, theme.id, uid),
      this.loadLaunch(theme.applicationId, theme.id, uid),
      this.loadThemeWidgetConfig(theme.applicationId, theme.id),
      this.loadColorSchemeConfig(theme.applicationId, theme.id),
      this.loadThemePageConfig(theme.applicationId, theme.id),
    ]);

    const resolveUrl = async (id: string) => {
      try {
        return await this.assetsService.getSignedUrlByIdForApp(
          theme.applicationId,
          id,
          ASSET_URL_TTL_SEC,
        );
      } catch (e) {
        this.logger.error(e);
        return null;
      }
    };
    const themeWidgetConfig = widgetCfgRaw
      ? await resolveImageSourceUrlsDeep(widgetCfgRaw, resolveUrl)
      : (theme as any).themeWidgetConfig ?? undefined;

    const themePageConfig = pageCfgRaw
      ? await resolveImageSourceUrlsDeep(pageCfgRaw, resolveUrl)
      : (theme as any).themePageConfig ?? undefined;

    return {
      ...theme,
      assets: assetsLegacy,
      splashAssets: splash,
      launchAssets: launch,
      themeWidgetConfig,
      colorSchemeConfig:
        colorScheme ?? (theme as any).colorSchemeConfig ?? undefined,
      appConfig: (theme as any).appConfig ?? undefined,
      themePageConfig,
    } as AggregatedTheme;
  }

  // -------------------- Loaders --------------------

  private async loadAssetsLegacy(
    uid: string,
    applicationId: string,
  ): Promise<LegacyAssetItem[]> {
    const list = await this.assetsService.findAll(uid, applicationId, {
      includeUrl: true,
      urlTtlSec: ASSET_URL_TTL_SEC,
    });

    return list.map((a) => ({
      id: a.id,
      name: (a as any).name ?? a.id,
      description: (a as any).description ?? '-',
      url: a.downloadUrl ?? '',
      type: (a as any).type ?? null,
    }));
  }

  private async loadSplash(
    _applicationId: string,
    themeId: string,
    uid: string,
  ): Promise<LegacySplash> {
    const ref = admin
      .firestore()
      .collection(Collections.themeAssetsSplash)
      .doc(themeId);
    const snap = await ref.get();

    const fallback: LegacySplash = {
      originalAssetId: null,
      pictureUrl: null,
      color: null,
      padding: 0,
      fit: 'scaleDown',
    };
    if (!snap.exists) return fallback;

    const e = snap.data() as any;
    const src = e?.source ?? {};
    const params = e?.params ?? {};
    const outs = e?.outputsArtifacts ?? {};

    let pictureUrl: string | null = null;
    if (outs?.splashArtifactId) {
      try {
        const a = await this.artifacts.findOne(uid, outs.splashArtifactId, {});
        pictureUrl = await this.cloud.getSignedUrl(a.storagePath!, {
          ttlSec: ASSET_URL_TTL_SEC,
        });
      } catch {
        pictureUrl = null;
      }
    }

    return {
      originalAssetId: src?.foregroundAssetId ?? null,
      pictureUrl,
      color: src?.backgroundColorHex ?? null,
      padding: Number(params?.paddingDp ?? params?.padding ?? 0) || 0,
      fit: (params?.fit as LegacySplash['fit']) ?? 'scaleDown',
    };
  }

  private async loadLaunch(
    _applicationId: string,
    themeId: string,
    uid: string,
  ): Promise<LegacyLaunch> {
    const ref = admin
      .firestore()
      .collection(Collections.themeAssetsLauncher)
      .doc(themeId);
    const snap = await ref.get();

    const fallback: LegacyLaunch = {
      originalAssetId: null,
      notificationLogoUrl: null,
      adaptiveIconForegroundUrl: null,
      androidLauncherIconUrl: null,
      iosLauncherIconUrl: null,
      webLauncherIconUrl: null,
      adaptiveIconBackgroundUrl: null,
      backgroundColor: null,
    };
    if (!snap.exists) return fallback;

    const e = snap.data() as any;
    const src = e?.source ?? {};
    const outs = e?.outputsArtifacts ?? {};

    const sign = async (id?: string | null) => {
      if (!id) return null;
      try {
        const a = await this.artifacts.findOne(uid, id, {});
        return await this.cloud.getSignedUrl(a.storagePath!, {
          ttlSec: ASSET_URL_TTL_SEC,
        });
      } catch {
        return null;
      }
    };

    const [
      androidLegacyUrl,
      adaptiveForegroundUrl,
      adaptiveBackgroundUrl,
      iosUrl,
      webUrl,
    ] = await Promise.all([
      sign(outs?.androidLegacyArtifactId),
      sign(outs?.androidAdaptiveForegroundArtifactId),
      sign(outs?.androidAdaptiveBackgroundArtifactId),
      sign(outs?.iosArtifactId),
      sign(outs?.webArtifactId),
    ]);

    return {
      originalAssetId: src?.foregroundAssetId ?? null,
      notificationLogoUrl: null,
      adaptiveIconForegroundUrl: adaptiveForegroundUrl,
      androidLauncherIconUrl: androidLegacyUrl,
      iosLauncherIconUrl: iosUrl,
      webLauncherIconUrl: webUrl,
      adaptiveIconBackgroundUrl: adaptiveBackgroundUrl,
      backgroundColor: src?.backgroundColorHex ?? null,
    };
  }

  private async loadThemeWidgetConfig(
    _applicationId: string,
    themeId: string,
  ): Promise<any | null> {
    const id = `${themeId}_light`;
    const snap = await admin
      .firestore()
      .collection(Collections.themeConfigWidgets)
      .doc(id)
      .get();
    if (!snap.exists) return null;
    const data = snap.data() as any;
    return data?.config ?? null;
  }

  private async loadColorSchemeConfig(
    _applicationId: string,
    themeId: string,
  ): Promise<any | null> {
    const snap = await admin
      .firestore()
      .collection(Collections.themeConfigColorSchemes)
      .doc(themeId)
      .get();
    if (!snap.exists) return null;
    return snap.data();
  }

  private async loadThemePageConfig(
    _applicationId: string,
    themeId: string,
  ): Promise<Record<string, any> | null> {
    const q = await admin
      .firestore()
      .collection(Collections.themeConfigPages)
      .where('themeId', '==', themeId)
      .get();
    if (q.empty) return null;

    const result: Record<string, any> = {};
    q.docs.forEach((doc) => {
      const data = doc.data() as any;
      const variant = (data?.variant ?? 'light') as 'light' | 'dark';
      result[variant] = data?.config ?? {};
    });
    return result;
  }
}

// -------------------- Helpers --------------------

type ColorSchemeRaw = {
  seedColor?: string;
  colorSchemeOverride?: Record<string, string>;
} | null;

function toArgb(hex?: string | null): string | null {
  if (!hex || typeof hex !== 'string') return null;
  const h = hex.trim().toLowerCase();
  if (!h.startsWith('#')) return null;
  const body = h.slice(1);
  if (body.length === 6) return `#ff${body}`;
  if (body.length === 8) return `#${body}`;
  return null;
}

function buildLegacyColors(colorScheme: ColorSchemeRaw) {
  const c = colorScheme?.colorSchemeOverride ?? {};

  const primary = toArgb(c.primary) ?? '#ff5cace3';
  const secondary = toArgb(c.secondary) ?? '#ff123752';

  const colors: any = {
    primary,
    onPrimary: toArgb(c.onPrimary) ?? '#ffffffff',
    primaryContainer: toArgb(c.primaryContainer) ?? '#ffb9e3f9',
    onPrimaryContainer: toArgb(c.onPrimaryContainer) ?? '#ff123752',
    primaryFixed: toArgb(c.primaryFixed),
    primaryFixedDim: toArgb(c.primaryFixedDim),
    onPrimaryFixed: toArgb(c.onPrimaryFixed),
    onPrimaryFixedVariant: toArgb(c.onPrimaryFixedVariant),
    secondary,
    onSecondary: toArgb(c.onSecondary) ?? '#ffffffff',
    secondaryContainer: toArgb(c.secondaryContainer) ?? '#ffeef3f6',
    onSecondaryContainer: toArgb(c.onSecondaryContainer) ?? '#ff1f618f',
    secondaryFixed: toArgb(c.secondaryFixed),
    secondaryFixedDim: toArgb(c.secondaryFixedDim),
    onSecondaryFixed: toArgb(c.onSecondaryFixed),
    onSecondaryFixedVariant: toArgb(c.onSecondaryFixedVariant),
    tertiary: toArgb(c.tertiary) ?? '#ff75b943',
    onTertiary: toArgb(c.onTertiary) ?? '#ffffffff',
    tertiaryContainer: toArgb(c.tertiaryContainer) ?? '#ffe1f7c1',
    onTertiaryContainer: toArgb(c.onTertiaryContainer) ?? '#ff2e5200',
    tertiaryFixed: toArgb(c.tertiaryFixed),
    tertiaryFixedDim: toArgb(c.tertiaryFixedDim),
    onTertiaryFixed: toArgb(c.onTertiaryFixed),
    onTertiaryFixedVariant: toArgb(c.onTertiaryFixedVariant),
    error: toArgb(c.error) ?? '#ffe74c3c',
    onError: toArgb(c.onError) ?? '#ffffffff',
    errorContainer: toArgb(c.errorContainer) ?? '#fff5b7b1',
    onErrorContainer: toArgb(c.onErrorContainer) ?? '#ff8b1e13',
    outline: toArgb(c.outline) ?? '#ff4c4d4a',
    outlineVariant: toArgb(c.outlineVariant) ?? '#ffcdcfc9',
    surface: toArgb(c.surface) ?? '#ffeef3f6',
    onSurface: toArgb(c.onSurface) ?? '#ff30302f',
    surfaceDim: toArgb(c.surfaceDim) ?? '#ffdde0e3',
    surfaceBright: toArgb(c.surfaceBright) ?? '#ffffffff',
    surfaceContainerLowest: toArgb(c.surfaceContainerLowest) ?? '#fff8fbfd',
    surfaceContainerLow: toArgb(c.surfaceContainerLow) ?? '#fff0f3f5',
    surfaceContainer: toArgb(c.surfaceContainer) ?? '#ffeef3f6',
    surfaceContainerHigh: toArgb(c.surfaceContainerHigh) ?? '#ffe2e6e9',
    surfaceContainerHighest: toArgb(c.surfaceContainerHighest) ?? '#ffdde0e3',
    onSurfaceVariant: toArgb(c.onSurfaceVariant) ?? '#ff848581',
    inverseSurface: toArgb(c.inverseSurface) ?? '#ff30302f',
    onInverseSurface: toArgb(c.onInverseSurface) ?? null,
    inversePrimary: toArgb(c.inversePrimary) ?? '#ff1f618f',
    shadow: toArgb(c.shadow) ?? '#ff000000',
    scrim: toArgb(c.scrim) ?? '#ff000000',
    surfaceTint: toArgb(c.surfaceTint) ?? '#fff95a14',
    gradientTabColor: [primary, secondary],
    launch: {
      adaptiveIconBackground: '#ffffffff',
      splashBackground: '#ffffffff',
    },
  };
  return colors;
}

function pickImageUrlFromImageAssetConfig(node?: any): string | null {
  if (!node) return null;
  const metaAttrs = node?.metadata?.attributes ?? {};
  const metaUrl: string | null =
    metaAttrs.primaryOnboardingLogoUrl ??
    metaAttrs.secondaryOnboardingLogoUrl ??
    null;
  if (typeof metaUrl === 'string' && metaUrl.length) return metaUrl;
  const src = node?.imageSource ?? {};
  const uri: string | null = typeof src.uri === 'string' ? src.uri : null;
  const url: string | null = typeof src.url === 'string' ? src.url : null;
  if (uri?.startsWith('http')) return uri;
  if (url?.startsWith('http')) return url;
  return null;
}

function buildLegacyImages(widgetCfgRaw: any, launchLegacy: any) {
  const imageAssets = widgetCfgRaw?.imageAssets ?? {};
  const primaryLogoUrl = pickImageUrlFromImageAssetConfig(
    imageAssets.primaryOnboardingLogo,
  );
  const secondaryLogoUrl = pickImageUrlFromImageAssetConfig(
    imageAssets.secondaryOnboardingLogo,
  );
  return {
    adaptiveIconBackground: launchLegacy.adaptiveIconBackgroundUrl ?? null,
    iosLauncherIcon: launchLegacy.iosLauncherIconUrl ?? null,
    primaryOnboardingLogo: primaryLogoUrl,
    androidLauncherIcon: launchLegacy.androidLauncherIconUrl ?? null,
    notificationLogo: launchLegacy.notificationLogoUrl ?? null,
    adaptiveIconForeground: launchLegacy.adaptiveIconForegroundUrl ?? null,
    webLauncherIcon: launchLegacy.webLauncherIconUrl ?? null,
    secondaryOnboardingLogo: secondaryLogoUrl,
  };
}

function buildLegacyPageConfig(pageCfgRaw: any) {
  const light = pageCfgRaw?.light ?? pageCfgRaw ?? {};
  const login = light.login ?? {};
  const about = light.about ?? {};
  return {
    login: {
      picture: login.picture ?? null,
      scale: login.scale ?? null,
      labelColor: login.labelColor ?? null,
      modeSelect: {
        buttonLoginStyleType:
          login.modeSelect?.buttonLoginStyleType ?? 'primary',
        buttonSignupStyleType:
          login.modeSelect?.buttonSignupStyleType ?? 'primary',
      },
      metadata: {
        attributes: login.metadata?.attributes ?? {},
      },
    },
    about: {
      picture: about.picture ?? null,
      metadata: {
        attributes: about.metadata?.attributes ?? {},
      },
    },
  };
}

function buildLegacyWidgetConfig(widgetCfgRaw: any) {
  if (!widgetCfgRaw) {
    return {
      fonts: {fontFamily: 'Montserrat'},
      dialog: {
        confirmDialog: {
          activeButtonColor1: null,
          activeButtonColor2: null,
          defaultButtonColor: null,
        },
        snackBar: {
          successBackgroundColor: '#75B943',
          errorBackgroundColor: '#E74C3C',
          infoBackgroundColor: '#494949',
          warningBackgroundColor: '#F95A14',
        },
      },
      imageAssets: {
        primaryOnboardingLogo: {
          uri: 'asset://assets/primary_onboardin_logo.svg',
          widthFactor: 0.42,
          labelColor: '#FFFFFF',
          metadata: {attributes: {}},
        },
        secondaryOnboardingLogo: {
          uri: 'asset://assets/secondary_onboardin_logo.svg',
          widthFactor: 0.25,
          labelColor: '#FFFFFF',
          metadata: {attributes: {}},
        },
        appIcon: {color: null},
      },
    };
  }

  const imgAssets = widgetCfgRaw.imageAssets ?? {};
  const primaryUrl = pickImageUrlFromImageAssetConfig(
    imgAssets.primaryOnboardingLogo,
  );
  const secondaryUrl = pickImageUrlFromImageAssetConfig(
    imgAssets.secondaryOnboardingLogo,
  );

  const out = {
    ...widgetCfgRaw,
    imageAssets: {
      ...imgAssets,
      primaryOnboardingLogo: {
        uri: 'asset://assets/primary_onboardin_logo.svg',
        widthFactor: imgAssets.primaryOnboardingLogo?.widthFactor ?? 0.42,
        labelColor: imgAssets.primaryOnboardingLogo?.labelColor ?? '#FFFFFF',
        metadata: {
          attributes: {
            ...(imgAssets.primaryOnboardingLogo?.metadata?.attributes ?? {}),
            ...(primaryUrl ? {primaryOnboardingLogoUrl: primaryUrl} : {}),
          },
        },
      },
      secondaryOnboardingLogo: {
        uri: 'asset://assets/secondary_onboardin_logo.svg',
        widthFactor: imgAssets.secondaryOnboardingLogo?.widthFactor ?? 0.25,
        labelColor: imgAssets.secondaryOnboardingLogo?.labelColor ?? '#FFFFFF',
        metadata: {
          attributes: {
            ...(imgAssets.secondaryOnboardingLogo?.metadata?.attributes ?? {}),
            ...(secondaryUrl
              ? {secondaryOnboardingLogoUrl: secondaryUrl}
              : {}),
          },
        },
      },
      appIcon: imgAssets.appIcon ?? {color: null},
    },
  };

  if (!out.fonts) out.fonts = {fontFamily: 'Montserrat'};
  return out;
}
