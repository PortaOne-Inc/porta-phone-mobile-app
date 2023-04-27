import User from '../../../core/models/user';

declare global {
	namespace Express {
		interface Request {
			user?: User;
		}
	}
}
