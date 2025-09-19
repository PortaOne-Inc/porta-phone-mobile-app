// src/features/themes/features/splash-assets/splash-assets.service.ts
import * as admin from 'firebase-admin';
import {
    Injectable,
    NotFoundException,
    BadRequestException,
} from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';
import { FieldValue } from 'firebase-admin/firestore';

import { SplashAssetEntity, SplashMode } from './entities/splash-asset.entity';
import { UpsertSplashAssetDto } from './dto/upsert-splash-asset.dto';
import { ArtifactsService } from '../../../artifacts';
import { CloudFile } from '../../../../common/interceptors/cloud-functions-multipart.interceptor';
import { CloudStorageService } from '../../../common';
import { Collections, deepMerge, nowIso } from '../../../../common';

type GetOptions = {
    withValidation?: boolean;
    includeUrl?: boolean;
    urlTtlSec?: number;
    uid?: string;
};

type SplashValidationBlock = {
    compliant: boolean;
    deltaDp: number;
    message: string;
    toleranceDp?: number;
};
export type SplashValidationEnvelope = {
    mode: SplashMode;
    fullSizeDp: number;
    maskDiameterDp: number;
    recommendedPaddingDp: number;
    recommendationBasis: 'safeZone';
    validation: SplashValidationBlock;
};

export type SplashConstraintsDefaultsDto = {
    withBackground: {
        fullSizeDp: number;
        maskDiameterDp: number;
        toleranceDp: number;
    };
    withoutBackground: {
        fullSizeDp: number;
        maskDiameterDp: number;
        toleranceDp: number;
    };
};

type SplashOutputTarget = 'splash';

const ARTIFACT_KIND = 'splash-asset-output';
const ARTIFACT_TAG = 'splash-asset';
const FALLBACK_TOLERANCE_DP = 2;

function calcRecommended(full: number, mask: number) {
    return (full - mask) / 2;
}

function normalizeSlice(
    x?: Partial<{
        fullSizeDp: number;
        maskDiameterDp: number;
        toleranceDp: number;
    }>,
) {
    return x
        ? {
            fullSizeDp: typeof x.fullSizeDp === 'number' ? x.fullSizeDp : undefined,
            maskDiameterDp:
                typeof x.maskDiameterDp === 'number' ? x.maskDiameterDp : undefined,
            toleranceDp:
                typeof x.toleranceDp === 'number' ? x.toleranceDp : undefined,
        }
        : undefined;
}

@Injectable()
export class SplashAssetsService {
    constructor(
        @InjectRepository(SplashAssetEntity)
        private readonly repo: BaseFirestoreRepository<SplashAssetEntity>,
        private readonly artifacts: ArtifactsService,
        private readonly cloud: CloudStorageService,
    ) {
    }

    /** id is 1:1 with theme */
    private idFor(themeId: string) {
        return themeId;
    }

    /**
     * Load splash constraints from Firestore with sane fallbacks.
     * Reads `${Collections.config}/splashAssetsDefaults`.
     */
    async getConstraintsDefaults(): Promise<SplashConstraintsDefaultsDto> {
        const ref = admin
            .firestore()
            .collection(Collections.themeConfigsDefaults)
            .doc('splashAssetsDefaults');
        const snap = await ref.get();

        const fallback: SplashConstraintsDefaultsDto = {
            withBackground: {
                fullSizeDp: 240,
                maskDiameterDp: 160,
                toleranceDp: 240,
            },
            withoutBackground: {
                fullSizeDp: 288,
                maskDiameterDp: 192,
                toleranceDp: 288,
            },
        };

        if (!snap.exists) return fallback;

        const data = snap.data() as any;
        const c = (data?.constraints ?? {}) as {
            withBackground?: Partial<{
                fullSizeDp: number;
                maskDiameterDp: number;
                toleranceDp: number;
            }>;
            withoutBackground?: Partial<{
                fullSizeDp: number;
                maskDiameterDp: number;
                toleranceDp: number;
            }>;
        };

        const wb = normalizeSlice(c.withBackground);
        const wob = normalizeSlice(c.withoutBackground);

        return {
            withBackground: {...fallback.withBackground, ...(wb ?? {})},
            withoutBackground: {...fallback.withoutBackground, ...(wob ?? {})},
        };
    }

