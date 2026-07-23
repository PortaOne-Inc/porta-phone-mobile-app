import { Module } from '@nestjs/common';
import * as admin from 'firebase-admin';
import { Storage } from 'firebase-admin/storage';

const FIREBASE_APP = 'FIREBASE_APP';

function ensureFirebaseInitialized(): admin.app.App {
  if (!admin.apps.length) {
    const hasLocalCredentials = !!process.env.GOOGLE_APPLICATION_CREDENTIALS;
    admin.initializeApp({
      credential: hasLocalCredentials
        ? admin.credential.applicationDefault()
        : undefined,
      storageBucket: process.env.FB_STORAGE_BUCKET,
    });
    console.log('Firebase Admin initialized by FirebaseModule');
  }
  return admin.app();
}

@Module({
  providers: [
    { provide: FIREBASE_APP, useFactory: () => ensureFirebaseInitialized() },
    {
      provide: Storage,
      useFactory: () => admin.storage(),
      inject: [FIREBASE_APP],
    },
  ],
  exports: [Storage],
})
export class FirebaseModule {}
