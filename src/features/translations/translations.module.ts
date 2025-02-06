import { Module } from '@nestjs/common';
import { TranslationsService } from './translations.service';
import { TranslationsRepository } from './translations.repository';
import { TranslationsController } from './translations.controller';
import { FireormModule } from 'nestjs-fireorm';
import { Translation } from '../../common/entities/translations/translation';

@Module({
  imports: [FireormModule.forFeature([Translation])],
  controllers: [TranslationsController],
  providers: [TranslationsService, TranslationsRepository],
  exports: [TranslationsService],
})
export class TranslationsModule {}
