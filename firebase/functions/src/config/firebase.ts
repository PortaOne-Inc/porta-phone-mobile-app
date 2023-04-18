import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import * as firestore from 'firebase-admin/firestore'

admin.initializeApp();
const database = admin.firestore()

export {admin, functions, firestore, database}
