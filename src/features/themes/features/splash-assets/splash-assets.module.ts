import { Module } from '@nestjs/common';
import { SplashAssetsController } from './splash-assets.controller';
import { SplashAssetsService } from './splash-assets.service';
import { FireormModule } from 'nestjs-fireorm';
import { SplashAssetEntity } from './entities/splash-asset.entity';
import { AssetsModule } from '../../../assets/assets.module';
import { ArtifactsModule } from '../../../artifacts/artifacts.module';
import { RefsModule } from '../../../common/refs/refs.module';

@Module({
  imports: [
    FireormModule.forFeature([SplashAssetEntity]),
    AssetsModule,
    ArtifactsModule,
    RefsModule,
  ],
  controllers: [SplashAssetsController],
  providers: [SplashAssetsService],
  exports: [SplashAssetsService],
})
export class SplashAssetsModule {}
