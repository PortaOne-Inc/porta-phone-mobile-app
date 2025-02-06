import { Injectable } from '@nestjs/common';
import * as firebase from 'firebase/app';
import { ConfigService } from '@nestjs/config';
import * as admin from 'firebase-admin';
import serviceAccount from '../../service_account.json';

@Injectable()
export class InitService {
  constructor(private configService: ConfigService) {}

  async initializeDependencies() {
    const firebaseConfig = {
      apiKey: this.configService.get<string>('FB_API_KEY'),
      authDomain: this.configService.get<string>('FB_AUTH_DOMAIN'),
      databaseURL: this.configService.get<string>('FB_DATABASE_URL'),
      projectId: this.configService.get<string>('FB_PROJECT_ID'),
      storageBucket: this.configService.get<string>('FB_STORAGE_BUCKET'),
      messagingSenderId: this.configService.get<string>(
        'FB_MESSAGING_SENDER_ID',
      ),
      appId: this.configService.get<string>('FB_APP_ID'),
    };

    if (!admin.apps.length) {
      admin.initializeApp({
        credential: admin.credential.cert(
          serviceAccount as admin.ServiceAccount,
        ),
      });
      console.log('Firebase admin initialized successfully');
    }

    firebase.initializeApp(firebaseConfig);
    console.log('Firebase client initialized successfully');
  }
}
