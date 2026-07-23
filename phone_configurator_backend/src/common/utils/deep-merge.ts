/**
 * Deep merges source into target.
 * - Objects: recursively merged
 * - Arrays: fully replaced (not element-merged) — intentional for ordered config lists
 * - Primitives: replaced by source value
 */
export function deepMerge<
    T extends Record<string, any>,
    U extends Record<string, any>,
>(target: T, source: U): T & U {
    if (!isObject(target) || !isObject(source)) return source as T & U;

    const out: Record<string, any> = {...target};
    for (const [key, value] of Object.entries(source)) {
        const existing = (out as any)[key];

        if (
            isObject(existing) &&
            isObject(value) &&
            !Array.isArray(existing) &&
            !Array.isArray(value)
        ) {
            out[key] = deepMerge(existing, value);
        } else {
            out[key] = value;
        }
    }
    return out as T & U;
}

function isObject(v: any): v is Record<string, any> {
    return v !== null && typeof v === 'object';
}

export function mergeConfig<T extends Record<string, any> | undefined>(
    current: T,
    patch: Record<string, any> | undefined,
): T {
    if (!patch || Object.keys(patch).length === 0) return current as T;
    return deepMerge(current ?? {}, patch) as T;
}
