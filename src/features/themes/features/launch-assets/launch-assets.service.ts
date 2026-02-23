import * as admin from 'firebase-admin';
import {
    BadRequestException,
    Injectable,
    Logger,
    NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';

import { LaunchAssetsEntity } from './entities/launch-asset.entity';
import { ArtifactsService } from '../../../artifacts';
import { CloudStorageService } from '../../../common';
import { Collections, deepMerge, nowIso } from '../../../../common';
import { CloudFile } from '../../../../common/interceptors/cloud-functions-multipart.interceptor';

import {
    ConstraintsDefaultsSchema,
    type ConstraintsDefaults,
    type UpsertLaunchAssets,
    type ValidationReport,
} from './dto/defaults.dto';

const trimVal = (v: any): any => {
    if (v == null) return v; // null/undefined
    if (typeof v === 'string') return v.length > 200 ? v.slice(0, 200) + '...' : v;
    if (Array.isArray(v)) {
        const arr = v.slice(0, 20).map(trimVal);
        return v.length > 20 ? [...arr, `+${v.length - 20} more`] : arr;
    }
    if (typeof v === 'object') {
        const out: any = {};
        const entries = Object.entries(v);
        for (const [k, val] of entries.slice(0, 50)) out[k] = trimVal(val);
        if (entries.length > 50) out.__more__ = `+${entries.length - 50} keys`;
        return out;
    }
    return v;
};

const safeJ = (x: any) => JSON.stringify(trimVal(x));

export type OutputTarget =
    | 'androidLegacy'
    | 'androidAdaptiveForeground'
    | 'androidAdaptiveBackground'
    | 'ios'
    | 'web';

type GetOptions = {
    includeUrl?: boolean;
    urlTtlSec?: number;
    withValidation?: boolean;
};

const ASSET_URL_TTL_SEC = 3600; // 1h

// ---- helpers ----
const stripNulls = <T>(obj: T): T =>
    JSON.parse(
        JSON.stringify(obj, (_k, v) => (v === null ? undefined : v)),
    );

@Injectable()
export class LaunchAssetsService {
    private readonly logger = new Logger(LaunchAssetsService.name);

    constructor(
        @InjectRepository(LaunchAssetsEntity)
        private readonly repo: BaseFirestoreRepository<LaunchAssetsEntity>,
        private readonly artifacts: ArtifactsService,
        private readonly cloud: CloudStorageService,
    ) {
    }

    async getConstraintsDefaults(): Promise<ConstraintsDefaults> {
        const ref = admin
            .firestore()
            .collection(Collections.themeConfigsDefaults)
            .doc('launchAssetsDefaults');
        const snap = await ref.get();

        const fallback: ConstraintsDefaults = {
            androidAdaptive: {sizeDp: 432, safeZoneDp: 264, toleranceDp: 4},
            androidLegacy: {sizeDp: 512, safeZoneDp: 384, toleranceDp: 4},
            ios: {sizeDp: 1024, safeZoneDp: 832, toleranceDp: 4},
            web: {sizeDp: 512, safeZoneDp: 460.8, toleranceDp: 4},
        };

        if (!snap.exists) return fallback;

        const raw = (snap.data()?.constraints ?? {}) as unknown;
        const parsed = ConstraintsDefaultsSchema.safeParse(raw);
        if (!parsed.success) {
            this.logger.warn(
                `getConstraintsDefaults: zod_parse_failed: ${parsed.error.message}`,
            );
            return fallback;
        }

        return {
            androidAdaptive: {
                ...fallback.androidAdaptive,
                ...parsed.data.androidAdaptive,
            },
            androidLegacy: {
                ...fallback.androidLegacy,
                ...parsed.data.androidLegacy,
            },
            ios: {...fallback.ios, ...parsed.data.ios},
            web: {...fallback.web, ...parsed.data.web},
        };
    }

    // ---------- CRUD / flows ----------

    private idFor(themeId: string) {
        return themeId; // 1:1 with theme
    }

    /**
     * Fetch entity by (applicationId, themeId). Optionally expands signed URLs and validation.
     */
    async get(
        uid: string,
        applicationId: string,
        themeId: string,
        opt?: GetOptions,
    ) {
        const id = this.idFor(themeId);
        const entity = await this.repo.findById(id).catch(() => null);
        if (!entity || entity.applicationId !== applicationId) {
            throw new NotFoundException('Launch assets not found');
        }

        if (!opt?.includeUrl && !opt?.withValidation) return entity;

        const urls = opt?.includeUrl
            ? await this.expandUrls(uid, entity, opt?.urlTtlSec)
            : undefined;

        let validation: ValidationReport | undefined;
        if (opt?.withValidation) {
            const defs = await this.getConstraintsDefaults();
            validation = await this.computeValidation(entity, defs);
        }

        return {entity, urls, validation};
    }

    async upsertWithFiles(
        uid: string,
        applicationId: string,
        themeId: string,
        dto: UpsertLaunchAssets,
        filesMap: Record<string, CloudFile[] | CloudFile | undefined>,
        targetsMap: Record<string, OutputTarget>,
    ) {
        const started = Date.now();
        const opId = `${Date.now().toString(36)}-${Math.random()
            .toString(36)
            .slice(2, 8)}`;
        const ctx = (extra: Record<string, unknown> = {}) =>
            JSON.stringify({opId, uid, applicationId, themeId, ...extra});

        this.logger.log(
            `LaunchAssetsService.upsertWithFiles:start ${ctx({
                dtoKeys: Object.keys(dto ?? {}),
                fileFields: Object.keys(filesMap ?? {}),
                targetFields: Object.keys(targetsMap ?? {}),
            })}`,
        );

        const id = this.idFor(themeId);
        const now = nowIso();

        let entity = await this.repo.findById(id).catch(() => null);
        this.logger.log(
            `LaunchAssetsService.upsertWithFiles:entity:${
                entity ? 'exists' : 'new'
            } ${ctx({
                entityId: id,
                hasOutputs: !!entity?.outputsArtifacts,
            })}`,
        );

        if (entity && entity.applicationId !== applicationId) {
            this.logger.warn(
                `LaunchAssetsService.upsertWithFiles:app_mismatch ${ctx({
                    entityAppId: entity.applicationId,
                    reqAppId: applicationId,
                })}`,
            );
            throw new NotFoundException('Launch assets not found');
        }

        if (!entity) {
            entity = {
                id,
                applicationId,
                themeId,
                source: {},
                params: {},
                outputsArtifacts: {},
                createdAt: now,
                updatedAt: now,
            } as LaunchAssetsEntity;
        }

        const before = {
            sourceKeys: Object.keys(entity.source ?? {}),
            paramsKeys: Object.keys(entity.params ?? {}),
        };

        entity.source = stripNulls(
            deepMerge(stripNulls(entity.source ?? {}), dto.source ?? {}),
        );
        entity.params = stripNulls(
            deepMerge(stripNulls(entity.params ?? {}), dto.params ?? {}),
        );
        entity.updatedAt = now;

        this.logger.log(
            `LaunchAssetsService.upsertWithFiles:state_after_merge ${ctx({
                source: JSON.parse(safeJ(entity.source)),
                params: JSON.parse(safeJ(entity.params)),
            })}`,
        );
        this.logger.log(
            `LaunchAssetsService.upsertWithFiles:merged ${ctx({
                before,
                after: {
                    sourceKeys: Object.keys(entity.source ?? {}),
                    paramsKeys: Object.keys(entity.params ?? {}),
                },
                sample: {
                    sourceBackgroundHex: (entity.source as any)?.backgroundColorHex ?? null,
                    androidLegacyPadding: (entity.params as any)?.androidLegacy?.paddingDp ?? null,
                },
            })}`,
        );

        const hasAnyFile = Object.values(filesMap ?? {}).some((v) =>
            Array.isArray(v) ? v.length > 0 : !!v,
        );
        this.logger.log(
            `LaunchAssetsService.upsertWithFiles:files_presence ${ctx({hasAnyFile})}`,
        );

        if (!hasAnyFile) {
            this.logger.log(
                `LaunchAssetsService.upsertWithFiles:persist_only ${ctx({entityId: id})}`,
            );
            try {
                this.logger.log(
                    `LaunchAssetsService.upsertWithFiles:persist:start ${JSON.stringify({
                        opId,
                        entityId: id,
                        outputsArtifacts: entity.outputsArtifacts,
                    })}`,
                );
                await this.persist(entity);
                this.logger.log(
                    `LaunchAssetsService.upsertWithFiles:persist:ok ${JSON.stringify({
                        opId,
                        entityId: id,
                    })}`,
                );
            } catch (e: any) {
                this.logger.error(
                    `LaunchAssetsService.upsertWithFiles:persist:error ${JSON.stringify({
                        opId,
                        entityId: id,
                        message: e?.message,
                        name: e?.name,
                        code: e?.code,
                        status: e?.status || e?.response?.status,
                        responseData: e?.response?.data,
                        details: e?.details,
                        errors: e?.errors,
                        snapshot: {
                            id: entity.id,
                            applicationId: entity.applicationId,
                            themeId: entity.themeId,
                            sourceKeys: Object.keys(entity.source ?? {}),
                            paramsKeys: Object.keys(entity.params ?? {}),
                            outputsKeys: Object.keys(entity.outputsArtifacts ?? {}),
                        },
                    })}`,
                    e?.stack,
                );
                throw e;
            }
            return entity;
        }

        const oldIds = this.collectOutputArtifactIds(entity.outputsArtifacts);
        this.logger.log(
            `LaunchAssetsService.upsertWithFiles:remove_old:start ${ctx({
                count: oldIds.length,
                oldIds,
            })}`,
        );
        await Promise.all(
            oldIds.map(async (fid) => {
                try {
                    await this.artifacts.remove(uid, fid);
                    this.logger.log(
                        `LaunchAssetsService.upsertWithFiles:remove_old:ok ${ctx({fid})}`,
                    );
                } catch (e: any) {
                    this.logger.warn(
                        `LaunchAssetsService.upsertWithFiles:remove_old:failed ${ctx({
                            fid,
                            message: e?.message,
                        })}`,
                    );
                }
            }),
        );

        const outsA: NonNullable<LaunchAssetsEntity['outputsArtifacts']> = {};
        const uploadErrors: Array<{ target: string; fieldName: string; message: string }> = [];
        const jobs: Array<Promise<void>> = [];

        for (const fieldName of Object.keys(filesMap ?? {})) {
            const target = targetsMap[fieldName];
            if (!target) {
                this.logger.error(
                    `LaunchAssetsService.upsertWithFiles:missing_target ${ctx({fieldName})}`,
                );
                throw new BadRequestException(
                    `Missing target mapping for field "${fieldName}"`,
                );
            }

            const v = filesMap[fieldName];
            const files = Array.isArray(v) ? v : v ? [v] : [];
            if (!files.length) {
                this.logger.log(
                    `LaunchAssetsService.upsertWithFiles:field_no_files ${ctx({fieldName})}`,
                );
                continue;
            }

            const file = files[0];
            const fsize =
                (file as any)?.buffer?.length ?? (file as any)?.size ?? undefined;

            this.logger.log(
                `LaunchAssetsService.upsertWithFiles:upload:start ${ctx({
                    fieldName,
                    target,
                    fsize,
                })}`,
            );

            jobs.push(
                (async () => {
                    try {
                        const art = await this.artifacts.uploadAndCreate(
                            uid,
                            applicationId,
                            themeId,
                            'launch-assets-output',
                            file as any,
                            [{type: 'launch-assets', id: themeId}],
                        );
                        this.assignArtifactIdByTarget(outsA, target, art.id);

                        this.logger.log(
                            `LaunchAssetsService.upsertWithFiles:upload:ok ${ctx({
                                fieldName,
                                target,
                                artifactId: art.id,
                            })}`,
                        );
                    } catch (e: any) {
                        this.logger.error(
                            `LaunchAssetsService.upsertWithFiles:upload:error ${ctx({
                                fieldName,
                                target,
                                message: e?.message,
                                code: e?.code,
                                status: e?.status || e?.response?.status,
                            })}`,
                            e?.stack,
                        );
                        uploadErrors.push({ target, fieldName, message: e?.message });
                    }
                })(),
            );
        }

        await Promise.all(jobs);
        if (uploadErrors.length) {
            throw new BadRequestException(
                `${uploadErrors.length} platform upload(s) failed: ${uploadErrors.map((e) => e.target).join(', ')}. Entity not saved to prevent partial state.`,
            );
        }
        this.logger.log(
            `LaunchAssetsService.upsertWithFiles:uploads_done ${ctx({
                mappedTargets: outsA,
            })}`,
        );

        entity.outputsArtifacts = outsA;
        entity.updatedAt = now;

        try {
            this.logger.log(
                `LaunchAssetsService.upsertWithFiles:persist:start ${ctx({
                    entityId: id,
                    source: entity.source,
                    params: entity.params,
                    outputsArtifacts: entity.outputsArtifacts,
                })}`,
            );
            await this.persist(entity);
            this.logger.log(
                `LaunchAssetsService.upsertWithFiles:persist:ok ${ctx({entityId: id})}`,
            );
        } catch (e: any) {
            const errDump = {
                name: e?.name,
                message: e?.message,
                code: e?.code,
                status: e?.status || e?.response?.status,
                responseData: e?.response?.data,
                details: e?.details,
                errors: e?.errors,
                toString: String(e),
                keys: Object.getOwnPropertyNames(e ?? {}).reduce((acc, k) => {
                    (acc as any)[k] = (e as any)[k];
                    return acc;
                }, {} as Record<string, unknown>),
            };

            const bad = this.findFirstUnsupportedValue(entity);
            this.logger.error(
                `LaunchAssetsService.upsertWithFiles:persist:error ${ctx({
                    entityId: id,
                    error: errDump,
                    snapshot: {
                        source: entity.source,
                        params: entity.params,
                        outputsArtifacts: entity.outputsArtifacts,
                    },
                    firstUnsupportedValue: bad,
                })}`,
                e?.stack,
            );
            throw e;
        }

        this.logger.log(
            `LaunchAssetsService.upsertWithFiles:done ${ctx({
                entityId: id,
                totalMs: Date.now() - started,
                outputsArtifacts: entity.outputsArtifacts,
            })}`,
        );

        return entity;
    }

    /**
     * Delete config + all produced artifacts (best-effort).
     */
    async remove(uid: string, applicationId: string, themeId: string) {
        const id = this.idFor(themeId);
        const entity = await this.repo.findById(id).catch(() => null);
        if (!entity || entity.applicationId !== applicationId) {
            throw new NotFoundException('Launch assets not found');
        }

        const oldIds = this.collectOutputArtifactIds(entity.outputsArtifacts);
        await Promise.all(
            oldIds.map((fid) =>
                this.artifacts.remove(uid, fid).catch(() => undefined),
            ),
        );

        await this.repo.delete(id);
        return {ok: true};
    }

    // ---------- helpers ----------

    private async persist(e: LaunchAssetsEntity) {
        e.source = stripNulls(e.source ?? {});
        e.params = stripNulls(e.params ?? {});
        e.outputsArtifacts = stripNulls(e.outputsArtifacts ?? {});

        const exists = await this.repo.findById(e.id).catch(() => null);
        if (exists) return this.repo.update(e);
        return this.repo.create(e);
    }

    private assignArtifactIdByTarget(
        outs: NonNullable<LaunchAssetsEntity['outputsArtifacts']>,
        target: OutputTarget,
        artifactId: string,
    ) {
        switch (target) {
            case 'androidLegacy':
                outs.androidLegacyArtifactId = artifactId;
                break;
            case 'androidAdaptiveForeground':
                outs.androidAdaptiveForegroundArtifactId = artifactId;
                break;
            case 'androidAdaptiveBackground':
                outs.androidAdaptiveBackgroundArtifactId = artifactId;
                break;
            case 'ios':
                outs.iosArtifactId = artifactId;
                break;
            case 'web':
                outs.webArtifactId = artifactId;
                break;
        }
    }

    private collectOutputArtifactIds(
        outs?: LaunchAssetsEntity['outputsArtifacts'],
    ): string[] {
        if (!outs) return [];
        const ids = [
            outs.androidLegacyArtifactId,
            outs.androidAdaptiveForegroundArtifactId,
            outs.androidAdaptiveBackgroundArtifactId,
            outs.iosArtifactId,
            outs.webArtifactId,
        ].filter(Boolean) as string[];
        return Array.from(new Set(ids));
    }

    private async expandUrls(
        uid: string,
        entity: LaunchAssetsEntity,
        ttl?: number,
    ) {
        const outsA = entity.outputsArtifacts ?? {};
        const ttlSec = ttl ?? ASSET_URL_TTL_SEC;
        const urls: Record<string, string | undefined> = {};
        const jobs: Array<Promise<void>> = [];

        const attach = (key: keyof typeof outsA, outName: string) => {
            const id = outsA[key];
            if (!id) return;
            jobs.push(
                this.artifacts
                    .findOne(uid, id, {})
                    .then((a) =>
                        a.storagePath
                            ? this.cloud.getSignedUrl(a.storagePath!, {ttlSec})
                            : undefined,
                    )
                    .then((url) => (urls[outName] = url))
                    .catch(() => undefined),
            );
        };

        attach('androidLegacyArtifactId', 'androidLegacyUrl');
        attach(
            'androidAdaptiveForegroundArtifactId',
            'androidAdaptiveForegroundUrl',
        );
        attach(
            'androidAdaptiveBackgroundArtifactId',
            'androidAdaptiveBackgroundUrl',
        );
        attach('iosArtifactId', 'iosUrl');
        attach('webArtifactId', 'webUrl');

        await Promise.all(jobs);
        return urls;
    }

    /**
     * Placeholder validation against default constraints (by platform).
     */
    private async computeValidation(
        _entity: LaunchAssetsEntity,
        _defaults: ConstraintsDefaults,
    ): Promise<ValidationReport> {
        const ok = {compliant: true, deltaDp: 0};
        return {androidLegacy: ok, androidAdaptive: ok, ios: ok, web: ok};
    }

    private findFirstUnsupportedValue(obj: unknown, path: string = ''): any {
        const isBadNum = (n: number) => Number.isNaN(n) || !Number.isFinite(n);
        const bad = (v: any) =>
            v === undefined ||
            typeof v === 'function' ||
            typeof v === 'bigint' ||
            (typeof v === 'number' && isBadNum(v));

        if (bad(obj)) return {path, value: obj};

        if (obj && typeof obj === 'object') {
            if (Array.isArray(obj)) {
                for (let i = 0; i < obj.length; i++) {
                    const r = this.findFirstUnsupportedValue(obj[i], `${path}[${i}]`);
                    if (r) return r;
                }
            } else {
                for (const [k, v] of Object.entries(obj as Record<string, unknown>)) {
                    const r = this.findFirstUnsupportedValue(v, path ? `${path}.${k}` : k);
                    if (r) return r;
                }
            }
        }
        return null;
    }
}

