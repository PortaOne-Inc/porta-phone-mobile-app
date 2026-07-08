import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { WidgetConfigsController } from './widget-configs.controller';
import { WidgetConfigsService } from './widget-configs.service';
import { WidgetConfigEntity } from './entities/widget-config.entity';
import { AssetsModule } from '../../../assets/assets.module';
import { ArtifactsModule } from '../../../artifacts';
import { CommonModule } from '../../../../common/common.module';

@Module({
  imports: [
    FireormModule.forFeature([WidgetConfigEntity]),
    AssetsModule,
    ArtifactsModule,
    CommonModule,
  ],
  controllers: [WidgetConfigsController],
  providers: [WidgetConfigsService],
  exports: [WidgetConfigsService],
})
export class WidgetConfigsModule {}
