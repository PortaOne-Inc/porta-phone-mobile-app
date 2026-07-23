import { Module } from '@nestjs/common';
import { StartupService } from './startup.service';

@Module({
  providers: [StartupService],
  exports: [StartupService],
})
export class StartupModule {}
