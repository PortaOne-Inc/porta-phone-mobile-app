import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { Application } from '../features/applications/entities/application';
import { BuildVersion } from '../features/applications/entities/build-version';
import { Theme } from '../features/themes/entities/theme';
import { UserRole } from '../features/users/entities/userRole';
import { OwnershipService } from './data/ownership.service';

@Module({
  imports: [
    FireormModule.forFeature([Application, BuildVersion, Theme, UserRole]),
  ],
  providers: [OwnershipService],

  exports: [FireormModule, OwnershipService],
})
export class CommonModule {}
