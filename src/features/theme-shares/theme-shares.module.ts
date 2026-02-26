import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { ThemeSharesController } from './theme-shares.controller';
import { ThemeSharesService } from './theme-shares.service';
import { ThemeShareToken } from './entities/theme-share-token.entity';
import { Theme } from '../themes/entities/theme';
import { ColorSchemesModule } from '../themes/features/color-schemes/color-schemes.module';
import { WidgetConfigsModule } from '../themes/features/widget-configs/widget-configs.module';
import { PageConfigsModule } from '../themes/features/page-configs/page-configs.module';
import { FeatureAccessModule } from '../themes/features/feature-access/feature-access.module';

@Module({
  imports: [
    FireormModule.forFeature([ThemeShareToken, Theme]),
    ColorSchemesModule,
    WidgetConfigsModule,
    PageConfigsModule,
    FeatureAccessModule,
  ],
  controllers: [ThemeSharesController],
  providers: [ThemeSharesService],
  exports: [ThemeSharesService],
})
export class ThemeSharesModule {}
