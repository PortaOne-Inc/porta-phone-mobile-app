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
   * Inlined (no network) for reliability.
   */
  private static readonly SEED_LOGO_SVG = `<svg xmlns="http://www.w3.org/2000/svg" width="600" height="200" viewBox="0 0 600 200">
  <rect width="600" height="200" rx="24" fill="#E0E0E0"/>
  <text x="300" y="118" font-family="Arial, Helvetica, sans-serif" font-size="64" font-weight="700" fill="#9E9E9E" text-anchor="middle">Logo</text>
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
