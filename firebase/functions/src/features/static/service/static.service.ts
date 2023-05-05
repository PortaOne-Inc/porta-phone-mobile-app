import 'reflect-metadata';

import {inject, injectable} from 'inversify';

import IStaticService from './static.service.interface';
import IStaticRepository from '../repository/static.repository.interface';
import IThemeRepository from '../../themes/repository/themes.repository.interface';

import {TYPES} from '../../../di';

import Application from '../../../core/models/application';
import Theme from '../../../core/models/theme';

@injectable()
export default class StaticService implements IStaticService {
	constructor(
		@inject(TYPES.StaticRepository) private staticRepository: IStaticRepository,
		@inject(TYPES.ThemeRepository) private themeRepository: IThemeRepository
	) {
	}


	async getApplication(): Promise<Application | null> {
		try {
			return await this.staticRepository.getApplication();
		} catch (e) {
			return null
		}
	}

	async getTheme(): Promise<Theme | null> {
		try {
			return await this.staticRepository.getTheme();
		} catch (e) {
			return null
		}
	}

	async putApplication(application: Application): Promise<Application | null> {
		try {
			return await this.staticRepository.putApplication(application);
		} catch (e) {
			return null
		}
	}

	async putTheme(theme: Theme): Promise<Theme | null> {
		try {
			return await this.staticRepository.putTheme(theme);
		} catch (e) {
			return null
		}
	}

	async createDefaultTheme(applicationId: string): Promise<Theme | null> {
		try {
			const defaultTheme = await this.getTheme();
			defaultTheme!.applicationId = applicationId;
			return this.themeRepository.create(defaultTheme!);
		} catch (e) {
			return null
		}
	};
}