    /** Compute validation against default constraints. */
    private computeValidationFromDefaults(
        mode: SplashMode,
        params: SplashAssetEntity['params'] | undefined,
        defaults: SplashConstraintsDefaultsDto,
    ): SplashValidationEnvelope {
        const slice =
            mode === 'withoutBackground'
                ? defaults.withoutBackground
                : defaults.withBackground;
        const recommended = calcRecommended(slice.fullSizeDp, slice.maskDiameterDp);
        const actual = Number(
            (params as any)?.paddingDp ?? (params as any)?.padding ?? 0,
        );
        const tolerance =
            typeof slice.toleranceDp === 'number'
                ? slice.toleranceDp
                : FALLBACK_TOLERANCE_DP;
        const delta = Number((actual - recommended).toFixed(2));
        const compliant = Math.abs(delta) <= tolerance;

        return {
            mode,
            fullSizeDp: slice.fullSizeDp,
            maskDiameterDp: slice.maskDiameterDp,
            recommendedPaddingDp: recommended,
            recommendationBasis: 'safeZone',
            validation: {
                compliant,
                deltaDp: delta,
                message: compliant
                    ? 'padding matches recommended safe zone'
                    : `recommended ${recommended}dp, actual ${actual}dp ( ${delta}dp)`,
                toleranceDp: tolerance,
            },
        };
    }

    private async expandUrls(
        uid: string,
        entity: SplashAssetEntity,
        ttl?: number,
    ) {
        const outs = entity.outputsArtifacts ?? {};
        const ttlSec = ttl ?? 3600;
        const urls: Record<string, string | undefined> = {};

        if (outs.splashArtifactId) {
            try {
                const a = await this.artifacts.findOne(uid, outs.splashArtifactId, {}); // ownership check
                urls.splashUrl = a.storagePath
                    ? await this.cloud.getSignedUrl(a.storagePath, {ttlSec})
                    : undefined;
            } catch {
                // ignore
            }
        }
        return urls;
    }

    /**
     * Get splash asset config; optionally expand with URLs and validation.
     */
    async get(
        applicationId: string,
        themeId: string,
        opt?: GetOptions,
    ): Promise<
        | SplashAssetEntity
        | {
        entity: SplashAssetEntity;
        urls?: Record<string, string | undefined>;
        validation?: SplashValidationEnvelope;
    }
    > {
        const id = this.idFor(themeId);
        const found = await this.repo.findById(id).catch(() => null);
        if (!found || found.applicationId !== applicationId) {
            throw new NotFoundException('Splash asset config not found');
        }

        if (!opt?.withValidation && !opt?.includeUrl) return found;

        const ret: {
            entity: SplashAssetEntity;
            urls?: Record<string, string | undefined>;
            validation?: SplashValidationEnvelope;
        } = {entity: found};

        if (opt?.includeUrl && opt.uid)
            ret.urls = await this.expandUrls(opt.uid, found, opt.urlTtlSec);
        if (opt?.withValidation) {
            const defs = await this.getConstraintsDefaults();
            const mode: SplashMode = found.mode ?? 'withBackground';
            ret.validation = this.computeValidationFromDefaults(
                mode,
                found.params,
                defs,
            );
        }
        return ret;
    }

