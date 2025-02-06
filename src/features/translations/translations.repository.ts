import { Injectable } from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';
import { Readable } from 'stream';
import axios from 'axios';
import * as unzipper from 'unzipper';
import archiver from 'archiver';
import { localizely_api_key, localizely_download_url } from '../../localizely';
import { Translation } from '../../common/entities/translations/translation';

@Injectable()
export class TranslationsRepository {
  constructor(
    @InjectRepository(Translation)
    private readonly translationRepo: BaseFirestoreRepository<Translation>,
  ) {}

  async composeArb(appId: string): Promise<Readable> {
    const appOverrides = await this.getOverridesByAppId(appId);

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

    for await (const entry of filesStream) {
      const file = entry as unzipper.Entry;
      const filename = file.path;
      const data = (await file.buffer()).toString();
      const json = JSON.parse(data) as { [key: string]: string };
      const locale = filename.split('.')[0].split('_')[1];

      for (const override of appOverrides) {
        if (locale === override.locale && json.hasOwnProperty(override.key)) {
          json[override.key] = override.value;
        }
      }

      responseZipStream.append(JSON.stringify(json), { name: `${locale}.arb` });
    }

    responseZipStream.finalize();
    return responseZipStream;
  }

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
      const json = JSON.parse(data) as { [key: string]: string };
      const locale = filename.split('.')[0];

      for (const key in json) {
        const value = json[key];
        translations.push({
          locale,
          key,
          value,
          id: '',
          appId: '',
        });
      }
    }

    translations.sort((a, b) => a.key.localeCompare(b.key));

    return translations;
  }

  async getOverridesByAppId(appId: string): Promise<Translation[]> {
    return this.translationRepo.whereEqualTo('appId', appId).find();
  }

  async setOverrideByAppId(
    appId: string,
    translation: Translation,
  ): Promise<void> {
    await this.translationRepo.create({ appId, ...translation });
  }

  async deleteOverrideByAppId(
    appId: string,
    translation: Translation,
  ): Promise<void> {
    const doc = await this.translationRepo
      .whereEqualTo('appId', appId)
      .whereEqualTo('locale', translation.locale)
      .whereEqualTo('key', translation.key)
      .findOne();

    if (doc) {
      await this.translationRepo.delete(doc.id);
    }
  }
}
