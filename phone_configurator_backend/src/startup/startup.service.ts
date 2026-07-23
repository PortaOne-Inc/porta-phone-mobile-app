import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import * as firebase from 'firebase/app';
import * as admin from 'firebase-admin';

@Injectable()
export class StartupService {
    constructor(private configService: ConfigService) {
    }

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
            const hasLocalCredentials = !!process.env.GOOGLE_APPLICATION_CREDENTIALS;
            admin.initializeApp({
                credential: hasLocalCredentials
                    ? admin.credential.applicationDefault()
                    : undefined,
                storageBucket: firebaseConfig.storageBucket,
            });
            console.log('Firebase Admin initialized (StartupService)');
        }

        if (!firebase.getApps().length) {
            firebase.initializeApp(firebaseConfig);
            console.log('Firebase client initialized (StartupService)');
        }
    }
}
