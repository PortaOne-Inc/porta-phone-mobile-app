import { NestFactory } from '@nestjs/core';
import { ExpressAdapter } from '@nestjs/platform-express';
import express from 'express';
import * as functions from 'firebase-functions';
import { AppModule } from './src/app.module';
import { Express } from 'express-serve-static-core';
import * as admin from 'firebase-admin';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AllExceptionsFilter } from './src/common/filters';
import { ZodValidationPipe } from 'nestjs-zod';

import * as dotenv from 'dotenv';
import * as path from 'path';
import * as fs from 'fs';

// Load env files (.env.<NODE_ENV> then .env)
dotenv.config({path: `.env.${process.env.NODE_ENV ?? 'dev'}`});
dotenv.config();

// Normalize GOOGLE_APPLICATION_CREDENTIALS to absolute path (if provided)
if (process.env.GOOGLE_APPLICATION_CREDENTIALS) {
    const p = process.env.GOOGLE_APPLICATION_CREDENTIALS;
    if (!path.isAbsolute(p)) {
        process.env.GOOGLE_APPLICATION_CREDENTIALS = path.resolve(process.cwd(), p);
    }
    if (!fs.existsSync(process.env.GOOGLE_APPLICATION_CREDENTIALS)) {
        console.error(
            '[BOOT] GOOGLE_APPLICATION_CREDENTIALS does not exist:',
            process.env.GOOGLE_APPLICATION_CREDENTIALS
        );
    } else {
        console.log('[BOOT] Using GOOGLE_APPLICATION_CREDENTIALS:', process.env.GOOGLE_APPLICATION_CREDENTIALS);
    }
}

const expressServer = express();

/**
 * Initialize Firebase Admin using:
 * - applicationDefault() when GOOGLE_APPLICATION_CREDENTIALS is set (local/CI),
 * - default initializeApp() in Cloud Functions (uses project ADC).
 */
function maybeInitializeFirebaseAdmin() {
    if (admin.apps.length) return;

    const hasLocalCredentials = !!process.env.GOOGLE_APPLICATION_CREDENTIALS;

    admin.initializeApp({
        credential: hasLocalCredentials ? admin.credential.applicationDefault() : undefined,
        storageBucket: process.env.FB_STORAGE_BUCKET, // optional
    });

    console.log(
        hasLocalCredentials
            ? `Firebase initialized with ADC (${process.env.NODE_ENV ?? 'dev'})`
            : 'Firebase initialized with default credentials (Cloud Functions)'
    );
}

const createFunction = async (expressInstance: Express): Promise<void> => {
    // Ensure Admin initialized before Nest starts using it anywhere
    maybeInitializeFirebaseAdmin();

    const app = await NestFactory.create(AppModule, new ExpressAdapter(expressInstance));

    const trustedOrigins = readCorsOriginsFromEnv();
    console.log('[BOOT] CORS trusted origins:', trustedOrigins);

    const allowlist: (string | RegExp)[] = [
        ...trustedOrigins,
        /^https:\/\/phone-configurator-[\w-]+\.web\.app$/, // all versioned configurator deploys
        /^https?:\/\/localhost(?::\d+)?$/,
        /^https?:\/\/127\.0\.0\.1(?::\d+)?$/,
    ];
    app.enableCors({
        origin: (origin, cb) => {
            if (!origin) return cb(null, true); // Postman/healthchecks
            const ok = allowlist.some(o =>
                o instanceof RegExp ? o.test(origin) : o === origin,
            );
            if (ok) return cb(null, true);
            console.warn('[CORS] Blocked origin:', origin);
            return cb(new Error(`CORS blocked: ${origin}`));
        },
        credentials: true,
        methods: 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS',
        allowedHeaders: 'Content-Type, Authorization, X-Requested-With',
    });

    expressInstance.use((req, res, next) => {
        if (req.method === 'OPTIONS') return res.sendStatus(204);
        next();
    });
    app.useGlobalFilters(new AllExceptionsFilter());
    app.useGlobalPipes(new ZodValidationPipe());
    app.setGlobalPrefix('v1');

    const config = new DocumentBuilder()
        .setTitle('WebTrit App Configurator')
        .setVersion('0.1')
        .addBearerAuth()
        .build();

    const document = SwaggerModule.createDocument(app, config);
    SwaggerModule.setup('swagger-ui', app, document);

    await app.init();
};

// HTTPS API
export const api = functions.https.onRequest(async (request, response) => {
    await createFunction(expressServer);
    expressServer(request, response);
});

interface UserRolesDocumentData extends admin.firestore.DocumentData {
    updatedAt?: admin.firestore.Timestamp;
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars -- used by Firebase runtime (trigger), not by imports
// noinspection JSUnusedGlobalSymbols
export const mirrorUserRoles = functions.firestore
    .document('userRoles/{uid}')
    .onWrite(async (change, context) => {
        const beforeData: UserRolesDocumentData = change.before.data() || {};
        const afterData: UserRolesDocumentData = change.after.data() || {};

        // Avoid infinite loops based on timestamp
        const skipUpdate =
            beforeData.updatedAt &&
            afterData.updatedAt &&
            !beforeData.updatedAt.isEqual(afterData.updatedAt);

        if (skipUpdate) {
            console.log('No changes');
            return;
        }

        const {updatedAt, ...newClaims} = afterData;
        const uid = context.params.uid;

        console.log(`Setting role to custom claims for ${uid}`, newClaims);

        maybeInitializeFirebaseAdmin();

        await admin.auth().setCustomUserClaims(uid, newClaims);
        console.log('Updating document timestamp');

        await change.after.ref.update({
            updatedAt: admin.firestore.FieldValue.serverTimestamp(),
            ...newClaims,
        });
    });


function readCorsOriginsFromEnv(): string[] {
    const raw = process.env.CORS_ORIGINS ?? '';
    const list = raw
        .split(/[, \n\r\t]+/)
        .map((s) => s.trim())
        .filter(Boolean);
    return list;
}
