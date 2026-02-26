import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { ThemeSharesController } from './theme-shares.controller';
import { ThemeSharesService } from './theme-shares.service';
import { ThemeShareToken } from './entities/theme-share-token.entity';
import { ThemeHistoryModule } from '../themes/features/theme-history/theme-history.module';

@Module({
  imports: [
    FireormModule.forFeature([ThemeShareToken]),
    ThemeHistoryModule,
  ],
  controllers: [ThemeSharesController],
  providers: [ThemeSharesService],
  exports: [ThemeSharesService],
})
export class ThemeSharesModule {}
