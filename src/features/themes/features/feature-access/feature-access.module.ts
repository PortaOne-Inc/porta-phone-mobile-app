import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { FeatureAccess } from './entities/feature-access.entity';
import { FeatureAccessService } from './feature-access.service';
import { FeatureAccessController } from './feature-access.controller';

@Module({
  imports: [FireormModule.forFeature([FeatureAccess])],
  controllers: [FeatureAccessController],
  providers: [FeatureAccessService],
  exports: [FeatureAccessService],
})
export class FeatureAccessModule {}
