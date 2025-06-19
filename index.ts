import { NestFactory } from '@nestjs/core';
import { ExpressAdapter } from '@nestjs/platform-express';
import express from 'express';
import * as functions from 'firebase-functions';
import { AppModule } from './src/app.module';
import { Cors } from './src/config/cors';
import { Express } from 'express-serve-static-core';
import * as admin from 'firebase-admin';
import serviceAccount from './service_account.json';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

const expressServer = express();

function maybeInitializeFirebaseAdmin() {
  if (!admin.apps.length) {
    admin.initializeApp({
      credential: admin.credential.cert(serviceAccount as admin.ServiceAccount),
    });
    console.log('Firebase initialized');
  }
}

const createFunction = async (expressInstance: Express): Promise<void> => {
  const app = await NestFactory.create(
    AppModule,
    new ExpressAdapter(expressInstance),
  );

  app.setGlobalPrefix('v1');
  app.enableCors({
    origin: Cors.origin,
    methods: Cors.corsMethods,
    allowedHeaders: Cors.corsAllowedHeaders,
  });
  const config = new DocumentBuilder()
    .setTitle('WebTrit App Configurator')
    .setVersion('0.1')
    .addBearerAuth()
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('swagger-ui', app, document);

  maybeInitializeFirebaseAdmin();

  await app.init();
};

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export const api = functions.https.onRequest(async (request, response) => {
  await createFunction(expressServer);
  expressServer(request, response);
});

interface UserRolesDocumentData extends admin.firestore.DocumentData {
  updatedAt?: admin.firestore.Timestamp;
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export const mirrorUserRoles = functions.firestore
  .document('userRoles/{uid}')
  .onWrite(async (change, context) => {
    const beforeData: UserRolesDocumentData = change.before.data() || {};
    const afterData: UserRolesDocumentData = change.after.data() || {};
    // to avoid infinite loops
    const skipUpdate =
      beforeData.updatedAt &&
      afterData.updatedAt &&
      !beforeData.updatedAt.isEqual(afterData.updatedAt);
    if (skipUpdate) {
      console.log('No changes');
      return;
    }
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    const { updatedAt, ...newClaims } = afterData;
    const uid = context.params.uid;
    console.log(`Setting role to custom claims for ${uid} user`, newClaims);

    maybeInitializeFirebaseAdmin();

    await admin.auth().setCustomUserClaims(uid, newClaims);
    console.log('Updating document timestamp');

    await change.after.ref.update({
      updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      ...newClaims,
    });
  });
