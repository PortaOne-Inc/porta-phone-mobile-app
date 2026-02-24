import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { ThemeHistory } from './entities/theme-history.entity';
import { ThemeHistoryService } from './theme-history.service';
import { ThemeHistoryController } from './theme-history.controller';

@Module({
  imports: [FireormModule.forFeature([ThemeHistory])],
  controllers: [ThemeHistoryController],
  providers: [ThemeHistoryService],
  exports: [ThemeHistoryService],
})
export class ThemeHistoryModule {}
