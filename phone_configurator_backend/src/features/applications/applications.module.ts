import { Module } from '@nestjs/common';
import { ApplicationsController } from './applications.controller';
import { ApplicationsService } from './applications.service';
import { CommonModule } from '../../common/common.module';
import { UsersModule } from '../users/users.module';
import { ThemesService } from '../themes/themes.service';
import { AssetsModule } from '../assets/assets.module';
import { CloudStorageModule } from '../common/storage/cloud-storage.module';
import { RefsModule } from '../common/refs/refs.module';
import { CapabilitiesModule } from './features/capabilities/capabilities.module';
import { ThemeHistoryModule } from '../themes/features/theme-history/theme-history.module';

@Module({
  imports: [
    CommonModule,
    UsersModule,
    AssetsModule,
    CloudStorageModule,
    RefsModule,
    CapabilitiesModule,
    ThemeHistoryModule,
  ],
  controllers: [ApplicationsController],
  providers: [ApplicationsService, ThemesService],
})
export class ApplicationsModule {}
