import { isAssetRef } from '../references/asset-ref';

/**
 * Deep-clones an object, replacing every `{ $ref: 'asset', id }` node's ID
 * according to the provided `oldId -> newId` mapping.
 * IDs not present in the map are left unchanged.
 */
export function remapAssetIdsDeep<T>(input: T, idMap: Map<string, string>): T {
  if (input == null || typeof input !== 'object') return input;

  const clone = structuredClone(input) as any;
  const stack: any[] = [clone];

  while (stack.length) {
    const node = stack.pop();
    if (Array.isArray(node)) {
      for (const v of node) {
        if (v && typeof v === 'object') stack.push(v);
      }
    } else if (node && typeof node === 'object') {
      if (isAssetRef(node) && idMap.has(node.id)) {
        node.id = idMap.get(node.id)!;
      }
      for (const v of Object.values(node)) {
        if (v && typeof v === 'object') stack.push(v);
      }
    }
  }

  return clone;
}
