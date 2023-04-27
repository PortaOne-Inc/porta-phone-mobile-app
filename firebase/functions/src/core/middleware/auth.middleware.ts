import {NextFunction, Request, Response} from 'express';

import {admin} from '../../config/firebase';

import {IMiddleware} from './middleware.interface';

import User from '../models/user';

export class AuthMiddleware implements IMiddleware {
	async execute(req: Request, res: Response, next: NextFunction) {
		const authHeader = req.get('Authorization');
		if (!authHeader) {
			res.status(401).send('Authorization header not found');
		}

		const token = authHeader!.split('Bearer ')[1];
		if (!token) {
			res.status(401).send('Token not found in authorization header');
		}

		try {
			const decodedId = await admin
				.auth()
				.verifyIdToken(token);

			req.user = new User(decodedId.uid)
			next();

		} catch (error) {
			res.status(401).send('Invalid token');
		}
	}

}