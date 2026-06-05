import { Injectable, Logger } from '@nestjs/common';
import { AssetRef } from '../../../../../common/references/asset-ref';
import { BaseThemeLoader } from '../base/base-theme.loader';
import { ThemeBrief } from '../brief/theme-brief.schema';
import { generatePalette } from '../generators/m3-palette';
import { ColorSchemeConfigSchema } from '../schemas/color-scheme.schema';

type Json = Record<string, any>;
type Variant = 'light' | 'dark';

export interface ComposedTheme {
  colorScheme: Record<Variant, Json>;
  widget: Record<Variant, Json>;
  page: Record<Variant, Json>;
  appConfig: Json;
  assetIds: string[];
}

const CORNER_RADIUS: Record<string, number> = { sharp: 0, rounded: 8, pill: 24 };
const assetRef = (id: string): AssetRef => ({ $ref: 'asset', id });

/** Public placeholder logo, used when the application has no uploaded asset
 *  (renders everywhere, including the configurator preview which lacks the
 *  phone app's bundled `asset://` images). Temporary until a real logo is added. */
const PUBLIC_LOGO_URI = 'https://placehold.co/600x200.svg?text=Your+Logo';

/** A vertical PageBackground gradient (matches PageBackground.gradient JSON). */
const gradient = (colors: string[]) => ({
  type: 'gradient',
  colors,
  stops: [0, 1],
  beginX: 0,
  beginY: 0,
  endX: 0,
  endY: 1,
});

/** Assign `obj[path...] = value`, creating intermediate objects as needed. */
function setPath(obj: Json, path: string[], value: unknown) {
  let cur = obj;
  for (let i = 0; i < path.length - 1; i++) {
    const k = path[i];
    if (typeof cur[k] !== 'object' || cur[k] === null) cur[k] = {};
    cur = cur[k];
  }
  cur[path[path.length - 1]] = value;
}

/** Read `obj[path...]`, returning undefined if any segment is missing. */
function getPath(obj: Json, path: string[]): any {
  return path.reduce<any>((c, k) => (c == null ? c : c[k]), obj);
}

@Injectable()
export class ThemeComposerService {
  private readonly logger = new Logger(ThemeComposerService.name);

  constructor(private readonly base: BaseThemeLoader) {}

  compose(brief: ThemeBrief): ComposedTheme {
    const palette = generatePalette(brief.palette.seed, {
      secondary: brief.palette.secondary,
      tertiary: brief.palette.tertiary,
    });
    const seedColor = brief.palette.seed;

    const colorScheme: Record<Variant, Json> = {
      light: this.buildColorScheme(seedColor, palette.light, 'light'),
      dark: this.buildColorScheme(seedColor, palette.dark, 'dark'),
    };

    const assetIds: string[] = [];
    const widget: Record<Variant, Json> = {
      light: this.buildWidget('light', colorScheme.light.colorSchemeOverride, seedColor, brief),
      dark: this.buildWidget('dark', colorScheme.dark.colorSchemeOverride, seedColor, brief),
    };
    // Login & call screens carry white text — use the LIGHT palette's mid/dark
    // primary→secondary for both variants so the gradient stays readable.
    const L = colorScheme.light.colorSchemeOverride;
    const brandedGradient = gradient([L.primary, L.secondary]);
    const page: Record<Variant, Json> = {
      light: this.buildPage('light', colorScheme.light.colorSchemeOverride, brief, assetIds, brandedGradient),
      dark: this.buildPage('dark', colorScheme.dark.colorSchemeOverride, brief, assetIds, brandedGradient),
    };

    const appConfig = this.buildAppConfig(brief);

    return { colorScheme, widget, page, appConfig, assetIds: [...new Set(assetIds)] };
  }

  private buildColorScheme(seedColor: string, override: Record<string, string>, variant: Variant): Json {
    const candidate = { seedColor, colorSchemeOverride: override };
    const check = ColorSchemeConfigSchema.safeParse(candidate);
    if (check.success) return candidate;
    this.logger.warn(`Generated ${variant} color scheme failed validation, using canonical base`);
    return this.base.colorScheme(variant);
  }

