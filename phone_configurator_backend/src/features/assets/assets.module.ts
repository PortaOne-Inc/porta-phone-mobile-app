import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { Asset } from './entities/asset.entity';
import { AssetsService } from './assets.service';
import { AssetsController } from './assets.controller';
import { FirebaseModule } from 'src/firebase.module';
import { CommonModule } from '../../common/common.module';
import { UsersModule } from '../users/users.module';
import { RefsModule } from '../common/refs/refs.module';
import { FileArtifactFactory } from '../../common';

@Module({
  imports: [
    FireormModule.forFeature([Asset]),
    FirebaseModule,
    CommonModule,
    UsersModule,
    RefsModule,
  ],
  controllers: [AssetsController],
  providers: [AssetsService, FileArtifactFactory],
  exports: [AssetsService],
})
export class AssetsModule {}
