import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { Application } from '../features/applications/entities/application';
import { BuildVersion } from '../features/applications/entities/build-version';
import { Theme } from '../features/themes/entities/theme';
import { ApplicationsService } from '../features/applications/applications.service';
import { UserRole } from '../features/users/entities/userRole';

@Module({
  imports: [
    FireormModule.forFeature([Application, BuildVersion, Theme, UserRole]),
  ],
  providers: [ApplicationsService],

  exports: [FireormModule],
})
export class CommonModule {}