  private buildWidget(variant: Variant, P: Record<string, string>, seed: string, brief: ThemeBrief): Json {
    const w = this.base.widget(variant);

    if (brief.typography?.fontFamily) {
      setPath(w, ['fonts', 'fontFamily'], brief.typography.fontFamily);
    }
    const radius = brief.shape?.corners ? CORNER_RADIUS[brief.shape.corners] : undefined;

    // Primary elevated button
    setPath(w, ['button', 'primaryElevatedButton', 'backgroundColor'], P.primary);
    setPath(w, ['button', 'primaryElevatedButton', 'foregroundColor'], P.onPrimary);
    setPath(w, ['button', 'primaryElevatedButton', 'disabledBackgroundColor'], P.surfaceContainerHighest);
    setPath(w, ['button', 'primaryElevatedButton', 'disabledForegroundColor'], P.onSurfaceVariant);
    if (radius !== undefined) setPath(w, ['button', 'primaryElevatedButton', 'shape', 'borderRadius'], radius);

    // Tabs (bottom navigation + tab bar) — recolored
    const accent = brief.tabs?.accentFollowsPrimary === false && brief.tabs?.selectedColor
      ? brief.tabs.selectedColor
      : brief.tabs?.selectedColor ?? P.primary;
    const unselected = brief.tabs?.unselectedColor ?? P.onSurfaceVariant;
    const tabBg = brief.tabs?.backgroundColor ?? P.surface;
    setPath(w, ['bar', 'bottomNavigationBar', 'backgroundColor'], tabBg);
    setPath(w, ['bar', 'bottomNavigationBar', 'selectedItemColor'], accent);
    setPath(w, ['bar', 'bottomNavigationBar', 'unSelectedItemColor'], unselected);
    setPath(w, ['bar', 'tabBarConfig', 'indicatorColor'], accent);
    setPath(w, ['bar', 'tabBarConfig', 'labelColor'], P.onPrimary);
    setPath(w, ['bar', 'tabBarConfig', 'unselectedLabelColor'], unselected);

    // App bar
    setPath(w, ['bar', 'appBarConfig', 'foregroundColor'], P.onSurface);
    setPath(w, ['bar', 'appBarConfig', 'titleTextStyle', 'color'], P.onSurface);
    setPath(w, ['bar', 'appBarConfig', 'systemOverlayStyle', 'statusBarIconBrightness'], variant === 'dark' ? 'light' : 'dark');
    setPath(w, ['bar', 'appBarConfig', 'systemOverlayStyle', 'statusBarBrightness'], variant === 'dark' ? 'dark' : 'light');

    // Avatar
    setPath(w, ['imageAssets', 'leadingAvatarStyle', 'backgroundColor'], P.surfaceContainerHigh);
    setPath(w, ['imageAssets', 'leadingAvatarStyle', 'initialsTextStyle', 'color'], P.primary);
    setPath(w, ['imageAssets', 'leadingAvatarStyle', 'smartIndicator', 'backgroundColor'], P.surfaceContainerLowest);

    // Inputs
    setPath(w, ['input', 'primary', 'labelColor'], P.primary);
    setPath(w, ['input', 'primary', 'border', 'focused', 'typicalColor'], P.primary);
    setPath(w, ['input', 'primary', 'border', 'focused', 'errorColor'], P.error);
    setPath(w, ['input', 'primary', 'border', 'any', 'typicalColor'], P.outline);
    setPath(w, ['input', 'primary', 'border', 'any', 'errorColor'], P.error);
    setPath(w, ['input', 'primary', 'border', 'disabled', 'typicalColor'], P.outlineVariant);
    setPath(w, ['input', 'primary', 'border', 'disabled', 'errorColor'], P.error);

    // Text selection / linkify
    setPath(w, ['text', 'selection', 'cursorColor'], P.primary);
    setPath(w, ['text', 'selection', 'selectionColor'], P.primaryContainer);
    setPath(w, ['text', 'selection', 'selectionHandleColor'], P.primary);
    setPath(w, ['text', 'linkify', 'styleColor'], P.onSurface);
    setPath(w, ['text', 'linkify', 'linkifyStyleColor'], P.primary);

    // Dialogs
    setPath(w, ['dialog', 'snackBar', 'successBackgroundColor'], P.tertiary);
    setPath(w, ['dialog', 'snackBar', 'errorBackgroundColor'], P.error);
    setPath(w, ['dialog', 'snackBar', 'warningBackgroundColor'], seed);

    // Statuses
    setPath(w, ['statuses', 'registrationStatuses', 'online'], P.tertiary);
    setPath(w, ['statuses', 'registrationStatuses', 'offline'], P.surfaceContainerHigh);
    setPath(w, ['statuses', 'callStatuses', 'connectivityNone'], P.error);
    setPath(w, ['statuses', 'callStatuses', 'connectError'], P.error);
    setPath(w, ['statuses', 'callStatuses', 'connectIssue'], P.error);
    setPath(w, ['statuses', 'callStatuses', 'inProgress'], P.secondary);
    setPath(w, ['statuses', 'callStatuses', 'ready'], P.tertiary);

    return w;
  }

