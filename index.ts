import { NestFactory } from '@nestjs/core';
import { ExpressAdapter } from '@nestjs/platform-express';
import * as express from 'express';
import * as functions from 'firebase-functions';
import { AppModule } from './src/app.module';
import { CONFIG } from './config';

const expressServer = express();

const createFunction = async (expressInstance): Promise<void> => {
  const app = await NestFactory.create(
    AppModule,
    new ExpressAdapter(expressInstance),
  );

  app.enableCors({
    origin: CONFIG.origin,
    methods: CONFIG.corsMethods,
    allowedHeaders: CONFIG.corsAllowedHeaders,
  });
  await app.setGlobalPrefix('v1');
  await app.init();
};

// TODO(SERDUN): Change this variable name to 'api' after migrating to nest all features
export const newapi = functions.https.onRequest(async (request, response) => {
  await createFunction(expressServer);
  expressServer(request, response);
});
