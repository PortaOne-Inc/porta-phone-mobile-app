import 'reflect-metadata';

import {injectable} from 'inversify';
import {auth, firestore} from 'firebase-admin';

import {functions} from '../../config/firebase';

import {OnCreate} from './trigger.events';

@injectable()
export default abstract class BaseTrigger {
	auth?: functions.CloudFunction<auth.UserRecord>;
	database?: functions.CloudFunction<firestore.QueryDocumentSnapshot>;

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