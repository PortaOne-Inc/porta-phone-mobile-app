import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { PublicationResource } from './entities/publication-resource.entity';
import { PublicationResourcesService } from './publication-resources.service';
import { PublicationResourcesController } from './publication-resources.controller';

@Module({
  imports: [FireormModule.forFeature([PublicationResource])],
  providers: [PublicationResourcesService],
  controllers: [PublicationResourcesController],
  exports: [],
})
export class PublicationResourcesModule {}
