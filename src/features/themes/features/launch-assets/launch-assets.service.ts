import * as admin from 'firebase-admin';
import {
    BadRequestException,
    Injectable,
    NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';

import {
    UpsertLaunchAssetsDto,
    ValidationReportDto,
} from './dto/upsert-launch-assets.dto';
import {
    ConstraintsDefaultsDto,
    PlatformConstraintsDto,
} from './dto/defaults.dto';
import { LaunchAssetsEntity } from './entities/launch-asset.entity';
import { ArtifactsService } from '../../../artifacts';
import { CloudStorageService } from '../../../common';
import { Collections, deepMerge, nowIso } from '../../../../common';
import { CloudFile } from '../../../../common/interceptors/cloud-functions-multipart.interceptor';

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

@Injectable()
export class LaunchAssetsService {
    constructor(
        @InjectRepository(LaunchAssetsEntity)
        private readonly repo: BaseFirestoreRepository<LaunchAssetsEntity>,
        private readonly artifacts: ArtifactsService,
        private readonly cloud: CloudStorageService,
    ) {
    }

    async getConstraintsDefaults(): Promise<ConstraintsDefaultsDto> {
        const ref = admin
            .firestore()
            .collection(Collections.themeConfigsDefaults)
            .doc('launchAssetsDefaults');
        const snap = await ref.get();

        const fallback: ConstraintsDefaultsDto = {
            androidAdaptive: {sizeDp: 432, safeZoneDp: 324, toleranceDp: 432},
            androidLegacy: {sizeDp: 512, safeZoneDp: 384, toleranceDp: 512},
            ios: {sizeDp: 1024, safeZoneDp: 832, toleranceDp: 1024},
            web: {sizeDp: 512, safeZoneDp: 460.8, toleranceDp: 512},
        };

        if (!snap.exists) return fallback;

        const data = snap.data() as any;
        const c = (data?.constraints ?? {}) as ConstraintsDefaultsDto;

        const norm = (
            x?: PlatformConstraintsDto,
        ): PlatformConstraintsDto | undefined =>
            x
                ? {
                    sizeDp: typeof x.sizeDp === 'number' ? x.sizeDp : undefined,
                    safeZoneDp:
                        typeof x.safeZoneDp === 'number' ? x.safeZoneDp : undefined,
                    toleranceDp:
                        typeof x.toleranceDp === 'number' ? x.toleranceDp : undefined,
                }
                : undefined;

        return {
            androidAdaptive: {
                ...fallback.androidAdaptive!,
                ...norm(c.androidAdaptive),
            },
            androidLegacy: {...fallback.androidLegacy!, ...norm(c.androidLegacy)},
            ios: {...fallback.ios!, ...norm(c.ios)},
            web: {...fallback.web!, ...norm(c.web)},
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

        let validation: ValidationReportDto | undefined;
        if (opt?.withValidation) {
            const defs = await this.getConstraintsDefaults();
            validation = await this.computeValidation(entity, defs);
        }

        return {entity, urls, validation};
    }

    /**
     * JSON-only upsert with partial deep-merge of `source` and `params`.
     */
    async upsert(
        applicationId: string,
        themeId: string,
        dto: UpsertLaunchAssetsDto,
    ) {
        const id = this.idFor(themeId);
        const now = nowIso();

        const existing = await this.repo.findById(id).catch(() => null);
        if (existing) {
            if (existing.applicationId !== applicationId)
                throw new NotFoundException('Launch assets not found');

            const merged: LaunchAssetsEntity = {
                ...existing,
                source: deepMerge(existing.source ?? {}, dto.source ?? {}),
                params: deepMerge(existing.params ?? {}, dto.params ?? {}),
                updatedAt: now,
            };
            await this.repo.update(merged);
            return merged;
        }

        const created: LaunchAssetsEntity = {
            id,
            applicationId,
            themeId,
            source: dto.source ?? {},
            params: dto.params ?? {},
            outputsArtifacts: {},
            createdAt: now,
            updatedAt: now,
        };
        await this.repo.create(created);
        return created;
    }

    /**
     * Upsert JSON + optional replace of a single output by target.
     */
    async upsertWithOptionalFile(
        uid: string,
        applicationId: string,
        themeId: string,
        dto: UpsertLaunchAssetsDto,
        file?: CloudFile,
        target?: OutputTarget,
    ) {
        const id = this.idFor(themeId);
        const now = nowIso();

        let entity = await this.repo.findById(id).catch(() => null);
        if (entity && entity.applicationId !== applicationId)
            throw new NotFoundException('Launch assets not found');

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
            };
        }

        // JSON merge
        entity.source = deepMerge(entity.source ?? {}, dto.source ?? {});
        entity.params = deepMerge(entity.params ?? {}, dto.params ?? {});
        entity.updatedAt = now;

        if (!file) {
            await this.persist(entity);
            return entity;
        }
        if (!target)
            throw new BadRequestException(
                '`target` is required when uploading a file',
            );

        // Replace previous artifact for this target (if any)
        const prevId = this.pickArtifactIdByTarget(entity.outputsArtifacts, target);
        if (prevId) {
            await this.artifacts.remove(uid, prevId).catch(() => undefined);
        }

        // Upload a new artifact linked to this theme
        const art = await this.artifacts.uploadAndCreate(
            uid,
            applicationId,
            themeId,
            'launch-assets-output',
            file as any,
            [{type: 'launch-assets', id: themeId}],
        );

        const outsA = entity.outputsArtifacts ?? {};
        this.assignArtifactIdByTarget(outsA, target, art.id);
        entity.outputsArtifacts = outsA;

        entity.updatedAt = now;
        await this.persist(entity);
        return entity;
    }

    /**
     * Upsert JSON + batch replace of files for multiple targets.
     * If any files present: delete ALL previous artifacts and rebuild from current batch.
     */
    async upsertWithFiles(
        uid: string,
        applicationId: string,
        themeId: string,
        dto: UpsertLaunchAssetsDto,
        filesMap: Record<string, CloudFile[] | CloudFile | undefined>,
        targetsMap: Record<string, OutputTarget>,
    ) {
        const id = this.idFor(themeId);
        const now = nowIso();

        let entity = await this.repo.findById(id).catch(() => null);
        if (entity && entity.applicationId !== applicationId)
            throw new NotFoundException('Launch assets not found');

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
            };
        }

        // Merge JSON
        entity.source = deepMerge(entity.source ?? {}, dto.source ?? {});
        entity.params = deepMerge(entity.params ?? {}, dto.params ?? {});
        entity.updatedAt = now;

        // any file in the batch?
        const hasAnyFile = Object.values(filesMap ?? {}).some((v) =>
            Array.isArray(v) ? v.length > 0 : !!v,
        );
        if (!hasAnyFile) {
            await this.persist(entity);
            return entity;
        }

        // Hard REPLACE: delete all previous artifacts
        const oldIds = this.collectOutputArtifactIds(entity.outputsArtifacts);
        await Promise.all(
            oldIds.map((fid) =>
                this.artifacts.remove(uid, fid).catch(() => undefined),
            ),
        );

        // Rebuild outputs from the current batch
        const outsA: NonNullable<LaunchAssetsEntity['outputsArtifacts']> = {};
        const jobs: Array<Promise<void>> = [];

        for (const fieldName of Object.keys(filesMap ?? {})) {
            const target = targetsMap[fieldName];
            if (!target)
                throw new BadRequestException(
                    `Missing target mapping for field "${fieldName}"`,
                );

            const v = filesMap[fieldName];
            const files = Array.isArray(v) ? v : v ? [v] : [];
            if (!files.length) continue;

            const file = files[0];
            jobs.push(
                (async () => {
                    const art = await this.artifacts.uploadAndCreate(
                        uid,
                        applicationId,
                        themeId,
                        'launch-assets-output',
                        file as any,
                        [{type: 'launch-assets', id: themeId}],
                    );
                    this.assignArtifactIdByTarget(outsA, target, art.id);
                })(),
            );
        }

        await Promise.all(jobs);

        entity.outputsArtifacts = outsA;
        entity.updatedAt = now;

        await this.persist(entity);
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

    private pickArtifactIdByTarget(
        outs: LaunchAssetsEntity['outputsArtifacts'] | undefined,
        target: OutputTarget,
    ): string | undefined {
        if (!outs) return undefined;
        switch (target) {
            case 'androidLegacy':
                return outs.androidLegacyArtifactId;
            case 'androidAdaptiveForeground':
                return outs.androidAdaptiveForegroundArtifactId;
            case 'androidAdaptiveBackground':
                return outs.androidAdaptiveBackgroundArtifactId;
            case 'ios':
                return outs.iosArtifactId;
            case 'web':
                return outs.webArtifactId;
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
        _defaults: ConstraintsDefaultsDto,
    ): Promise<ValidationReportDto> {
        const ok = {compliant: true, deltaDp: 0};
        return {androidLegacy: ok, androidAdaptive: ok, ios: ok, web: ok};
    }
}
