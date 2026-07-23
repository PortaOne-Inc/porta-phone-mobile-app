import { Module } from '@nestjs/common';
import { ThemesService } from './themes.service';
import { ThemesController } from './themes.controller';

import { CommonModule } from '../../common/common.module';
import { FeatureAccessModule } from './features/feature-access/feature-access.module';
import { ColorSchemesModule } from './features/color-schemes/color-schemes.module';
import { WidgetConfigsModule } from './features/widget-configs/widget-configs.module';
import { PageConfigsModule } from './features/page-configs/page-configs.module';
import { SplashAssetsModule } from './features/splash-assets/splash-assets.module';
import { LaunchAssetsModule } from './features/launch-assets/launch-assets.module';
import { AssetsModule } from '../assets/assets.module';
import { ArtifactsModule } from '../artifacts';
import { ThemeHistoryModule } from './features/theme-history/theme-history.module';

@Module({
  imports: [
    CommonModule,
    FeatureAccessModule,
    ColorSchemesModule,
    WidgetConfigsModule,
    PageConfigsModule,
    SplashAssetsModule,
    LaunchAssetsModule,
    ArtifactsModule,
    AssetsModule,
    ThemeHistoryModule,
  ],
  controllers: [ThemesController],
  providers: [ThemesService],
  exports: [ThemesService],
})
export class ThemesModule {}
