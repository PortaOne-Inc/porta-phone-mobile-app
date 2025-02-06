import { Injectable } from '@nestjs/common';
import { TranslationsRepository } from './translations.repository';
import { Readable } from 'stream';
import { Translation } from '../../common/entities/translations/translation';

@Injectable()
export class TranslationsService {
  constructor(
    private readonly translationsRepository: TranslationsRepository,
  ) {}

  async composeArb(appId: string): Promise<Readable> {
    return this.translationsRepository.composeArb(appId);
  }

  async getTranslations(): Promise<Translation[]> {
    return this.translationsRepository.getTranslations();
  }

  async getOverridesByAppId(appId: string): Promise<Translation[]> {
    return this.translationsRepository.getOverridesByAppId(appId);
  }

  async setOverrideByAppId(
    appId: string,
    translation: Translation,
  ): Promise<void> {
    return this.translationsRepository.setOverrideByAppId(appId, translation);
  }

  async deleteOverrideByAppId(
    appId: string,
    translation: Translation,
  ): Promise<void> {
    return this.translationsRepository.deleteOverrideByAppId(
      appId,
      translation,
    );
  }
}
