import Application from '../../../core/models/application';

export default interface IApplicationRepository {
	create: (application: Application) => Promise<Application>;
	patch: (id: string, application: Application) => Promise<Application>;
	getById: (id: string) => Promise<Application | null>;
	getByUser: (id: string) => Promise<Application[] | null>;
}
