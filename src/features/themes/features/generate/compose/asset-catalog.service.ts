import { Injectable, Logger } from '@nestjs/common';
import { AssetsService } from '../../../../assets/assets.service';

export interface AssetCatalogItem {
  id: string;
  name: string;
  mime: string;
  /** best-effort role guess from the filename, to help the LLM pick slots */
  roleGuess: 'logo' | 'background' | 'splash' | 'icon' | 'image';
}

function guessRole(name: string): AssetCatalogItem['roleGuess'] {
  const n = name.toLowerCase();
  if (n.includes('logo')) return 'logo';
  if (n.includes('splash')) return 'splash';
  if (n.includes('background') || n.includes('bg') || n.includes('wallpaper')) return 'background';
  if (n.includes('icon')) return 'icon';
  return 'image';
}

/**
 * Reads the application's uploaded assets so the LLM can pick real images
 * (logo / background / splash) by id, and binds chosen ids back as theme
 * references via refcount tracking.
 */
@Injectable()
export class AssetCatalogService {
  private readonly logger = new Logger(AssetCatalogService.name);

  /**
   * Placeholder logo seeded when the app has no SVG asset. The phone app renders
   * logos via SVG only, so this MUST be an SVG (a raster PNG would not render).
   * Icon-only (no text) — the app shows its own label beneath the logo.
   * Inlined (no network) for reliability.
   */
  private static readonly SEED_LOGO_SVG = `<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 200 200" fill="none">
  <rect x="20" y="20" width="160" height="160" rx="40" fill="#6750A4"/>
  <g transform="translate(58,58) scale(3.5)" fill="#FFFFFF">
    <path d="M6.62 10.79c1.44 2.83 3.76 5.14 6.59 6.59l2.2-2.2c.27-.27.67-.36 1.02-.24 1.12.37 2.33.57 3.57.57.55 0 1 .45 1 1V20c0 .55-.45 1-1 1-9.39 0-17-7.61-17-17 0-.55.45-1 1-1h3.5c.55 0 1 .45 1 1 0 1.25.2 2.45.57 3.57.11.35.03.74-.25 1.02l-2.2 2.2z"/>
  </g>
</svg>`;

  constructor(private readonly assets: AssetsService) {}

  /**
   * Store a placeholder SVG logo as a real application asset (so it appears in
   * the Assets list and can be referenced by themes). Best-effort: null on fail.
   */
  async seedDefaultAsset(uid: string, applicationId: string): Promise<AssetCatalogItem | null> {
    try {
      const buffer = Buffer.from(AssetCatalogService.SEED_LOGO_SVG, 'utf8');
      const file = {
        fieldname: 'file',
        originalname: 'default-logo.svg',
        encoding: '7bit',
        mimetype: 'image/svg+xml',
        buffer,
        size: buffer.length,
      } as Express.Multer.File;

      const asset = await this.assets.uploadAndCreate(uid, applicationId, file);
      this.logger.log(`Seeded default SVG logo asset ${asset.id} for app ${applicationId}`);
      return { id: asset.id, name: 'default-logo.svg', mime: 'image/svg+xml', roleGuess: 'logo' };
    } catch (err) {
      this.logger.warn(`Failed to seed default asset for app ${applicationId}: ${(err as Error).message}`);
      return null;
    }
  }

  async catalog(uid: string, applicationId: string): Promise<AssetCatalogItem[]> {
    try {
      const items = await this.assets.findAll(uid, applicationId, { includeUrl: false });
      return items
        .filter((a) => (a.mimeType ?? '').startsWith('image/'))
        .map((a) => {
          const name = (a.storagePath ?? a.id).split('/').pop() ?? a.id;
          return { id: a.id, name, mime: a.mimeType, roleGuess: guessRole(name) };
        });
    } catch (err) {
      this.logger.warn(`Failed to list assets for app ${applicationId}: ${(err as Error).message}`);
      return [];
    }
  }

  /** Best-effort refcount linking of the assets actually used by a theme. */
  async link(uid: string, themeId: string, assetIds: string[]): Promise<string[]> {
    const applied: string[] = [];
    for (const id of [...new Set(assetIds.filter(Boolean))]) {
      try {
        await this.assets.incrementRef(uid, id, { type: 'theme', id: themeId });
        applied.push(id);
      } catch (err) {
        this.logger.warn(`Could not link asset ${id} to theme ${themeId}: ${(err as Error).message}`);
      }
    }
    return applied;
  }
}
