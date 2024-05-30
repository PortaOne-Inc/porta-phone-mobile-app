import 'reflect-metadata';

import { injectable } from 'inversify';
import axios from 'axios';
import * as unzipper from 'unzipper';
import * as archiver from 'archiver';

import ITranslationsRepository from './translations.repository.interface';
import { Translation } from '../../../core/models/translation';
import { database } from '../../../config/firebase';
import { localizely_api_key, localizely_download_url } from '../../../config/localizely';


// TODO: split by source, move logic to service

@injectable()
export default class TranslationsRepository implements ITranslationsRepository {
	private appsCollection = database.collection('applications');

	async composeArb(appId: string) {
		const appOverrides = await this.getOverridesByAppId(appId);

		const response = await axios({
			url: localizely_download_url + '?type=flutter_arb&export_empty_as=empty',
			headers: { 'X-Api-Token': localizely_api_key, 'accept-encoding': 'gzip,deflate' },
			method: 'GET',
			responseType: 'stream',
		})

		const zipStream = response.data as NodeJS.ReadableStream;
		const filesStream = zipStream.pipe(unzipper.Parse({ forceStream: true }));

		const responseZipStream = archiver('zip');

		for await (let entry of filesStream) {
			const file = entry as unzipper.Entry;
			const filename = file.path;
			const data = (await file.buffer()).toString();
			const json = JSON.parse(data) as { [key: string]: string };
			const locale = filename.split('.')[0].split('_')[1];

			for (const override of appOverrides) {
				if(locale === override.locale) {
					if (json[override.key]) {
						json[override.key] = override.value;
					}
				}
			}

			responseZipStream.append(JSON.stringify(json), { name: locale + '.arb' });
		}

		responseZipStream.finalize();
		return responseZipStream;
	}

	async getTranslations() {
		const response = await axios({
			url: localizely_download_url + '?type=json&export_empty_as=empty',
			headers: { 'X-Api-Token': localizely_api_key },
			method: 'GET',
			responseType: 'stream',
		})

		let translations: Translation[] = [];

		const zipStream = response.data as NodeJS.ReadableStream;
		const filesStream = zipStream.pipe(unzipper.Parse({ forceStream: true }));

		for await (let entry of filesStream) {
			const file = entry as unzipper.Entry;
			const filename = file.path;
			const data = (await file.buffer()).toString();
			const json = JSON.parse(data) as { [key: string]: string };
			const locale = filename.split('.')[0];
			for (const key in json) {
				const value = json[key];
				translations.push({ locale, key, value });
			}
		}

		translations.sort((a, b) => a.key.localeCompare(b.key));

		return translations;

	}

	async getOverridesByAppId(appId: string) {
		const snapshot = await this.overridesCollection(appId).get();
		const translations = snapshot.docs.map(doc => doc.data() as Translation);
		return translations
	}

	async setOverrideByAppId(appId: string, translation: Translation) {
		const key = this.compositeKey(translation);
		await this.overridesCollection(appId).doc(key).set(translation);
	}

	async deleteOverrideByAppId(appId: string, translation: Translation) {
		const key = this.compositeKey(translation);
		await this.overridesCollection(appId).doc(key).delete();
	}


	private compositeKey(translation: Translation) {
		return `${translation.locale}_${translation.key}`;
	}

	private overridesCollection(appId: string) {
		return this.appsCollection.doc(appId).collection('translation_overrides');
	}
}


