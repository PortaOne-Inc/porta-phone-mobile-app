import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { ArtifactsModule } from '../../../artifacts';
import { CommonModule } from '../../../../common/common.module';
import { AssetsModule } from '../../../assets/assets.module';
import { Theme } from '../../entities/theme';
import { GenerateThemesController } from './generate.controller';
import { GenerateThemesService } from './generate.service';
import { ThemesService } from '../../themes.service';
import { ColorScheme } from '../color-schemes/entities/color-scheme.entity';
import { WidgetConfigEntity } from '../widget-configs/entities/widget-config.entity';
import { PageConfigEntity } from '../page-configs/entities/page-config.entity';

@Module({
  imports: [
    CommonModule,
    ArtifactsModule,
    AssetsModule,
    FireormModule.forFeature([
      Theme,
      ColorScheme,
      WidgetConfigEntity,
      PageConfigEntity,
    ]),
  ],
  controllers: [GenerateThemesController],
  providers: [GenerateThemesService, ThemesService],
})
export class GenerateThemesModule {}