  private buildPage(
    variant: Variant,
    P: Record<string, string>,
    brief: ThemeBrief,
    assetIds: string[],
    brandedGradient: Record<string, unknown>,
  ): Json {
    const p = this.base.page(variant);
    const dark = variant === 'dark';

    // Palette-driven gradients. The canonical base hardcoded the original
    // theme's colors and left most pages' backgrounds disabled (`_background`),
    // so generated themes had no themed gradients — generate and enable them.
    // `brandedGradient` (mid/dark, from the light palette) is for white-text
    // screens; soft/subtle are variant-aware for dark-text content pages.
    const soft = gradient(dark ? [P.surfaceContainerHigh, P.surface] : [P.primaryContainer, P.surfaceBright]);
    const subtle = gradient(dark ? [P.surfaceContainer, P.surface] : [P.surfaceBright, P.surfaceContainerLow]);

    setPath(p, ['login', 'modeSelect', 'background'], brandedGradient);
    setPath(p, ['login', 'switchPage', 'background'], brandedGradient);
    setPath(p, ['dialing', 'background'], brandedGradient);
    setPath(p, ['keypad', 'background'], soft);
    for (const pg of ['about', 'settings', 'contacts', 'favorites', 'conversations', 'recents', 'embedded']) {
      setPath(p, [pg, 'background'], subtle);
    }

    // Logo: an uploaded asset (resolved to a signed URL downstream), otherwise a
    // public placeholder so the theme is never empty even with no assets.
    const logoId = brief.assets?.logoAssetId;
    const logoFor = (path: string[]) => {
      const render = getPath(p, [...path, 'render']) ?? { scale: 0.35, alignment: 'center' };
      return logoId ? { ...assetRef(logoId), render } : { uri: PUBLIC_LOGO_URI, render };
    };
    setPath(p, ['login', 'modeSelect', 'mainLogo'], logoFor(['login', 'modeSelect', 'mainLogo']));
    setPath(p, ['login', 'switchPage', 'mainLogo'], logoFor(['login', 'switchPage', 'mainLogo']));
    setPath(p, ['about', 'mainLogo'], logoFor(['about', 'mainLogo']));
    if (logoId) assetIds.push(logoId);

    // System UI overlay brightness per variant on the main surfaces.
    const iconBrightness = dark ? 'light' : 'dark';
    setPath(p, ['login', 'modeSelect', 'systemUiOverlayStyle', 'statusBarIconBrightness'], iconBrightness);
    setPath(p, ['keypad', 'systemUiOverlayStyle', 'statusBarIconBrightness'], iconBrightness);

    return p;
  }

  /** Build a full AppConfig (features + tabs) with everything enabled by default. */
  private buildAppConfig(brief: ThemeBrief): Json {
    const cfg = this.base.appConfig();
    const f = brief.features ?? { video: true, messaging: true, systemNotifications: true, hybridPresence: true };
    const mode = brief.mood === 'both' ? 'system' : brief.mood;

    cfg.supported = [
      { type: 'themeMode', mode },
      { type: 'videoCall', enabled: f.video },
      { type: 'systemNotifications', enabled: f.systemNotifications },
      { type: 'hybridPresence', enabled: f.hybridPresence },
      { type: 'loggingConfig', checkIntervalSec: 15 },
    ];

    // Enable core bottom-menu tabs.
    const coreTabs = new Set(['favorites', 'recents', 'contacts', 'keypad', 'messaging']);
    const tabs: Json[] = cfg?.mainConfig?.bottomMenu?.tabs ?? [];
    for (const t of tabs) {
      if (coreTabs.has(t.type)) t.enabled = true;
    }

    setPath(cfg, ['callConfig', 'videoEnabled'], f.video);
    setPath(cfg, ['messaging', 'chats', 'groupChatButtonEnabled'], f.messaging);

    return cfg;
  }
}
