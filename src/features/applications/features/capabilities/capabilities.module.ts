import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { ApplicationCapabilities } from './entities/capability.entity';
import { ApplicationCapabilitiesService } from './capabilities.service';
import { ApplicationCapabilitiesController } from './capabilities.controller';
import { CommonModule } from '../../../../common/common.module';

@Module({
  imports: [FireormModule.forFeature([ApplicationCapabilities]), CommonModule],
  providers: [ApplicationCapabilitiesService],
  controllers: [ApplicationCapabilitiesController],
  exports: [ApplicationCapabilitiesService],
})
export class CapabilitiesModule {}
