import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { EmbedsService } from './embeds.service';
import { EmbedsController } from './embeds.controller';
import { CommonModule } from '../../common/common.module';
import { UsersModule } from '../users/users.module';
import { EmbeddedResource } from './entities/embed.entity';
import { RefsModule } from '../common/refs/refs.module';

@Module({
  imports: [
    FireormModule.forFeature([EmbeddedResource]),
    CommonModule,
    UsersModule,
    RefsModule,
  ],
  controllers: [EmbedsController],
  providers: [EmbedsService],
})
export class EmbedsModule {}
