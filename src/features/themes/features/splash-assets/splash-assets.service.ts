// src/features/themes/features/splash-assets/splash-assets.service.ts
import * as admin from 'firebase-admin';
import {
    Injectable,
    NotFoundException,
    BadRequestException, Logger,
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
    circleDiameterDp?: number;
    recommendedPaddingDp: number;
    recommendationBasis: 'safeZone';
    validation: SplashValidationBlock;
};

type ConstraintsSlice = {
    fullSizeDp: number;
    maskDiameterDp: number;
    circleDiameterDp?: number;
    toleranceDp: number;
};

export type SplashConstraintsDefaultsDto = {
    withBackground: ConstraintsSlice;
    withoutBackground: ConstraintsSlice;
    android12?: ConstraintsSlice;
};

type SplashOutputTarget = 'splash' | 'android12Splash';

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
        circleDiameterDp: number;
        toleranceDp: number;
    }>,
) {
    return x
        ? {
            fullSizeDp: typeof x.fullSizeDp === 'number' ? x.fullSizeDp : undefined,
            maskDiameterDp:
                typeof x.maskDiameterDp === 'number' ? x.maskDiameterDp : undefined,
            circleDiameterDp:
                typeof x.circleDiameterDp === 'number' ? x.circleDiameterDp : undefined,
            toleranceDp:
                typeof x.toleranceDp === 'number' ? x.toleranceDp : undefined,
        }
        : undefined;
}

