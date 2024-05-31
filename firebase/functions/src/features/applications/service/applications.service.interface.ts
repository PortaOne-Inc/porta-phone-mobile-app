import Application from '../../../core/models/application';
import User from '../../../core/models/user';

export default interface IApplicationsService {
	createApplication: (applicationDto: Application, userDto: User) => Promise<Application | null>;
	incrementVersion(id: string): Promise<Application | null>;
	getApplicationById: (id: string) => Promise<Application | null>;
	patchApplication: (id: string, applicationDto: Application) => Promise<Application | null>;
	deleteApplication: (id: string, {uid}: User) => Promise<void | null>;
	getApplications: ({uid}: User) => Promise<Application[] | null>
}
