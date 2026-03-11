import * as admin from 'firebase-admin';
import { Injectable, Logger, NotFoundException } from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';
import { v4 as uuidv4 } from 'uuid';

import { ThemeShareToken } from './entities/theme-share-token.entity';
import { ThemeHistoryService } from '../themes/features/theme-history/theme-history.service';
import { AssetsService } from '../assets/assets.service';
import { Collections, nowIso, resolveImageSourceUrlsDeep } from '../../common';

const SHARE_PREVIEW_ASSET_URL_TTL_SEC = 60 * 60 * 24 * 7; // 7 days

@Injectable()
export class ThemeSharesService {
  private readonly logger = new Logger(ThemeSharesService.name);

  constructor(
    @InjectRepository(ThemeShareToken)
    private readonly repo: BaseFirestoreRepository<ThemeShareToken>,
    private readonly themeHistoryService: ThemeHistoryService,
    private readonly assetsService: AssetsService,
  ) {}

  async createShareToken(
    applicationId: string,
    themeId: string,
    uid: string,
    tag?: string,
  ): Promise<{ token: string }> {
    // 1. Validate theme exists and matches application
    const db = admin.firestore();
    const themeDoc = await db.collection(Collections.themes).doc(themeId).get();
    if (!themeDoc.exists || themeDoc.data()?.applicationId !== applicationId) {
      throw new NotFoundException('Theme not found');
    }

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

    return { ...snapshot, pageConfigs: resolvedPageConfigs, widgetConfigs: resolvedWidgetConfigs };
  }
}
