import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { ThemeSharesController } from './theme-shares.controller';
import { ThemeSharesService } from './theme-shares.service';
import { ThemeShareToken } from './entities/theme-share-token.entity';
import { Application } from '../applications/entities/application';
import { ThemeHistoryModule } from '../themes/features/theme-history/theme-history.module';
import { AssetsModule } from '../assets/assets.module';

@Module({
  imports: [
    FireormModule.forFeature([ThemeShareToken, Application]),
    ThemeHistoryModule,
    AssetsModule,
  ],
  controllers: [ThemeSharesController],
  providers: [ThemeSharesService],
  exports: [ThemeSharesService],
})
export class ThemeSharesModule {}
