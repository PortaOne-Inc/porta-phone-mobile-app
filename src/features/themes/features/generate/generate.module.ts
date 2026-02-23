import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { ThrottlerModule } from '@nestjs/throttler';
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
import { OpenAiClientService } from './generators/openai-client.service';
import { ColorSchemeGenerator } from './generators/color-scheme.generator';
import { WidgetConfigGenerator } from './generators/widget-config.generator';
import { PageConfigGenerator } from './generators/page-config.generator';

@Module({
  imports: [
    CommonModule,
    ArtifactsModule,
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
    ]),
  ],
  controllers: [GenerateThemesController],
  providers: [
    GenerateThemesService,
    ThemesService,
    OpenAiClientService,
    ColorSchemeGenerator,
    WidgetConfigGenerator,
    PageConfigGenerator,
  ],
})
export class GenerateThemesModule {}