    /**
     * Multipart upsert + files (REPLACE behavior).
     */
    async upsertWithFiles(
        uid: string,
        applicationId: string,
        themeId: string,
        dto: UpsertSplashAssetDto,
        filesMap: Record<string, CloudFile[] | CloudFile | undefined>,
        targetsMap: Record<string, SplashOutputTarget>,
    ): Promise<SplashAssetEntity> {
        const id = this.idFor(themeId);
        const now = nowIso();

        let entity = await this.repo.findById(id).catch(() => null);
        if (entity && entity.applicationId !== applicationId) {
            throw new NotFoundException('Splash asset config not found');
        }
        if (!entity) {
            entity = {
                id,
                applicationId,
                themeId,
                source: {},
                params: {},
                mode: dto.mode ?? 'withBackground',
                outputsArtifacts: {},
                createdAt: now,
                updatedAt: now,
            };
        }

        // merge JSON
        if (dto.source) entity.source = deepMerge(entity.source ?? {}, dto.source);
        if (dto.params) entity.params = deepMerge(entity.params ?? {}, dto.params);
        if (dto.mode) entity.mode = dto.mode;
        entity.updatedAt = now;

        // collect files
        const allFiles: CloudFile[] = [];
        for (const v of Object.values(filesMap ?? {})) {
            if (!v) continue;
            if (Array.isArray(v)) allFiles.push(...v);
            else allFiles.push(v);
        }

        if (allFiles.length === 0) {
            await this.persist(entity);
            return await this.repo.findById(id);
        }

        // replace previous artifact
        const outs = entity.outputsArtifacts ?? {};
        if (outs.splashArtifactId) {
            await this.artifacts
                .remove(uid, outs.splashArtifactId)
                .catch(() => undefined);
        }

        // upload first file mapped to target="splash"
        const newOuts: { splashArtifactId?: string } = {};
        for (const [fieldName, target] of Object.entries(targetsMap ?? {})) {
            if (target !== 'splash') continue;
            const v = filesMap[fieldName];
            const file = Array.isArray(v) ? v?.[0] : v;
            if (!file && allFiles.length !== 1) continue;

            const chosen = (file ?? allFiles[0]) as CloudFile;

            const art = await this.artifacts.uploadAndCreate(
                uid,
                applicationId,
                themeId,
                ARTIFACT_KIND, // storage namespace/kind
                chosen as any,
                [{type: ARTIFACT_TAG, id: themeId}],
            );
            newOuts.splashArtifactId = art.id;
            break; // only one splash output
        }

        // fallback: no mapping but exactly one file
        if (!newOuts.splashArtifactId && allFiles.length === 1) {
            const art = await this.artifacts.uploadAndCreate(
                uid,
                applicationId,
                themeId,
                ARTIFACT_KIND,
                allFiles[0] as any,
                [{type: ARTIFACT_TAG, id: themeId}],
            );
            newOuts.splashArtifactId = art.id;
        }

        entity.outputsArtifacts = newOuts;
        entity.updatedAt = now;
        await this.persist(entity);

        return await this.repo.findById(id);
    }

    /** Remove splash config + its generated artifact (best-effort). */
    async remove(uid: string, applicationId: string, themeId: string) {
        const id = this.idFor(themeId);
        const found = await this.repo.findById(id).catch(() => null);
        if (!found || found.applicationId !== applicationId) {
            throw new NotFoundException('Splash asset config not found');
        }

        const outs = found.outputsArtifacts;
        if (outs?.splashArtifactId) {
            await this.artifacts
                .remove(uid, outs.splashArtifactId)
                .catch(() => undefined);
        }

        await this.repo.delete(id);
        return {ok: true};
    }

    /**
     * Upsert helper writing to Firestore via a controlled payload.
     * Uses `${Collections.splashAssets}/{themeId}` and deletes legacy fields if present.
     */
    private async persist(e: SplashAssetEntity) {
        const ref = admin
            .firestore()
            .collection(Collections.themeAssetsSplash)
            .doc(e.id);

        const payload: any = {
            ...e,
            asset: FieldValue.delete(),
            iconConstraints: FieldValue.delete(),
        };

        await ref.set(payload, {merge: true});
    }
}
