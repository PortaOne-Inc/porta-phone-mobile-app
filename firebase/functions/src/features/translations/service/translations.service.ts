import 'reflect-metadata';

import {inject, injectable} from 'inversify';


import ITranslationsRepository from '../repository/translations.repository.interface';
import ITranslationsService from './translations.service.interface';

import {TYPES} from '../../../di';
import { Translation } from '../../../core/models/translation';


@injectable()
export default class TranslationsService implements ITranslationsService {
	constructor(
		@inject(TYPES.TranslationsRepository) private translationsRepository: ITranslationsRepository,
	) {
	}

	async composeArb(appId: string) {
		return this.translationsRepository.composeArb(appId);
	}

	async getTranslations() {
		return this.translationsRepository.getTranslations();
	}

	async getOverridesByAppId(appId: string) {
		return this.translationsRepository.getOverridesByAppId(appId);
	}

	async setOverrideByAppId(appId: string, translation: Translation) {
		return this.translationsRepository.setOverrideByAppId(appId, translation);
	}

	async deleteOverrideByAppId(appId: string, translation: Translation) {
		return this.translationsRepository.deleteOverrideByAppId(appId, translation);
	}
}
