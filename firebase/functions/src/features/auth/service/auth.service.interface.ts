import Application from '../../../core/models/application';
import User from '../../../core/models/user';

export default interface IAuthService {
	createDefaultApplication: (user:User) => Promise<Application | null>;
}