import { deepMerge, mergeConfig } from './deep-merge';

describe('deepMerge', () => {
  it('should replace arrays instead of merging them', () => {
    const target = { items: [1, 2, 3] };
    const source = { items: [4, 5] };
    const result = deepMerge(target, source);
    expect(result.items).toEqual([4, 5]);
  });

  it('should deep merge nested objects', () => {
    const target = { a: { b: 1, c: 2 } };
    const source = { a: { c: 3, d: 4 } };
    const result = deepMerge(target, source);
    expect(result).toEqual({ a: { b: 1, c: 3, d: 4 } });
  });

  it('should replace primitives with source value', () => {
    const target = { x: 'old', y: 10 };
    const source = { x: 'new', y: 20 };
    const result = deepMerge(target, source);
    expect(result).toEqual({ x: 'new', y: 20 });
  });

  it('should handle null in source by replacing target value', () => {
    const target = { a: { nested: true } } as any;
    const source = { a: null } as any;
    const result = deepMerge(target, source);
    expect(result.a).toBeNull();
  });

  it('should return source when target is not an object', () => {
    const result = deepMerge(null as any, { a: 1 });
    expect(result).toEqual({ a: 1 });
  });

  it('should preserve keys only in target', () => {
    const target = { a: 1, b: 2 };
    const source = { b: 3 };
    const result = deepMerge(target, source);
    expect(result).toEqual({ a: 1, b: 3 });
  });

  it('should replace nested arrays inside objects', () => {
    const target = { config: { colors: ['red', 'blue'], name: 'theme' } };
    const source = { config: { colors: ['green'] } };
    const result = deepMerge(target, source);
    expect(result.config.colors).toEqual(['green']);
    expect(result.config.name).toBe('theme');
  });

  it('should handle deeply nested structures', () => {
    const target = { a: { b: { c: { d: 1 } } } };
    const source = { a: { b: { c: { e: 2 } } } };
    const result = deepMerge(target, source);
    expect(result).toEqual({ a: { b: { c: { d: 1, e: 2 } } } });
  });
});

describe('mergeConfig', () => {
  it('should return current when patch is undefined', () => {
    const current = { a: 1 };
    expect(mergeConfig(current, undefined)).toBe(current);
  });

  it('should return current when patch is empty', () => {
    const current = { a: 1 };
    expect(mergeConfig(current, {})).toBe(current);
  });

  it('should deep merge patch into current', () => {
    const current = { a: 1, b: { c: 2 } };
    const patch = { b: { d: 3 } };
    const result = mergeConfig(current, patch);
    expect(result).toEqual({ a: 1, b: { c: 2, d: 3 } });
  });
});
