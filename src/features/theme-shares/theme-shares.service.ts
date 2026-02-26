import { Injectable, Logger, NotFoundException } from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';
import { v4 as uuidv4 } from 'uuid';

import { ThemeShareToken } from './entities/theme-share-token.entity';
import { Theme } from '../themes/entities/theme';
import { ColorSchemesService } from '../themes/features/color-schemes/color-schemes.service';
import { WidgetConfigsService } from '../themes/features/widget-configs/widget-configs.service';
import { PageConfigsService } from '../themes/features/page-configs/page-configs.service';
import { FeatureAccessService } from '../themes/features/feature-access/feature-access.service';
import { nowIso } from '../../common';

@Injectable()
export class ThemeSharesService {
  private readonly logger = new Logger(ThemeSharesService.name);

  constructor(
    @InjectRepository(ThemeShareToken)
    private readonly repo: BaseFirestoreRepository<ThemeShareToken>,
    @InjectRepository(Theme)
    private readonly themeRepo: BaseFirestoreRepository<Theme>,
    private readonly colorSchemesService: ColorSchemesService,
    private readonly widgetConfigsService: WidgetConfigsService,
    private readonly pageConfigsService: PageConfigsService,
    private readonly featureAccessService: FeatureAccessService,
  ) {}

  async createShareToken(
    applicationId: string,
    themeId: string,
    uid: string,
  ): Promise<{ token: string }> {
    const theme = await this.themeRepo.findById(themeId).catch(() => null);
    if (!theme || theme.applicationId !== applicationId) {
      throw new NotFoundException('Theme not found');
    }

    const token: ThemeShareToken = {
      id: uuidv4(),
      applicationId,
      themeId,
      ownerId: uid,
      active: true,
      createdAt: nowIso(),
    };

    await this.repo.create(token);
    return { token: token.id };
  }

  async getSharedThemePreview(token: string) {
    const doc = await this.repo.findById(token).catch(() => null);
    if (!doc || !doc.active) {
      throw new NotFoundException('Share token not found or inactive');
    }

    const { applicationId, themeId } = doc;

    const theme = await this.themeRepo.findById(themeId).catch(() => null);
    if (!theme || theme.applicationId !== applicationId) {
      throw new NotFoundException('Theme not found');
    }

    const [
      colorSchemeLight,
      colorSchemeDark,
      widgetConfigLight,
      widgetConfigDark,
      pageConfigLight,
      pageConfigDark,
      featureAccess,
    ] = await Promise.all([
      this.colorSchemesService
        .getByThemeVariant(applicationId, themeId, 'light')
        .catch(() => null),
      this.colorSchemesService
        .getByThemeVariant(applicationId, themeId, 'dark')
        .catch(() => null),
      this.widgetConfigsService
        .getByThemeVariant(applicationId, themeId, 'light')
        .catch(() => null),
      this.widgetConfigsService
        .getByThemeVariant(applicationId, themeId, 'dark')
        .catch(() => null),
      this.pageConfigsService
        .getByThemeVariant(applicationId, themeId, 'light')
        .catch(() => null),
      this.pageConfigsService
        .getByThemeVariant(applicationId, themeId, 'dark')
        .catch(() => null),
      this.featureAccessService
        .getByTheme(applicationId, themeId)
        .catch(() => null),
    ]);

    return {
      theme,
      colorSchemes: { light: colorSchemeLight, dark: colorSchemeDark },
      widgetConfigs: { light: widgetConfigLight, dark: widgetConfigDark },
      pageConfigs: { light: pageConfigLight, dark: pageConfigDark },
      featureAccess,
    };
  }
}
