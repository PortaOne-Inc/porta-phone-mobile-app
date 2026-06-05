import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { ThrottlerModule } from '@nestjs/throttler';

import { CommonModule } from '../../../../common/common.module';
import { AssetsModule } from '../../../assets/assets.module';
import { Theme } from '../../entities/theme';
import { ColorScheme } from '../color-schemes/entities/color-scheme.entity';
import { WidgetConfigEntity } from '../widget-configs/entities/widget-config.entity';
import { PageConfigEntity } from '../page-configs/entities/page-config.entity';
import { FeatureAccess } from '../feature-access/entities/feature-access.entity';
import { FeatureAccessService } from '../feature-access/feature-access.service';

import { GenerateThemesController } from './generate.controller';
import { GenerateThemesService } from './generate.service';
import { BaseThemeLoader } from './base/base-theme.loader';
import { AnthropicClientService } from './generators/anthropic-client.service';
import { BriefGeneratorService } from './brief/brief-generator.service';
import { ThemeComposerService } from './compose/theme-composer.service';
import { AssetCatalogService } from './compose/asset-catalog.service';

@Module({
  imports: [
    CommonModule,
    AssetsModule,
    ThrottlerModule.forRoot([
      { name: 'generate', ttl: 60_000, limit: 5 },
      { name: 'nudge', ttl: 60_000, limit: 10 },
    ]),
    FireormModule.forFeature([
      Theme,
      ColorScheme,
      WidgetConfigEntity,
      PageConfigEntity,
      FeatureAccess,
    ]),
  ],
  controllers: [GenerateThemesController],
  providers: [
    GenerateThemesService,
    FeatureAccessService,
    BaseThemeLoader,
    AnthropicClientService,
    BriefGeneratorService,
    ThemeComposerService,
    AssetCatalogService,
  ],
})
export class GenerateThemesModule {}
