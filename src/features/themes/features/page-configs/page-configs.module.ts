import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { PageConfigsController } from './page-configs.controller';
import { PageConfigsService } from './page-configs.service';
import { PageConfigEntity } from './entities/page-config.entity';

@Module({
  imports: [FireormModule.forFeature([PageConfigEntity])],
  controllers: [PageConfigsController],
  providers: [PageConfigsService],
  exports: [PageConfigsService],
})
export class PageConfigsModule {}
