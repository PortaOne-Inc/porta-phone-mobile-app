import {
  ConflictException,
  Injectable,
  BadRequestException,
  NotFoundException,
} from '@nestjs/common';
import * as admin from 'firebase-admin';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';
import { Application } from './entities/application';
import { Theme } from '../themes/entities/theme';
import { UpdateThemeBindingsDto } from './dto/applications.dto';
import { Collections } from '../../common';
import { OwnershipService } from '../../common/data/ownership.service';
import { ThemesService } from '../themes/themes.service';

type Env = 'dev' | 'stage' | 'prod';

@Injectable()
export class ApplicationsService {
  constructor(
    @InjectRepository(Application)
    private readonly applicationRepository: BaseFirestoreRepository<Application>,
    @InjectRepository(Theme)
    private readonly themeRepository: BaseFirestoreRepository<Theme>,
    private readonly ownership: OwnershipService,
    private readonly themesService: ThemesService,
  ) {}

  async createApplication(
    userId: string,
    applicationDto: Application,
  ): Promise<Application> {
    return this.applicationRepository.create({
      ...applicationDto,
      user: userId,
    });
  }

  async findApplicationById(uid: string, id: string): Promise<Application> {
    return this.ownership.assertOwnsApplication(uid, id);
  }

  async updateApplication(
    uid: string,
    id: string,
    applicationDto: Application & { expectedVersion?: number },
  ): Promise<Application> {
    await this.ownership.assertOwnsApplication(uid, id);
    // id, user (the owner) and version are immutable through this endpoint.
    const {
      id: _id,
      user: _user,
      version: _version,
      expectedVersion,
      ...updatable
    } = applicationDto;
    return this.transactionalUpdate(id, expectedVersion, (current) =>
      Object.assign(current, updatable),
    );
  }

  /**
   * Deletes the application together with its themes. Theme cleanup is
   * best-effort: a theme that fails to delete must not leave the
   * application itself undeletable.
   */
  async removeApplication(uid: string, id: string): Promise<void> {
    await this.ownership.assertOwnsApplication(uid, id);
    const themes = await this.themeRepository
      .whereEqualTo('applicationId', id)
      .find()
      .catch(() => [] as Theme[]);
    for (const theme of themes) {
      await this.themesService
        .deleteTheme(uid, id, theme.id, { purgeOrphanAssets: true })
        .catch(() => undefined);
    }
    await this.applicationRepository.delete(id);
  }

  async listApplications(userId: string): Promise<Application[]> {
    return this.applicationRepository.whereEqualTo('user', userId).find();
  }

  async getApplicationEnvironment(
    uid: string,
    id: string,
  ): Promise<Record<string, string | boolean | number>> {
    const application = await this.ownership.assertOwnsApplication(uid, id);
    return application.environment || {};
  }

  async updateApplicationEnvironment(
    uid: string,
    id: string,
    environmentData: Record<string, string | boolean | number>,
    expectedVersion?: number,
  ): Promise<Application> {
    await this.ownership.assertOwnsApplication(uid, id);
    return this.transactionalUpdate(id, expectedVersion, (current) => {
      current.environment = {
        ...current.environment,
        ...environmentData,
      };
      return current;
    });
  }

  async updateThemeBindings(
    uid: string,
    appId: string,
    dto: UpdateThemeBindingsDto,
  ) {
    const app = await this.ownership.assertOwnsApplication(uid, appId);

    const candidateIds = [
      dto.defaultThemeId,
      ...Object.values(dto.themeByEnv ?? {}),
    ].filter(Boolean) as string[];

    if (candidateIds.length) {
      const owned = await this.themeRepository
        .whereEqualTo('applicationId', appId)
        .find();

      const ownedSet = new Set(owned.map((t) => t.id));
      const notOwned = candidateIds.filter((id) => !ownedSet.has(id));

      if (notOwned.length) {
        throw new BadRequestException(
          `Themes not owned by application: ${notOwned.join(', ')}`,
        );
      }
    }

    return this.transactionalUpdate(appId, dto.expectedVersion, (current) => {
      current.themeByEnv = {
        ...(current.themeByEnv ?? {}),
        ...(dto.themeByEnv ?? {}),
      };
      if (dto.defaultThemeId) {
        current.theme = dto.defaultThemeId;
      }
      return current;
    });
  }

  /**
   * Read-check-mutate-write inside a Firestore transaction so concurrent
   * writers cannot interleave between the version check and the write.
   */
  private async transactionalUpdate(
    id: string,
    expectedVersion: number | undefined,
    mutate: (current: Application) => Application,
  ): Promise<Application> {
    const db = admin.firestore();
    const ref = db.collection(Collections.applications).doc(id);
    return db.runTransaction(async (tx) => {
      const snap = await tx.get(ref);
      if (!snap.exists) {
        throw new NotFoundException('Application not found');
      }
      const current = { ...(snap.data() as Application), id };
      if (
        typeof expectedVersion === 'number' &&
        expectedVersion !== (current.version ?? 0)
      ) {
        throw new ConflictException(
          `Version mismatch: expected ${expectedVersion}, actual ${
            current.version ?? 0
          }`,
        );
      }
      const next = mutate(current);
      next.version = (current.version ?? 0) + 1;
      // Strip undefined values: Firestore rejects them on set().
      const data = JSON.parse(JSON.stringify(next));
      tx.set(ref, data);
      return next;
    });
  }

  async resolveThemeIdForBuild(
    uid: string,
    appId: string,
    env: Env,
  ): Promise<{ themeId: string }> {
    const app = await this.ownership.assertOwnsApplication(uid, appId);

    // 1
    const envMatch = app.themeByEnv?.[env];
    if (envMatch) return { themeId: envMatch };

    // 2
    if (app.theme) return { themeId: app.theme };

    const labeled = await this.themeRepository
      .whereEqualTo('applicationId', appId)
      .whereEqualTo('label', env)
      .find();
    if (labeled.length) return { themeId: labeled[0].id };

    const any = await this.themeRepository
      .whereEqualTo('applicationId', appId)
      .find();
    if (any.length) return { themeId: any[0].id };

    throw new NotFoundException('No themes available for application');
  }
}
