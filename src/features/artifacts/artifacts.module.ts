import { Module, Global } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { Artifact } from './entities/artifact.entity';
import { ArtifactsService } from './artifacts.service';
import { ArtifactsController } from './artifacts.controller';
import { AssetsModule } from '../assets/assets.module';
import { FirebaseModule } from 'src/firebase.module';
import { RefsModule } from '../common/refs/refs.module';
import { FileArtifactFactory } from '../../common/files/file-artifact.factory';

@Global()
@Module({
  imports: [
    FireormModule.forFeature([Artifact]),
    AssetsModule,
    FirebaseModule,
    RefsModule,
  ],
  controllers: [ArtifactsController],
  providers: [ArtifactsService, FileArtifactFactory],
  exports: [ArtifactsService],
})
export class ArtifactsModule {}
