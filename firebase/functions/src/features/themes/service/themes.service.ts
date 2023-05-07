import 'reflect-metadata';

import {inject, injectable} from 'inversify';

import IThemeRepository from '../repository/themes.repository.interface';
import IThemesService from './themes.service.interface';
import IApplicationRepository from '../../applications/repository/application.repository.interface';

import {TYPES} from '../../../di';

import User from '../../../core/models/user';
import Theme from '../../../core/models/theme';

@injectable()
export default class ThemesService implements IThemesService {
	constructor(
		@inject(TYPES.ThemeRepository) private themeRepository: IThemeRepository,
		@inject(TYPES.ApplicationRepository) private applicationRepository: IApplicationRepository
	) {
	}

	createTheme(applicationId: string, theme: Theme): Promise<Theme | null> {
		theme.applicationId = applicationId;
		return this.themeRepository.create(theme);
	}

	getByThemeId(applicationId: string, id: string): Promise<Theme | null> {
		return this.themeRepository.get(id);
	}

	getByApplicationId(id: string): Promise<Theme[]> {
		return this.themeRepository.getByApplicationsId(id);
	}

	patchById(applicationId: string, themeId: string, theme: Theme): Promise<Theme | null> {
		theme.applicationId = applicationId;
		theme.id = themeId;
		return this.themeRepository.patch(theme);
	}

	patchTheme(theme: Theme, userDto: User): Promise<Theme | null> {
		return this.themeRepository.patch(theme);
	}

	async deleteTheme(applicationId: string, themeId: string, userDto: User): Promise<void | null> {
		try {
			const application = await this.applicationRepository.getById(applicationId);
			const theme = await this.themeRepository.get(themeId);

			if (theme?.applicationId == application?.id && application?.user == userDto.uid) {
				return this.themeRepository.delete(themeId);
			} else {
				return null;
			}
		} catch (e) {
			return null;
		}
	}
}
