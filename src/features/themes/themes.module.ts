import { Module } from '@nestjs/common';
import { ThemesService } from './themes.service';
import { ThemesController } from './themes.controller';

import { CommonModule } from '../../common/common.module';

@Module({
  imports: [CommonModule],
  controllers: [ThemesController],
  providers: [ThemesService],
})
export class ThemesModule {}
