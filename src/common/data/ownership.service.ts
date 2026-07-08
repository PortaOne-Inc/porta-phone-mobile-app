import {
  ForbiddenException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';

import { Application } from '../../features/applications/entities/application';
import { Theme } from '../../features/themes/entities/theme';

/**
 * Central ownership boundary for application-scoped data. Counterpart of
 * OwnedRepoGuard (which covers entities carrying their own ownerId): here
 * ownership is derived from the owning Application document, so services
 * whose entities only reference applicationId/themeId can enforce the same
 * uid -> application -> theme chain.
 */
@Injectable()
export class OwnershipService {
  constructor(
    @InjectRepository(Application)
    private readonly applicationRepository: BaseFirestoreRepository<Application>,
    @InjectRepository(Theme)
    private readonly themeRepository: BaseFirestoreRepository<Theme>,
  ) {}

  /** Returns the application or throws: 404 if missing, 403 if not owned. */
  async assertOwnsApplication(
    uid: string,
    applicationId: string,
  ): Promise<Application> {
    const application = await this.applicationRepository
      .findById(applicationId)
      .catch(() => null);
    if (!application) {
      throw new NotFoundException('Application not found');
    }
    if (application.user !== uid) {
      throw new ForbiddenException('Forbidden');
    }
    return application;
  }

  /**
   * Returns the theme or throws: 403 if the application is not owned,
   * 404 if the application or the theme (within it) is missing.
   */
  async assertOwnsTheme(
    uid: string,
    applicationId: string,
    themeId: string,
  ): Promise<Theme> {
    await this.assertOwnsApplication(uid, applicationId);

    const theme = await this.themeRepository
      .findById(themeId)
      .catch(() => null);
    if (!theme || theme.applicationId !== applicationId) {
      throw new NotFoundException(`Theme with ID ${themeId} not found`);
    }
    return theme;
  }
}
