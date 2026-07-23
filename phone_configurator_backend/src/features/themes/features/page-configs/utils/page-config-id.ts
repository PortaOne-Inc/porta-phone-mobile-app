export type PageVariant = 'light' | 'dark';

export type PageConfigId = string & { readonly __brand: 'PageConfigId' };

export function makePageConfigId(themeId: string, variant: PageVariant): PageConfigId {
    return `${themeId}_${variant}` as PageConfigId;
}
