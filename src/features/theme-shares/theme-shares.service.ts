import * as admin from 'firebase-admin';
import { Injectable, Logger, NotFoundException } from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';
import { v4 as uuidv4 } from 'uuid';

import { ThemeShareToken } from './entities/theme-share-token.entity';
import { Application } from '../applications/entities/application';
import { ThemeHistoryService } from '../themes/features/theme-history/theme-history.service';
import { AssetsService } from '../assets/assets.service';
import { Collections, nowIso, resolveImageSourceUrlsDeep } from '../../common';
import { OwnershipService } from '../../common/data/ownership.service';

const SHARE_PREVIEW_ASSET_URL_TTL_SEC = 60 * 60 * 24 * 7; // 7 days

// Environment keys whose values are secrets and must never be exposed in a
// public share preview (the share endpoint is unauthenticated). Matched
// case-insensitively against the key name.
const SECRET_ENV_KEY_PATTERN = /TOKEN|SECRET|VAPID|KEYSTORE|PASSWORD|PRIVATE/i;

@Injectable()
export class ThemeSharesService {
  private readonly logger = new Logger(ThemeSharesService.name);

  constructor(
    @InjectRepository(ThemeShareToken)
    private readonly repo: BaseFirestoreRepository<ThemeShareToken>,
    @InjectRepository(Application)
    private readonly applicationRepo: BaseFirestoreRepository<Application>,
    private readonly themeHistoryService: ThemeHistoryService,
    private readonly assetsService: AssetsService,
    private readonly ownership: OwnershipService,
  ) {}

  async createShareToken(
    applicationId: string,
    themeId: string,
    uid: string,
    tag?: string,
  ): Promise<{ token: string }> {
    // 1. Validate the caller owns the application and the theme belongs to it
    await this.ownership.assertOwnsTheme(uid, applicationId, themeId);

    const db = admin.firestore();

    // 2. Generate token ID upfront (needed for shareTokenId on snapshot)
    const tokenId = uuidv4();

    // 3. Create ThemeHistory snapshot
    const snapshot = await this.themeHistoryService.createSnapshot({
      themeId,
      applicationId,
      changedBy: uid,
      tag,
      description: 'Created for share link',
    });

    // 4. Set shareTokenId on the snapshot
    await db
      .collection(Collections.themeHistory)
      .doc(snapshot.id)
      .update({ shareTokenId: tokenId });

    // 5. Create ThemeShareToken with snapshotId
    const token: ThemeShareToken = {
      id: tokenId,
      applicationId,
      themeId,
      snapshotId: snapshot.id,
      ownerId: uid,
      active: true,
      createdAt: nowIso(),
    };

    await this.repo.create(token);
    return { token: tokenId };
  }

  async getSharedThemePreview(token: string) {
    const doc = await this.repo.findById(token).catch(() => null);
    if (!doc || !doc.active) {
      throw new NotFoundException('Share token not found or inactive');
    }

    const historyEntry = await this.themeHistoryService.getById(
      doc.applicationId,
      doc.themeId,
      doc.snapshotId,
    );

    const snapshot = historyEntry.snapshot;

    const resolveUrl = async (id: string) => {
      try {
        return await this.assetsService.getSignedUrlByIdForApp(
          doc.applicationId,
          id,
          SHARE_PREVIEW_ASSET_URL_TTL_SEC,
        );
      } catch (e) {
        this.logger.warn(`Failed to resolve asset URL for id=${id}: ${e}`);
        return null;
      }
    };

    const [resolvedPageConfigs, resolvedWidgetConfigs] = await Promise.all([
      resolveImageSourceUrlsDeep(snapshot.pageConfigs, resolveUrl),
      resolveImageSourceUrlsDeep(snapshot.widgetConfigs, resolveUrl),
    ]);

    const application = await this.applicationRepo
      .findById(doc.applicationId)
      .catch(() => null);
    const environment = this.encodeSharedEnvironment(application);

    return {
      ...snapshot,
      pageConfigs: resolvedPageConfigs,
      widgetConfigs: resolvedWidgetConfigs,
      environment,
    };
  }

  // Encodes the application environment for the realtime share preview: drops
  // secret keys, then base64-encodes the remaining values. base64 is only
  // obfuscation (the share endpoint is public), so secrets are removed first.
  private encodeSharedEnvironment(
    application: Application | null,
  ): string | null {
    if (!application) {
      return null;
    }
    const environment: Record<string, string | boolean | number> = {
      ...(application.environment ?? {}),
    };
    // Web has no platform bundle id, so default the web bundle id from the
    // application's platform identifier (mirrors the editor preview). Without it
    // the backend rejects login with unconfigured_bundle_id.
    const webBundleIdKey = 'WEBTRIT_APP_WEB_BUNDLE_ID';
    if (!environment[webBundleIdKey]) {
      const platformId =
        application.androidPlatformId ?? application.iosPlatformId;
      if (platformId) {
        environment[webBundleIdKey] = platformId;
      }
    }
    const safe = Object.fromEntries(
      Object.entries(environment).filter(
        ([key]) => !SECRET_ENV_KEY_PATTERN.test(key),
      ),
    );
    if (Object.keys(safe).length === 0) {
      return null;
    }
    return Buffer.from(JSON.stringify(safe), 'utf8').toString('base64');
  }
}
