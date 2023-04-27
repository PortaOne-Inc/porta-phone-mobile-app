import 'reflect-metadata';

import {injectable} from 'inversify';
import {auth} from 'firebase-admin';
import {QueryDocumentSnapshot} from 'firebase-functions/lib/providers/firestore';

import {functions} from '../../config/firebase';

import {OnCreate} from './trigger.events';

@injectable()
export default abstract class BaseTrigger {
	auth?: functions.CloudFunction<auth.UserRecord>;
	database?: functions.CloudFunction<QueryDocumentSnapshot>;

	protected setDatabaseCreateListener(path: string, event: OnCreate) {
		this.database = this.getFirestore().document(path).onCreate(event);
	}

	protected getFirestore() {
		return functions.firestore;
	}

	protected getAuth() {
		return functions.auth.user();
	}
}