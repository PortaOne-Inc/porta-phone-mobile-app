import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { Application } from './entities/application/application';
import { BuildVersion } from './entities/build-version/build-version';
import { Colors } from './entities/colors/colors';
import { Images } from './entities/images/images';
import { Launch } from './entities/launch/launch';
import { Theme } from './entities/theme/theme';
import { ApplicationsService } from '../applications/applications.service';
import { UserRole } from './entities/userRoles/userRole';

@Module({
  imports: [
    FireormModule.forFeature([
      Application,
      BuildVersion,
      Colors,
      Images,
      Launch,
      Theme,
      UserRole,
    ]),
  ],
  providers: [ApplicationsService],

  exports: [FireormModule],
})
export class CommonModule {
}
