import 'reflect-metadata';

import {inject, injectable} from 'inversify';

import IApplicationsService from './applications.service.interface';
import IApplicationRepository from '../repository/application.repository.interface';

import Application from '../../../core/models/application';
import User from '../../../core/models/user';

import {TYPES} from '../../../di';


@injectable()
export default class ApplicationsService implements IApplicationsService {

	constructor(@inject(TYPES.ApplicationRepository) private applicationRepository: IApplicationRepository,
	) {
	}

	async getApplications({uid}: User): Promise<Application[] | null> {
		return this.applicationRepository.getByUser(uid!);
	}

	async createApplication({name, platformIdentifier}: Application, {uid}: User): Promise<Application | null> {
		const user = new Application(undefined, uid, name, platformIdentifier);
		return this.applicationRepository.create(user);
	}

	async getApplicationById(id: string): Promise<Application | null> {
		return this.applicationRepository.getById(id);
	}

	async patchApplication(id: string, application: Application): Promise<Application | null> {
		return this.applicationRepository.patch(id, application);
	}
}
