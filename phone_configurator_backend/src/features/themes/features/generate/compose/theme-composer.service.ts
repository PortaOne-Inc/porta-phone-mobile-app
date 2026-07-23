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

/** Readable text color (#111111 or #FFFFFF) for a given background hex. */
function readableOn(hex: string): string {
  const m = /^#?([0-9a-fA-F]{6})$/.exec(hex.trim());
  if (!m) return '#FFFFFF';
  const n = parseInt(m[1], 16);
  const [r, g, b] = [(n >> 16) & 255, (n >> 8) & 255, n & 255].map((c) => {
    const s = c / 255;
    return s <= 0.03928 ? s / 12.92 : ((s + 0.055) / 1.055) ** 2.4;
  });
  const lum = 0.2126 * r + 0.7152 * g + 0.0722 * b;
  return lum > 0.45 ? '#111111' : '#FFFFFF';
}

const isHex6 = (v: unknown): v is string => typeof v === 'string' && /^#[0-9A-Fa-f]{6}$/.test(v);
const weightObj = (w?: number | null) => (w ? { weight: w } : undefined);

/** Assign `obj[path...] = value` only when value is defined (keeps base default otherwise). */
function setIf(obj: Json, path: string[], value: unknown) {
  if (value === undefined || value === null) return;
  setPath(obj, path, value);
}

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
    const seedColor = brief.palette.seed;
    const palette = this.resolvePalette(brief);

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

  /**
   * Resolve the full light+dark palettes. Priority per role:
   *   explicit colorRoles  >  explicit semantic colors  >  M3-from-seed  >  default.
   * Explicit colors describe the "primary" variant (light, or dark if mood=dark);
   * the other variant stays purely M3-derived so it remains coherent/readable.
   */
  private resolvePalette(brief: ThemeBrief): Record<Variant, Record<string, string>> {
    const m3 = generatePalette(brief.palette.seed, {
      secondary: brief.palette.secondary,
      tertiary: brief.palette.tertiary,
    });
    const out: Record<Variant, Record<string, string>> = { light: { ...m3.light }, dark: { ...m3.dark } };
    const described: Variant = brief.mood === 'dark' ? 'dark' : 'light';
    out[described] = this.applyExplicit(out[described], brief);
    return out;
  }

  private applyExplicit(base: Record<string, string>, brief: ThemeBrief): Record<string, string> {
    const p = { ...base };
    const pal = brief.palette;
    const set = (role: string, hex?: string | null) => {
      if (isHex6(hex)) p[role] = hex;
    };

    // Brand / CTA
    const brand = pal.brand ?? pal.seed;
    if (isHex6(brand)) {
      p.primary = brand;
      p.surfaceTint = brand;
      p.onPrimary = readableOn(brand);
    }
    set('secondary', pal.secondary);

    // Success / positive accent -> tertiary family (snackBar.success, statuses use tertiary)
    if (isHex6(pal.success)) {
      p.tertiary = pal.success;
      p.onTertiary = readableOn(pal.success);
    }
    set('tertiary', pal.tertiary);

    // Backgrounds & surfaces
    if (isHex6(pal.background)) {
      p.surface = pal.background;
      p.surfaceBright = pal.background;
      p.surfaceContainerLowest = pal.background;
    }
    if (isHex6(pal.surface)) {
      p.surfaceContainerLow = pal.surface;
      p.surfaceContainer = pal.surface;
    }
    // Soft containers (cards / highlights, e.g. lavender)
    if (isHex6(pal.container)) {
      p.secondaryContainer = pal.container;
      p.primaryContainer = pal.container;
      p.surfaceContainerHigh = pal.container;
      p.surfaceContainerHighest = pal.container;
    }

    // Text
    set('onSurface', pal.textStrong);
    set('onSurfaceVariant', pal.textMuted);
    set('error', pal.error);

    // Exact Material-role overrides win over everything.
    if (brief.colorRoles) {
      for (const [role, hex] of Object.entries(brief.colorRoles)) set(role, hex);
    }
    return p;
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

    const typo = brief.typography ?? {};
    if (typo.fontFamily) setPath(w, ['fonts', 'fontFamily'], typo.fontFamily);

    const radius =
      typeof brief.shape?.radius === 'number'
        ? brief.shape.radius
        : brief.shape?.corners
          ? CORNER_RADIUS[brief.shape.corners]
          : undefined;

    const headingColor = brief.typography?.headingColor ?? brief.palette.textStrong ?? P.onSurface;
    const headingWeight = weightObj(typo.headingWeight);

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

    // App bar — title uses heading color/weight
    setPath(w, ['bar', 'appBarConfig', 'foregroundColor'], headingColor);
    setPath(w, ['bar', 'appBarConfig', 'titleTextStyle', 'color'], headingColor);
    setIf(w, ['bar', 'appBarConfig', 'titleTextStyle', 'fontWeight'], headingWeight);
    setPath(w, ['bar', 'appBarConfig', 'systemOverlayStyle', 'statusBarIconBrightness'], variant === 'dark' ? 'light' : 'dark');
    setPath(w, ['bar', 'appBarConfig', 'systemOverlayStyle', 'statusBarBrightness'], variant === 'dark' ? 'dark' : 'light');

    // Section/group titles — soft container card + brand heading
    setPath(w, ['group', 'groupTitleListTile', 'backgroundColor'], P.surfaceContainerHigh);
    setPath(w, ['group', 'groupTitleListTile', 'textStyle', 'color'], P.primary);
    setIf(w, ['group', 'groupTitleListTile', 'textStyle', 'fontWeight'], headingWeight);

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

    // Dialogs (success channel carried by P.tertiary, which == brief.palette.success when given)
    setPath(w, ['dialog', 'snackBar', 'successBackgroundColor'], P.tertiary);
    setPath(w, ['dialog', 'snackBar', 'errorBackgroundColor'], P.error);
    setPath(w, ['dialog', 'snackBar', 'warningBackgroundColor'], seed);
    setPath(w, ['dialog', 'confirmDialog', 'activeButtonColor1'], P.primary);
    setPath(w, ['dialog', 'confirmDialog', 'activeButtonColor2'], P.error);
    setPath(w, ['dialog', 'confirmDialog', 'defaultButtonColor'], P.outline);

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

    // Login/hero treatment ADAPTS to the reference (brief.style.heroStyle),
    // defaulting to airy for light surfaces and branded for dark/colored ones:
    //  - airy    : light hero (e.g. white→pale lavender), brand as accent, dark text
    //  - branded : brand color fills the screen, white text
    //  - solid   : flat single background color
    const headingTextColor = brief.typography?.headingColor ?? brief.palette.textStrong;
    const lightSurface = readableOn(P.surface) === '#111111';
    const heroStyle = brief.style?.heroStyle ?? (lightSurface ? 'airy' : 'branded');
    let loginBg: Record<string, unknown>;
    let loginText: string;
    if (heroStyle === 'branded') {
      loginBg = brandedGradient;
      loginText = '#FFFFFF';
    } else if (heroStyle === 'solid') {
      loginBg = { type: 'solid', color: P.surface };
      loginText = readableOn(P.surface);
    } else {
      loginBg = soft;
      loginText = dark ? '#FFFFFF' : (headingTextColor ?? P.onSurface);
    }

    setPath(p, ['login', 'modeSelect', 'background'], loginBg);
    setPath(p, ['login', 'switchPage', 'background'], loginBg);
    setPath(p, ['dialing', 'background'], brandedGradient);
    setPath(p, ['keypad', 'background'], soft);
    for (const pg of ['about', 'settings', 'contacts', 'favorites', 'conversations', 'recents', 'embedded']) {
      setPath(p, [pg, 'background'], subtle);
    }

    // Logo: an uploaded asset (resolved to a signed URL downstream), otherwise a
    // public placeholder so the theme is never empty even with no assets.
    const logoId = brief.assets?.logoAssetId;
    // topPad: when set, give the logo breathing room from the top on auth screens
    // (the only spacing the theme contract exposes here — via ImageSource render.padding).
    const logoFor = (path: string[], topPad?: number) => {
      const baseRender = getPath(p, [...path, 'render']) ?? { scale: 0.35, alignment: 'center' };
      let render = baseRender;
      if (topPad !== undefined) {
        const basePad = baseRender.padding ?? { left: 0, top: 0, right: 0, bottom: 0 };
        render = { ...baseRender, padding: { ...basePad, top: topPad } };
      }
      return logoId ? { ...assetRef(logoId), render } : { uri: PUBLIC_LOGO_URI, render };
    };
    setPath(p, ['login', 'modeSelect', 'mainLogo'], logoFor(['login', 'modeSelect', 'mainLogo']));
    setPath(p, ['login', 'switchPage', 'mainLogo'], logoFor(['login', 'switchPage', 'mainLogo'], 80));
    setPath(p, ['about', 'mainLogo'], logoFor(['about', 'mainLogo'], 24));
    if (logoId) assetIds.push(logoId);

    // System UI overlay brightness per variant on the main surfaces.
    const iconBrightness = dark ? 'light' : 'dark';
    setPath(p, ['login', 'modeSelect', 'systemUiOverlayStyle', 'statusBarIconBrightness'], iconBrightness);
    setPath(p, ['keypad', 'systemUiOverlayStyle', 'statusBarIconBrightness'], iconBrightness);

    // Typography depth — login greeting follows the hero treatment's text color;
    // call-screen name on the branded gradient (white).
    const headingWeight = weightObj(brief.typography?.headingWeight);
    setPath(p, ['login', 'modeSelect', 'greetingTextStyle', 'color'], loginText);
    setIf(p, ['login', 'modeSelect', 'greetingTextStyle', 'fontWeight'], headingWeight);
    setIf(p, ['dialing', 'callInfo', 'usernameTextStyle', 'fontWeight'], headingWeight);

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
