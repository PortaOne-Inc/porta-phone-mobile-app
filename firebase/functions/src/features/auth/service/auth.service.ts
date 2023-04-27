import 'reflect-metadata';

import {inject, injectable} from 'inversify';

import IAuthService from './auth.service.interface';
import IApplicationRepository from '../../applications/repository/application.repository.interface';
import IStaticRepository from '../../static/repository/static.repository.interface';

import Application from '../../../core/models/application';
import User from '../../../core/models/user';

import {TYPES} from '../../../di';


@injectable()
export default class AuthService implements IAuthService {
	constructor(
		@inject(TYPES.ApplicationRepository) private applicationRepository: IApplicationRepository,
		@inject(TYPES.StaticRepository) private staticRepository: IStaticRepository
	) {
	}

	async createDefaultApplication(user: User): Promise<Application | null> {
		try {
			const defaultApplication = await this.staticRepository.getApplication();
			defaultApplication!.user = user.uid;
			return this.applicationRepository.create(defaultApplication!);
		} catch (e) {
			return null;
		}
	}
}
