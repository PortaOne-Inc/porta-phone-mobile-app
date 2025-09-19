export type ResolveAssetUrlFn = (id: string) => Promise<string | null>;

type AnyObject = Record<string, any>;

type ImageSourceNode = {
    $ref?: string;
    id?: string | null;
    uri?: string | null;
    metadata?: Record<string, any> | null;
};

const isImageSource = (v: unknown): v is ImageSourceNode =>
    !!v &&
    typeof v === 'object' &&
    (v as any).$ref === 'asset' &&
    typeof (v as any).id === 'string' &&
    (v as any).id.length > 0;


export async function resolveImageSourceUrlsDeep<T = any>(
    input: T,
    resolveUrl: ResolveAssetUrlFn,
): Promise<T> {
    const matches: Array<{ path: (string | number)[]; id: string }> = [];
    const stack: Array<{ node: any; path: (string | number)[] }> = [
        {node: input, path: []},
    ];

    while (stack.length) {
        const {node, path} = stack.pop()!;
        if (isImageSource(node)) {
            matches.push({path, id: (node as ImageSourceNode).id!});
            continue;
        }
        if (Array.isArray(node)) {
            node.forEach((v, i) => stack.push({node: v, path: [...path, i]}));
        } else if (node && typeof node === 'object') {
            for (const k of Object.keys(node)) {
                stack.push({node: (node as AnyObject)[k], path: [...path, k]});
            }
        }
    }

    if (!matches.length) return input;

    const ids = [...new Set(matches.map((m) => m.id))];
    const urls = await Promise.all(ids.map((id) => resolveUrl(id)));
    const fresh = new Map<string, string | null>();
    ids.forEach((id, i) => fresh.set(id, urls[i] ?? null));

    const clone = structuredClone(input) as AnyObject;

    for (const {path, id} of matches) {
        let obj: any = clone;
        for (let i = 0; i < path.length - 1; i++) obj = obj[path[i]];

        const leaf = obj[path[path.length - 1]] as ImageSourceNode;
        const nextUri = fresh.get(id);

        obj[path[path.length - 1]] =
            nextUri != null ? {...leaf, uri: nextUri} : leaf;
    }

    return clone as T;
}
