import { Module } from '@nestjs/common';
import { FireormModule } from 'nestjs-fireorm';
import { ColorSchemesController } from './color-schemes.controller';
import { ColorSchemesService } from './color-schemes.service';
import { ColorScheme } from './entities/color-scheme.entity';

@Module({
  imports: [FireormModule.forFeature([ColorScheme])],
  controllers: [ColorSchemesController],
  providers: [ColorSchemesService],
  exports: [ColorSchemesService],
})
export class ColorSchemesModule {}
