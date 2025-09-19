import { Injectable } from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';
import { Readable } from 'stream';
import axios from 'axios';
import * as unzipper from 'unzipper';
import archiver from 'archiver';

import {
  localizely_api_key,
  localizely_download_url,
} from '../../config/localizely';
import { Translation } from './entities/translation';

@Injectable()
export class TranslationsRepository {
  constructor(
    @InjectRepository(Translation)
    private readonly translationRepo: BaseFirestoreRepository<Translation>,
  ) {}

  /**
   * Download base ARB ZIP from Localizely, apply per-application overrides,
   * and return a ZIP stream with updated ARB files.
   */
  async composeArb(applicationId: string): Promise<Readable> {
    const appOverrides = await this.getOverridesByAppId(applicationId);

    const response = await axios({
      url: `${localizely_download_url}?type=flutter_arb&export_empty_as=empty`,
      headers: {
        'X-Api-Token': localizely_api_key,
        'accept-encoding': 'gzip,deflate',
      },
      method: 'GET',
      responseType: 'stream',
    });

    const zipStream = response.data as Readable;
    const filesStream = zipStream.pipe(unzipper.Parse({ forceStream: true }));
    const responseZipStream = archiver('zip');

    // process each ARB file from Localizely
    for await (const entry of filesStream) {
      const file = entry as unzipper.Entry;
      const filename = file.path;

      const data = (await file.buffer()).toString();
      const json = JSON.parse(data) as Record<string, string>;

      const locale = extractLocale(filename); // supports "en.arb" or "app_en.arb"

      // apply overrides for this locale
      for (const override of appOverrides) {
        if (
          override.locale === locale &&
          Object.prototype.hasOwnProperty.call(json, override.key)
        ) {
          json[override.key] = override.value;
        }
      }

      responseZipStream.append(JSON.stringify(json), { name: `${locale}.arb` });
    }

    responseZipStream.finalize();
    return responseZipStream;
  }

  /**
   * Download all base translations (JSON ZIP) from Localizely and flatten
   * into an array of Translation objects (without applicationId / id).
   */
  async getTranslations(): Promise<Translation[]> {
    const response = await axios({
      url: `${localizely_download_url}?type=json&export_empty_as=empty`,
      headers: { 'X-Api-Token': localizely_api_key },
      method: 'GET',
      responseType: 'stream',
    });

    const translations: Translation[] = [];

    const zipStream = response.data as Readable;
    const filesStream = zipStream.pipe(unzipper.Parse({ forceStream: true }));

    for await (const entry of filesStream) {
      const file = entry as unzipper.Entry;
      const filename = file.path;

      const data = (await file.buffer()).toString();
      const json = JSON.parse(data) as Record<string, string>;

      const locale = extractLocale(filename); // e.g., "en" from "en.json" or "app_en.json"

      for (const key of Object.keys(json)) {
        translations.push({
          id: '', // not persisted here
          applicationId: '', // not tied to an app in base set
          locale,
          key,
          value: json[key],
        });
      }
    }

    translations.sort((a, b) => a.key.localeCompare(b.key));
    return translations;
  }

  /**
   * Return all override rows for an application.
   */
  async getOverridesByAppId(applicationId: string): Promise<Translation[]> {
    return this.translationRepo
      .whereEqualTo('applicationId', applicationId)
      .find();
  }

  /**
   * Upsert a single override row for an application.
   */
  async setOverrideByAppId(
    applicationId: string,
    translation: Translation,
  ): Promise<void> {
    await this.translationRepo.create({ applicationId, ...translation });
  }

  /**
   * Delete a single override row for an application by (locale, key).
   */
  async deleteOverrideByAppId(
    applicationId: string,
    translation: Translation,
  ): Promise<void> {
    const doc = await this.translationRepo
      .whereEqualTo('applicationId', applicationId)
      .whereEqualTo('locale', translation.locale)
      .whereEqualTo('key', translation.key)
      .findOne();

    if (doc) {
      await this.translationRepo.delete(doc.id);
    }
  }
}

function extractLocale(filename: string): string {
  const justName = filename.split('/').pop() ?? filename;
  const base = justName.replace(/\.(arb|json)$/i, '');
  const parts = base.split('_');
  return parts.length > 1 ? parts[parts.length - 1] : base;
}
