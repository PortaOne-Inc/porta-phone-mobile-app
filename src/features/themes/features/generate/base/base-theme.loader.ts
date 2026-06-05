import { Injectable, Logger } from '@nestjs/common';
import * as fs from 'fs';
import * as path from 'path';

type Json = Record<string, any>;

/**
 * Loads the canonical "original" theme (copied from the WebTrit Phone app
 * assets) used as the structural base for generation. Guarantees a complete,
 * valid theme even when the LLM contributes little.
 *
 * The base JSON dir location differs between build layouts (nest emits code to
 * `dist/src/...` while `nest-cli` assets copy to `dist/...`), so resolve it
 * robustly across candidates — the `src/...` source dir is always present both
 * locally and in deployed Cloud Functions.
 */
@Injectable()
export class BaseThemeLoader {
  private readonly logger = new Logger(BaseThemeLoader.name);
  private cache = new Map<string, Json>();
  private readonly baseDir = this.resolveBaseDir();

  private resolveBaseDir(): string {
    const rel = path.join('features', 'themes', 'features', 'generate', 'base');
    const candidates = [
      path.join(__dirname, 'base'), // co-located with the compiled file
      path.join(process.cwd(), 'dist', 'src', rel), // tsc dist/src layout
      path.join(process.cwd(), 'dist', rel), // nest-cli assets copy
      path.join(process.cwd(), 'src', rel), // source (always deployed)
    ];
    const found = candidates.find((c) => fs.existsSync(path.join(c, 'app.config.json')));
    if (!found) {
      this.logger.error(`Base theme dir not found; tried:\n${candidates.join('\n')}`);
    }
    return found ?? candidates[0];
  }

  private read(file: string): Json {
    if (this.cache.has(file)) return structuredClone(this.cache.get(file)!);
    const full = path.join(this.baseDir, file);
    try {
      const parsed = JSON.parse(fs.readFileSync(full, 'utf8'));
      this.cache.set(file, parsed);
      return structuredClone(parsed);
    } catch (err) {
      this.logger.error(`Failed to load base theme asset ${file} at ${full}`, err as any);
      return {};
    }
  }

  colorScheme(variant: 'light' | 'dark'): Json {
    return this.read(`color.${variant}.json`);
  }
  widget(variant: 'light' | 'dark'): Json {
    return this.read(`widget.${variant}.json`);
  }
  page(variant: 'light' | 'dark'): Json {
    return this.read(`page.${variant}.json`);
  }
  appConfig(): Json {
    return this.read('app.config.json');
  }
}
