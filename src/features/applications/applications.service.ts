import {
  Injectable,
  BadRequestException,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';
import { Application } from './entities/application';
import { Theme } from '../themes/entities/theme';
import { UpdateThemeBindingsDto } from './dto/applications.dto';

type Env = 'dev' | 'stage' | 'prod';

@Injectable()
export class ApplicationsService {
  constructor(
    @InjectRepository(Application)
    private readonly applicationRepository: BaseFirestoreRepository<Application>,
    @InjectRepository(Theme)
    private readonly themeRepository: BaseFirestoreRepository<Theme>,
  ) {}

  async createApplication(
    userId: string,
    applicationDto: Application,
  ): Promise<Application | null> {
    try {
      return this.applicationRepository.create({
        ...applicationDto,
        user: userId,
      });
    } catch {
      return null;
    }
  }

  async findApplicationById(id: string): Promise<Application | null> {
    try {
      return await this.applicationRepository.findById(id);
    } catch {
      return null;
    }
  }

  async updateApplication(
    id: string,
    applicationDto: Application,
  ): Promise<Application | null> {
    try {
      const application = await this.applicationRepository.findById(id);
      if (application) {
        Object.assign(application, applicationDto);
        await this.applicationRepository.update(application);
        return application;
      }
      return null;
    } catch {
      return null;
    }
  }

  async removeApplication(id: string): Promise<void | null> {
    try {
      await this.applicationRepository.delete(id);
    } catch {
      return null;
    }
  }

  async listApplications(userId: string): Promise<Application[] | null> {
    try {
      return await this.applicationRepository
        .whereEqualTo('user', userId)
        .find();
    } catch {
      return null;
    }
  }

  async getApplicationEnvironment(
    id: string,
  ): Promise<Record<string, string | boolean | number> | null> {
    try {
      const application = await this.applicationRepository.findById(id);
      return application ? application.environment || {} : null;
    } catch {
      return null;
    }
  }

  async updateApplicationEnvironment(
    id: string,
    environmentData: Record<string, string | boolean | number>,
  ): Promise<Application | null> {
    try {
      const application = await this.applicationRepository.findById(id);
      if (application) {
        application.environment = {
          ...application.environment,
          ...environmentData,
        };
        await this.applicationRepository.update(application);
        return application;
      }
      return null;
    } catch {
      return null;
    }
  }

  async updateThemeBindings(appId: string, dto: UpdateThemeBindingsDto) {
    const app = await this.applicationRepository.findById(appId);
    if (!app) throw new NotFoundException('Application not found');

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

    app.themeByEnv = { ...(app.themeByEnv ?? {}), ...(dto.themeByEnv ?? {}) };
    if (dto.defaultThemeId) {
      app.theme = dto.defaultThemeId;
    }

    await this.applicationRepository.update(app);
    return app;
  }

  async resolveThemeIdForBuild(
    appId: string,
    env: Env,
  ): Promise<{ themeId: string }> {
    const app = await this.applicationRepository.findById(appId);
    if (!app) throw new NotFoundException('Application not found');

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
