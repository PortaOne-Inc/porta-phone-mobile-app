import { resolveImageSourceUrlsDeep } from "./resolve-image-source-urls-deep";
import { AssetsService } from "../../features/assets/assets.service";

export async function resolveConfigImages(
    assets: AssetsService,
    applicationId: string,
    ttlSec: number,
    config?: Record<string, any>,
): Promise<Record<string, any> | undefined> {
    if (!config) return config;
    const resolveUrl = (id: string) =>
        assets.getSignedUrlByIdForApp(applicationId, id, ttlSec).catch(() => null);
    return resolveImageSourceUrlsDeep(config, resolveUrl);
}
