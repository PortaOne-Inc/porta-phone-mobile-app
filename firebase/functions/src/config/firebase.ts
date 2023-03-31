import * as firebase from "firebase/app"
import * as admin from "firebase-admin"
import * as functions from "firebase-functions"
import * as firestore from "firebase-admin/firestore"
import * as auth from "firebase/auth"

const firebaseConfig = require('../../../credentials/firebase_config.json');
const serviceAccount = require('../../../credentials/service_account.json');

firebase.initializeApp(firebaseConfig);

if (process.env.FUNCTIONS_EMULATOR === 'true') {
    auth.connectAuthEmulator(auth.getAuth(), "http://127.0.0.1:7980")
}

admin.initializeApp(serviceAccount);
const db = admin.firestore()
export {admin, functions, firestore, db, auth}
