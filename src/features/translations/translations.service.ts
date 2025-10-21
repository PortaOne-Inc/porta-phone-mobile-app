import { Injectable } from '@nestjs/common';
import { TranslationsRepository } from './translations.repository';
import { Translation } from './entities/translation';

/**
 * TranslationsService
 *
 * Responsibilities:
 * - High-level API for managing translations and overrides per application.
 * - Delegates persistence and query logic to TranslationsRepository.
 */
@Injectable()
export class TranslationsService {
  constructor(
    private readonly translationsRepository: TranslationsRepository,
  ) {}

  /**
   * Compose a Flutter ARB file stream for a given application.
   */
  async composeArb(applicationId: string): Promise<NodeJS.ReadableStream> {
    return this.translationsRepository.composeArb(applicationId);
  }

  /**
   * Get all translations (base + overrides).
   */
  async getTranslations(): Promise<Translation[]> {
    return this.translationsRepository.getTranslations();
  }

  /**
   * Get override translations for a specific application.
   */
  async getOverridesByAppId(applicationId: string): Promise<Translation[]> {
    return this.translationsRepository.getOverridesByAppId(applicationId);
  }

  /**
   * Set (upsert) a single override translation for an application.
   */
  async setOverrideByAppId(
    applicationId: string,
    translation: Translation,
  ): Promise<void> {
    return this.translationsRepository.setOverrideByAppId(
      applicationId,
      translation,
    );
  }

  /**
   * Delete a single override translation for an application.
   */
  async deleteOverrideByAppId(
    applicationId: string,
    translation: Translation,
  ): Promise<void> {
    return this.translationsRepository.deleteOverrideByAppId(
      applicationId,
      translation,
    );
  }
}
