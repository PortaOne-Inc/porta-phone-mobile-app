import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import * as firestore from 'firebase-admin/firestore'
import * as auth from 'firebase/auth'
import * as firebase from 'firebase/app'

if (process.env.FUNCTIONS_EMULATOR === 'true') {
	firebase.initializeApp(require('../../../credentials/firebase_config.json'));
	auth.connectAuthEmulator(auth.getAuth(), 'http://127.0.0.1:7980')
	admin.initializeApp(require('../../../credentials/service_account.json'));
} else {
	admin.initializeApp();
}

const database = admin.firestore()

export {admin, functions, firestore, database, auth}