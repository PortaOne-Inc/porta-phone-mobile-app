export const COLLECTION_PREFIX: string =
  process.env.COLLECTION_PREFIX?.trim() || '';

/**
 * Central registry of Firestore collection names.
 */
export const Collections = {
  applications: `${COLLECTION_PREFIX}applications`,
  applicationAssets: `${COLLECTION_PREFIX}application_assets`,
  applicationAssetsRenditions: `${COLLECTION_PREFIX}application_assets_renditions`,
  applicationEmbeds: `${COLLECTION_PREFIX}application_embeds`,
  applicationStorePublishing: `${COLLECTION_PREFIX}application_store_publishing`,
  applicationBuildArtifacts: `${COLLECTION_PREFIX}application_build_artifacts`,

  themes: `${COLLECTION_PREFIX}themes`,
  themeAssetsSplash: `${COLLECTION_PREFIX}theme_assets_splash`,
  themeAssetsLauncher: `${COLLECTION_PREFIX}theme_assets_launcher`,
  themeAssetsRenditions: `${COLLECTION_PREFIX}theme_assets_renditions`,

  themeConfigWidgets: `${COLLECTION_PREFIX}theme_config_widgets`,
  themeConfigColorSchemes: `${COLLECTION_PREFIX}theme_config_color_schemes`,
  themeConfigPages: `${COLLECTION_PREFIX}theme_config_pages`,
  themeConfigsDefaults: `${COLLECTION_PREFIX}theme_configs_defaults`,
  applicationCapabilities: `${COLLECTION_PREFIX}application_capabilities`,

  themeFeatureEntitlements: `${COLLECTION_PREFIX}theme_feature_entitlements`,
  themeHistory: `${COLLECTION_PREFIX}theme_history`,
  themeShareTokens: `${COLLECTION_PREFIX}theme_share_tokens`,

  users: `${COLLECTION_PREFIX}users`,
  userRoles: `${COLLECTION_PREFIX}user_roles`,
  counters: `${COLLECTION_PREFIX}counters`,

  translations: `${COLLECTION_PREFIX}translations`,
} as const;

export type CollectionName = (typeof Collections)[keyof typeof Collections];
export type CollectionKey = keyof typeof Collections;

/**
 * Namespaces used for upload flows (a subset of Collections).
 * This allows you to express "public API" keys while still mapping them
 * to the actual collection names (via NamespaceToCollectionKey).
 */
export const UploadNamespaces = {
  applicationAssets: 'applicationAssets',
  applicationAssetsRenditions: 'applicationAssetsRenditions',
} as const;

export type UploadNamespace = keyof typeof UploadNamespaces;

/**
 * Mapping from UploadNamespace to actual collection key in Collections.
 * If you ever rename the underlying collection, update only this mapping.
 */
export const NamespaceToCollectionKey: Record<UploadNamespace, CollectionKey> =
  {
    applicationAssets: 'applicationAssets',
    applicationAssetsRenditions: 'applicationAssetsRenditions',
  };

/**
 * Helpers for building full document paths.
 */
export const DocPaths = {
  asset: (id: string) => `${Collections.applicationAssets}/${id}`,
  splashAsset: (id: string) => `${Collections.themeAssetsSplash}/${id}`,
  widgetConfig: (id: string) => `${Collections.themeConfigWidgets}/${id}`,
};

/**
 * Useful keys for queries / composite indexes.
 */
export const IndexKeys = {
  byOwner: 'ownerId',
  byApp: 'applicationId',
  byTheme: 'themeId',
} as const;

/**
 * Consistent ISO timestamp helper.
 */
export const nowIso = () => new Date().toISOString();
