import { isAssetRef } from '../references/asset-ref';

/**
 * Walks an object tree and returns all unique asset IDs found in
 * `{ $ref: 'asset', id: '...' }` nodes.
 */
export function extractAssetIdsDeep(input: unknown): string[] {
  const ids = new Set<string>();
  const stack: unknown[] = [input];

  while (stack.length) {
    const node = stack.pop();
    if (isAssetRef(node)) {
      ids.add(node.id);
      continue;
    }
    if (Array.isArray(node)) {
      for (const v of node) stack.push(v);
    } else if (node && typeof node === 'object') {
      for (const v of Object.values(node as Record<string, unknown>)) {
        stack.push(v);
      }
    }
  }

  return [...ids];
}
