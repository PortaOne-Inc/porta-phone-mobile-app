import { Module } from '@nestjs/common';
import { ApplicationsController } from './applications.controller';
import { ApplicationsService } from './applications.service';
import { CommonModule } from '../common/common.module';
import { UsersModule } from '../users/users.module';
import { ThemesService } from '../themes/themes.service';

@Module({
  imports: [CommonModule, UsersModule],
  controllers: [ApplicationsController],
  providers: [ApplicationsService, ThemesService],
})
export class ApplicationsModule {}
