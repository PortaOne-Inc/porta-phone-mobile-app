import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { PageConfigsController } from './page-configs.controller';
import { PageConfigsService } from './page-configs.service';
import { PageConfigEntity } from './entities/page-config.entity';
import { AssetsModule } from '../../../assets/assets.module';
import { ArtifactsModule } from '../../../artifacts';
import { CommonModule } from '../../../../common/common.module';

@Module({
  imports: [
    FireormModule.forFeature([PageConfigEntity]),
    AssetsModule,
    ArtifactsModule,
    CommonModule,
  ],
  controllers: [PageConfigsController],
  providers: [PageConfigsService],
  exports: [PageConfigsService],
})
export class PageConfigsModule {}
