import * as admin from "firebase-admin"
import * as functions from "firebase-functions"
import * as firestore from "firebase-admin/firestore"

import {
    signInWithEmailAndPassword,
    getAuth,
    connectAuthEmulator,

} from 'firebase/auth'

import {initializeApp} from 'firebase/app';

initializeApp();

admin.initializeApp();


const dbFirestore = admin.firestore()
export {admin, functions, firestore, dbFirestore, signInWithEmailAndPassword, getAuth}
