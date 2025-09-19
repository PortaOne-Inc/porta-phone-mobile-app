import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { LaunchAssetsEntity } from './entities/launch-asset.entity';
import { LaunchAssetsService } from './launch-assets.service';
import { LaunchAssetsController } from './launch-assets.controller';

import { FirebaseModule } from 'src/firebase.module';
import { AssetsModule } from '../../../assets/assets.module';
import { ArtifactsModule } from '../../../artifacts/artifacts.module';
import { RefsModule } from '../../../common/refs/refs.module';

@Module({
  imports: [
    FireormModule.forFeature([LaunchAssetsEntity]),
    AssetsModule,
    ArtifactsModule,
    FirebaseModule,
    RefsModule,
  ],
  controllers: [LaunchAssetsController],
  providers: [LaunchAssetsService],
  exports: [LaunchAssetsService],
})
export class LaunchAssetsModule {}
