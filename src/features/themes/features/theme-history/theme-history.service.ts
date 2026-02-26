import * as admin from 'firebase-admin';
import { Injectable, Logger, NotFoundException } from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';
import { v4 as uuidv4 } from 'uuid';

import { ThemeHistory, ThemeSnapshot, THEME_SCHEMA_VERSION } from './entities/theme-history.entity';
import { Collections, nowIso } from '../../../../common';

type CreateSnapshotParams = {
  themeId: string;
  applicationId: string;
  changedBy: string;
  tag?: string;
  description?: string;
};

@Injectable()
export class ThemeHistoryService {
  private readonly logger = new Logger(ThemeHistoryService.name);

  constructor(
    @InjectRepository(ThemeHistory)
    private readonly repo: BaseFirestoreRepository<ThemeHistory>,
  ) {}

  /** Create a snapshot of the current theme aggregate state. */
  async createSnapshot(params: CreateSnapshotParams): Promise<ThemeHistory> {
    const { themeId, applicationId, changedBy } = params;

    const snapshot = await this.captureSnapshot(themeId);
    const nextVersion = await this.getNextVersion(themeId);

    const entry: ThemeHistory = {
      id: uuidv4(),
      themeId,
      applicationId,
      snapshotVersion: nextVersion,
      action: 'snapshot',
      changedBy,
      snapshot,
      schemaVersion: THEME_SCHEMA_VERSION,
      tag: params.tag ?? '',
      description: params.description ?? '',
      createdAt: nowIso(),
    };

    return this.repo.create(entry);
  }

  async listByTheme(
    applicationId: string,
    themeId: string,
    opts: { limit: number; startAfter?: string },
  ): Promise<{ items: Omit<ThemeHistory, 'snapshot'>[]; nextCursor: string | null }> {
    const db = admin.firestore();
    let query: FirebaseFirestore.Query = db
      .collection(Collections.themeHistory)
      .where('themeId', '==', themeId)
      .where('applicationId', '==', applicationId)
      .orderBy('snapshotVersion', 'desc')
      .limit(opts.limit + 1);

    if (opts.startAfter) {
      const cursorDoc = await db
        .collection(Collections.themeHistory)
        .doc(opts.startAfter)
        .get();
      if (cursorDoc.exists) {
        query = query.startAfter(cursorDoc);
      }
    }

    // Exclude snapshot from list — fetch only metadata fields
    query = query.select(
      'themeId', 'applicationId', 'snapshotVersion', 'action',
      'changedBy', 'schemaVersion', 'tag', 'description', 'shareTokenId', 'createdAt',
    );

    const snap = await query.get();
    const docs = snap.docs.map((d) => ({ id: d.id, ...d.data() }) as Omit<ThemeHistory, 'snapshot'>);

    const hasMore = docs.length > opts.limit;
    const items = hasMore ? docs.slice(0, opts.limit) : docs;
    const nextCursor = hasMore ? items[items.length - 1].id : null;

    return { items, nextCursor };
  }

  async getById(
    applicationId: string,
    themeId: string,
    historyId: string,
  ): Promise<ThemeHistory> {
    const found = await this.repo.findById(historyId).catch(() => null);
    if (
      !found ||
      found.applicationId !== applicationId ||
      found.themeId !== themeId
    ) {
      throw new NotFoundException('Theme history entry not found');
    }
    return found;
  }

  async patchEntry(
    applicationId: string,
    themeId: string,
    historyId: string,
    data: { tag?: string; description?: string },
  ): Promise<ThemeHistory> {
    const entry = await this.getById(applicationId, themeId, historyId);

    const db = admin.firestore();
    const updates: Record<string, string> = {};
    if (data.tag !== undefined) updates.tag = data.tag;
    if (data.description !== undefined) updates.description = data.description;

    if (Object.keys(updates).length > 0) {
      await db.collection(Collections.themeHistory).doc(historyId).update(updates);
    }

    return { ...entry, ...updates };
  }

  // -------------------- Private --------------------

  private async captureSnapshot(themeId: string): Promise<ThemeSnapshot> {
    const db = admin.firestore();

    const [
      themeSnap,
      colorSchemesSnap,
      widgetConfigsSnap,
      pageConfigsSnap,
      splashSnap,
      launchSnap,
      featureAccessSnap,
    ] = await Promise.all([
      db.collection(Collections.themes).doc(themeId).get(),
      db
        .collection(Collections.themeConfigColorSchemes)
        .where('themeId', '==', themeId)
        .get(),
      db
        .collection(Collections.themeConfigWidgets)
        .where('themeId', '==', themeId)
        .get(),
      db
        .collection(Collections.themeConfigPages)
        .where('themeId', '==', themeId)
        .get(),
      db.collection(Collections.themeAssetsSplash).doc(themeId).get(),
      db.collection(Collections.themeAssetsLauncher).doc(themeId).get(),
      db
        .collection(Collections.themeFeatureEntitlements)
        .where('themeId', '==', themeId)
        .get(),
    ]);

    return {
      theme: themeSnap.exists
        ? { id: themeSnap.id, ...themeSnap.data() }
        : {},
      colorSchemes: colorSchemesSnap.docs.map((d) => ({
        id: d.id,
        ...d.data(),
      })),
      widgetConfigs: widgetConfigsSnap.docs.map((d) => ({
        id: d.id,
        ...d.data(),
      })),
      pageConfigs: pageConfigsSnap.docs.map((d) => ({
        id: d.id,
        ...d.data(),
      })),
      splashAsset: splashSnap.exists
        ? { id: splashSnap.id, ...splashSnap.data() }
        : null,
      launchAsset: launchSnap.exists
        ? { id: launchSnap.id, ...launchSnap.data() }
        : null,
      featureAccess: featureAccessSnap.docs.length
        ? {
            id: featureAccessSnap.docs[0].id,
            ...featureAccessSnap.docs[0].data(),
          }
        : null,
    };
  }

  private async getNextVersion(themeId: string): Promise<number> {
    const db = admin.firestore();
    const snap = await db
      .collection(Collections.themeHistory)
      .where('themeId', '==', themeId)
      .orderBy('snapshotVersion', 'desc')
      .limit(1)
      .get();

    if (snap.empty) return 1;
    return ((snap.docs[0].data().snapshotVersion as number) ?? 0) + 1;
  }
}
