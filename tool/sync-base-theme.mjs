#!/usr/bin/env node
/**
 * Regenerate the generator's base theme from the schema source of truth — the
 * webtrit_appearance_theme DTO defaults — by running the Dart tool in
 * tool/base-theme (which path-depends on the package and emits each root's
 * `toJson()` of a default instance). Nothing is read from or written to the
 * client app; the backend composer authors all design on top of these defaults.
 *
 * Requires the Dart SDK and a sibling `webtrit_phone` checkout (the path
 * dependency in tool/base-theme/pubspec.yaml).
 *
 * Usage:
 *   node tool/sync-base-theme.mjs           # regenerate base/*.json from DTOs
 *   node tool/sync-base-theme.mjs --check   # exit 1 if base drifted (CI)
 */
import { execFileSync } from 'node:child_process';
import { existsSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join, resolve } from 'node:path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const repoRoot = resolve(__dirname, '..');
const toolDir = join(repoRoot, 'tool', 'base-theme');
const baseRel = 'src/features/themes/features/generate/base';
const check = process.argv.includes('--check');

function run(cmd, args, cwd) {
  return execFileSync(cmd, args, { cwd, stdio: 'pipe' }).toString();
}

if (!existsSync(join(toolDir, 'pubspec.yaml'))) {
  console.error(`[sync-base-theme] Missing Dart tool at ${toolDir}`);
  process.exit(2);
}

try {
  run('dart', ['pub', 'get'], toolDir);
  process.stdout.write(run('dart', ['run', 'bin/gen.dart'], toolDir));
} catch (err) {
  console.error('[sync-base-theme] Dart generation failed. Ensure the Dart SDK is installed and a');
  console.error('webtrit_phone checkout exists at the path in tool/base-theme/pubspec.yaml.');
  console.error(String(err.stderr ?? err.message ?? err));
  process.exit(2);
}

if (check) {
  try {
    run('git', ['diff', '--quiet', '--', baseRel], repoRoot);
    console.log('[sync-base-theme] base theme is in sync with the DTOs ✓');
  } catch {
    console.error('[sync-base-theme] DRIFT: base/*.json differs from the current DTO defaults.');
    console.error('Commit the regenerated files (the DTOs changed).');
    process.exit(1);
  }
} else {
  console.log('[sync-base-theme] done — base regenerated from DTO defaults');
}
