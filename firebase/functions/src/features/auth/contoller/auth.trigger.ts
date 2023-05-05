import 'reflect-metadata';

import {EventContext} from 'firebase-functions';
import {inject, injectable} from 'inversify';

import BaseTrigger from '../../../core/controllers/base.trigger';

import {auth} from 'firebase-admin';

import AuthService from '../service/auth.service';

import User from '../../../core/models/user';

import {TYPES} from '../../../di';

@injectable()
export default class AuthTrigger extends BaseTrigger {
	constructor(
		@inject(TYPES.AuthService) private authService: AuthService,
	) {
		super();
		this.auth = this.getAuth().onCreate(this.onCreate.bind(this))
	}

	async onCreate(change: auth.UserRecord, context: EventContext) {
		const user = new User(change?.uid!)!;
		const result = await this.authService.createDefaultApplication(user);
		if (result == null) {
			console.log('No setup of default application');
			return;
		}
	}
}