@Injectable()
export class SplashAssetsService {
    private readonly logger = new Logger(SplashAssetsService.name);

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
                maskDiameterDp: 113,
                circleDiameterDp: 160,
                toleranceDp: 4,
            },
            withoutBackground: {
                fullSizeDp: 288,
                maskDiameterDp: 135,
                circleDiameterDp: 192,
                toleranceDp: 4,
            },
            android12: {
                fullSizeDp: 288,
                maskDiameterDp: 135,
                circleDiameterDp: 192,
                toleranceDp: 4,
            },
        };

        if (!snap.exists) return fallback;

        const data = snap.data() as any;
        const c = (data?.constraints ?? {}) as {
            withBackground?: Partial<ConstraintsSlice>;
            withoutBackground?: Partial<ConstraintsSlice>;
            android12?: Partial<ConstraintsSlice>;
        };

        const wb = normalizeSlice(c.withBackground);
        const wob = normalizeSlice(c.withoutBackground);
        const a12 = normalizeSlice(c.android12);

        return {
            withBackground: {...fallback.withBackground, ...(wb ?? {})},
            withoutBackground: {...fallback.withoutBackground, ...(wob ?? {})},
            android12: {...fallback.android12!, ...(a12 ?? {})},
        };
    }

    /** Validate params against a single constraints slice. */
    private validateSlice(
        mode: SplashMode,
        slice: ConstraintsSlice,
        params: SplashAssetEntity['params'] | undefined,
    ): SplashValidationEnvelope {
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
            ...(slice.circleDiameterDp != null ? { circleDiameterDp: slice.circleDiameterDp } : {}),
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

    /** Compute validation against default constraints for main splash and android12. */
    private computeValidationFromDefaults(
        mode: SplashMode,
        params: SplashAssetEntity['params'] | undefined,
        defaults: SplashConstraintsDefaultsDto,
    ): { validation: SplashValidationEnvelope; android12Validation?: SplashValidationEnvelope } {
        const mainSlice =
            mode === 'withoutBackground'
                ? defaults.withoutBackground
                : defaults.withBackground;

        const result: { validation: SplashValidationEnvelope; android12Validation?: SplashValidationEnvelope } = {
            validation: this.validateSlice(mode, mainSlice, params),
        };

        if (defaults.android12) {
            result.android12Validation = this.validateSlice(mode, defaults.android12, params);
        }

        return result;
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
        if (outs.android12SplashArtifactId) {
            try {
                const a = await this.artifacts.findOne(uid, outs.android12SplashArtifactId, {});
                urls.android12SplashUrl = a.storagePath
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
        android12Validation?: SplashValidationEnvelope;
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
            android12Validation?: SplashValidationEnvelope;
        } = {entity: found};

        if (opt?.includeUrl && opt.uid)
            ret.urls = await this.expandUrls(opt.uid, found, opt.urlTtlSec);
        if (opt?.withValidation) {
            const defs = await this.getConstraintsDefaults();
            const mode: SplashMode = found.mode ?? 'withBackground';
            const { validation, android12Validation } = this.computeValidationFromDefaults(
                mode,
                found.params,
                defs,
            );
            ret.validation = validation;
            ret.android12Validation = android12Validation;
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
        const started = Date.now();
        const logCtx = (extra: Record<string, unknown> = {}) =>
            JSON.stringify({ uid, applicationId, themeId, ...extra });

        this.logger.log(`upsertWithFiles:start ${logCtx({
            dtoKeys: Object.keys(dto ?? {}),
            targetFields: Object.keys(targetsMap ?? {}),
            fileFields: Object.keys(filesMap ?? {}),
        })}`);

        const id = this.idFor(themeId);
        const now = nowIso();

        let entity = await this.repo.findById(id).catch(() => null);
        this.logger.log(
            `entity:${entity ? 'exists' : 'not_found'} ${logCtx({
                entityId: id,
                hasOutputs: !!entity?.outputsArtifacts,
            })}`,
        );

        if (entity && entity.applicationId !== applicationId) {
            this.logger.warn(
                `entity:app_mismatch ${logCtx({
                    entityApp: entity.applicationId,
                    reqApp: applicationId,
                })}`,
            );
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
            this.logger.log(`entity:created_in_memory ${logCtx({ entityId: id, mode: entity.mode })}`);
        }

        // merge JSON
        const before = {
            sourceKeys: Object.keys(entity.source ?? {}),
            paramsKeys: Object.keys(entity.params ?? {}),
            mode: entity.mode,
        };
        if (dto.source) entity.source = deepMerge(entity.source ?? {}, dto.source);
        if (dto.params) entity.params = deepMerge(entity.params ?? {}, dto.params);
        if (dto.mode) entity.mode = dto.mode;
        entity.updatedAt = now;

        this.logger.log(
            `entity:merged ${logCtx({
                before,
                after: {
                    sourceKeys: Object.keys(entity.source ?? {}),
                    paramsKeys: Object.keys(entity.params ?? {}),
                    mode: entity.mode,
                },
            })}`,
        );

        // collect files
        const allFiles: CloudFile[] = [];
        for (const v of Object.values(filesMap ?? {})) {
            if (!v) continue;
            if (Array.isArray(v)) allFiles.push(...v);
            else allFiles.push(v);
        }
        this.logger.log(
            `files:collected ${logCtx({
                totalFiles: allFiles.length,
                targetMap: targetsMap,
            })}`,
        );

        if (allFiles.length === 0) {
            this.logger.log(`files:none -> persist_only ${logCtx({ entityId: id })}`);
            await this.persist(entity);
            const fresh = await this.repo.findById(id);
            this.logger.log(
                `upsertWithFiles:done:no_files ${logCtx({ entityId: id, ms: Date.now() - started })}`,
            );


            return fresh;
        }

        // replace previous artifacts
        const outs = entity.outputsArtifacts ?? {};
        const oldArtifactIds = [outs.splashArtifactId, outs.android12SplashArtifactId].filter(Boolean) as string[];
        const removalErrors: Array<{ id: string; message: string }> = [];
        for (const oldId of oldArtifactIds) {
            this.logger.log(
                `artifact:remove:attempt ${logCtx({ oldArtifactId: oldId })}`,
            );
            try {
                await this.artifacts.remove(uid, oldId);
                this.logger.log(
                    `artifact:remove:ok ${logCtx({ oldArtifactId: oldId })}`,
                );
            } catch (e: any) {
                this.logger.warn(
                    `artifact:remove:failed ${logCtx({ oldArtifactId: oldId, error: e?.message })}`,
                );
                removalErrors.push({ id: oldId, message: e?.message });
            }
        }
        if (removalErrors.length) {
            throw new BadRequestException(
                `Failed to remove ${removalErrors.length} old artifact(s): ${removalErrors.map((r) => r.id).join(', ')}. Aborting to prevent orphaned files.`,
            );
        }
        if (oldArtifactIds.length === 0) {
            this.logger.log(`artifact:remove:skip ${logCtx({ reason: 'no_previous_artifacts' })}`);
        }

        // upload files mapped to targets
        const newOuts: { splashArtifactId?: string; android12SplashArtifactId?: string } = {};
        const targetKeys: Array<{ target: SplashOutputTarget; field: keyof typeof newOuts }> = [
            { target: 'splash', field: 'splashArtifactId' },
            { target: 'android12Splash', field: 'android12SplashArtifactId' },
        ];

        for (const { target, field } of targetKeys) {
            for (const [fieldName, t] of Object.entries(targetsMap ?? {})) {
                if (t !== target) continue;
                const v = filesMap[fieldName];
                const file = Array.isArray(v) ? v?.[0] : v;
                if (!file) {
                    this.logger.log(
                        `target:${target}:skip_field ${logCtx({ fieldName, reason: 'no_file_for_field' })}`,
                    );
                    continue;
                }

                const size = (file as any)?.buffer?.length ?? (file as any)?.size ?? undefined;
                this.logger.log(
                    `artifact:upload:start ${logCtx({ fieldName, target, size })}`,
                );

                const art = await this.artifacts.uploadAndCreate(
                    uid,
                    applicationId,
                    themeId,
                    ARTIFACT_KIND,
                    file as any,
                    [{ type: ARTIFACT_TAG, id: themeId }],
                );

                this.logger.log(
                    `artifact:upload:ok ${logCtx({
                        target,
                        artifactId: art.id,
                        storagePath: art.storagePath,
                        mimeType: art.mimeType,
                        bytes: art.size,
                    })}`,
                );
                newOuts[field] = art.id;
                break; // one file per target
            }
        }

        // fallback: no mapping but exactly one file → treat as splash
        if (!newOuts.splashArtifactId && allFiles.length === 1) {
            const chosen = allFiles[0];
            const size = (chosen as any)?.buffer?.length ?? (chosen as any)?.size ?? undefined;
            this.logger.log(
                `artifact:fallback_upload:start ${logCtx({ reason: 'single_file', size })}`,
            );

            const art = await this.artifacts.uploadAndCreate(
                uid,
                applicationId,
                themeId,
                ARTIFACT_KIND,
                chosen as any,
                [{ type: ARTIFACT_TAG, id: themeId }],
            );

            this.logger.log(
                `artifact:fallback_upload:ok ${logCtx({
                    artifactId: art.id,
                    storagePath: art.storagePath,
                    mimeType: art.mimeType,
                    bytes: art.size,
                })}`,
            );

            newOuts.splashArtifactId = art.id;
        }

        if (!newOuts.splashArtifactId) {
            this.logger.warn(
                `artifact:missing_after_uploads ${logCtx({
                    totalFiles: allFiles.length,
                    targets: targetsMap,
                })}`,
            );
        }

        entity.outputsArtifacts = newOuts;
        entity.updatedAt = now;

        this.logger.log(
            `entity:persist:start ${logCtx({
                entityId: id,
                splashArtifactId: newOuts.splashArtifactId ?? null,
            })}`,
        );
        await this.persist(entity);
        this.logger.log(
            `entity:persist:ok ${logCtx({ entityId: id })}`,
        );

        const result = await this.repo.findById(id);
        this.logger.log(
            `upsertWithFiles:done ${logCtx({
                entityId: id,
                splashArtifactId: result.outputsArtifacts?.splashArtifactId ?? null,
                ms: Date.now() - started,
            })}`,
        );

        return result;
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
        if (outs?.android12SplashArtifactId) {
            await this.artifacts
                .remove(uid, outs.android12SplashArtifactId)
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
