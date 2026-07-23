import * as admin from 'firebase-admin';

const DRY_RUN = process.argv.includes('--dry-run');
const DELETE_LEGACY = process.argv.includes('--delete-legacy');

const COLLECTION_PREFIX = process.env.COLLECTION_PREFIX?.trim() || '';

const Collections = {
    themesPrefixed: `${COLLECTION_PREFIX}themes`,
    themesUnprefixed: `themes`,

    themeConfigColorSchemes: `${COLLECTION_PREFIX}theme_config_color_schemes`,
    themeConfigWidgets: `${COLLECTION_PREFIX}theme_config_widgets`,
    themeConfigPages: `${COLLECTION_PREFIX}theme_config_pages`,
    themeFeatureEntitlements: `${COLLECTION_PREFIX}theme_feature_entitlements`,
};

function nowIso() {
    return new Date().toISOString();
}

async function resolveThemesCollection(db: FirebaseFirestore.Firestore) {
    const snapPref = await db
        .collection(Collections.themesPrefixed)
        .limit(1)
        .get();
    if (!snapPref.empty) {
        console.log(`[ok] Using collection: ${Collections.themesPrefixed}`);
        return Collections.themesPrefixed;
    }
    const snap = await db.collection(Collections.themesUnprefixed).limit(1).get();
    if (!snap.empty) {
        console.log(`[ok] Using collection: ${Collections.themesUnprefixed}`);
        return Collections.themesUnprefixed;
    }
    console.warn(
        `[warn] Both ${Collections.themesPrefixed} and ${Collections.themesUnprefixed} look empty. Will use ${Collections.themesPrefixed}.`,
    );
    return Collections.themesPrefixed;
}

function toVariantId(themeId: string, variant: 'light' | 'dark') {
    return `${themeId}_${variant}`;
}

async function migrateOneTheme(
    db: FirebaseFirestore.Firestore,
    themeDoc: FirebaseFirestore.QueryDocumentSnapshot<FirebaseFirestore.DocumentData>,
) {
    const theme = themeDoc.data() as any;
    const themeId: string = theme.id ?? themeDoc.id;
    const applicationId: string | undefined = theme.applicationId;

    const hasAnyLegacy =
        typeof theme.colorSchemeConfig !== 'undefined' ||
        typeof theme.themeWidgetConfig !== 'undefined' ||
        typeof theme.themePageConfig !== 'undefined' ||
        typeof theme.appConfig !== 'undefined';

    if (!hasAnyLegacy) {
        console.log(`- [skip] ${themeId}: no legacy fields`);
        return;
    }

    console.log(
        `\n=== Migrating theme ${themeId} (appId=${applicationId ?? 'unknown'}) ===`,
    );

    const now = nowIso();

    if (typeof theme.colorSchemeConfig !== 'undefined') {
        const id = toVariantId(themeId, 'light');
        const docRef = db.collection(Collections.themeConfigColorSchemes).doc(id);
        const payload = {
            id,
            applicationId: applicationId ?? null,
            themeId,
            variant: 'light',
            config: theme.colorSchemeConfig,
            createdAt: now,
            updatedAt: now,
        };
        console.log(
            `  [+] colorScheme -> ${Collections.themeConfigColorSchemes}/${id}`,
        );
        if (!DRY_RUN) await docRef.set(payload, {merge: true});
        if (DELETE_LEGACY) {
            console.log(`  [-] delete legacy field colorSchemeConfig`);
            if (!DRY_RUN)
                await themeDoc.ref.update({
                    colorSchemeConfig: admin.firestore.FieldValue.delete(),
                });
        }
    }

    if (typeof theme.themeWidgetConfig !== 'undefined') {
        const id = toVariantId(themeId, 'light');
        const docRef = db.collection(Collections.themeConfigWidgets).doc(id);
        const payload = {
            id,
            applicationId: applicationId ?? null,
            themeId,
            variant: 'light',
            config: theme.themeWidgetConfig,
            createdAt: now,
            updatedAt: now,
        };
        console.log(
            `  [+] widgetConfig -> ${Collections.themeConfigWidgets}/${id}`,
        );
        if (!DRY_RUN) await docRef.set(payload, {merge: true});
        if (DELETE_LEGACY) {
            console.log(`  [-] delete legacy field themeWidgetConfig`);
            if (!DRY_RUN)
                await themeDoc.ref.update({
                    themeWidgetConfig: admin.firestore.FieldValue.delete(),
                });
        }
    }

    if (typeof theme.themePageConfig !== 'undefined') {
        const node = theme.themePageConfig;
        const looksVariantMap =
            node &&
            typeof node === 'object' &&
            (node.light !== undefined || node.dark !== undefined);

        if (looksVariantMap) {
            for (const v of ['light', 'dark'] as const) {
                if (typeof node[v] === 'undefined') continue;
                const id = toVariantId(themeId, v);
                const docRef = db.collection(Collections.themeConfigPages).doc(id);
                const payload = {
                    id,
                    applicationId: applicationId ?? null,
                    themeId,
                    variant: v,
                    config: node[v],
                    createdAt: now,
                    updatedAt: now,
                };
                console.log(
                    `  [+] pageConfig[${v}] -> ${Collections.themeConfigPages}/${id}`,
                );
                if (!DRY_RUN) await docRef.set(payload, {merge: true});
            }
        } else {
            const id = toVariantId(themeId, 'light');
            const docRef = db.collection(Collections.themeConfigPages).doc(id);
            const payload = {
                id,
                applicationId: applicationId ?? null,
                themeId,
                variant: 'light',
                config: node,
                createdAt: now,
                updatedAt: now,
            };
            console.log(
                `  [+] pageConfig(light) -> ${Collections.themeConfigPages}/${id}`,
            );
            if (!DRY_RUN) await docRef.set(payload, {merge: true});
        }

        if (DELETE_LEGACY) {
            console.log(`  [-] delete legacy field themePageConfig`);
            if (!DRY_RUN)
                await themeDoc.ref.update({
                    themePageConfig: admin.firestore.FieldValue.delete(),
                });
        }
    }

    if (typeof theme.appConfig !== 'undefined') {
        const id = themeId;
        const docRef = db.collection(Collections.themeFeatureEntitlements).doc(id);
        const payload = {
            id,
            applicationId: applicationId ?? null,
            themeId,
            status: 'draft',
            config: theme.appConfig,
            createdAt: now,
            updatedAt: now,
        };
        console.log(
            `  [+] appConfig -> ${Collections.themeFeatureEntitlements}/${id}`,
        );
        if (!DRY_RUN) await docRef.set(payload, {merge: true});
        if (DELETE_LEGACY) {
            console.log(`  [-] delete legacy field appConfig`);
            if (!DRY_RUN)
                await themeDoc.ref.update({
                    appConfig: admin.firestore.FieldValue.delete(),
                });
        }
    }

    console.log(`  [done] ${themeId}`);
}

async function main() {
    if (!admin.apps.length) {
        admin.initializeApp();
    }
    const db = admin.firestore();

    const themesCollection = await resolveThemesCollection(db);

    console.log(DRY_RUN ? '*** DRY RUN ***' : '*** LIVE RUN ***');
    const snap = await db.collection(themesCollection).get();
    console.log(`[scan] found ${snap.size} theme docs`);

    let migrated = 0;
    for (const doc of snap.docs) {
        await migrateOneTheme(db, doc);
        migrated++;
    }

    console.log(`\n==> Completed. Migrated scanned docs: ${migrated}`);
}

main().catch((e) => {
    console.error('Migration failed:', e);
    process.exit(1);
});
