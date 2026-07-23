import { WidgetVariant } from "../entities/widget-config.entity";

export type WidgetConfigId = string & { readonly __brand: 'WidgetConfigId' };

export function makeWidgetConfigId(themeId: string, variant: WidgetVariant): WidgetConfigId {
    return `${themeId}_${variant}` as WidgetConfigId;
}
