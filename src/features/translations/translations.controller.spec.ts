import 'reflect-metadata';
import { GUARDS_METADATA } from '@nestjs/common/constants';

import { TranslationsController } from './translations.controller';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';

const handlerGuards = (method: string): unknown[] =>
  Reflect.getMetadata(
    GUARDS_METADATA,
    TranslationsController.prototype[
      method as keyof TranslationsController
    ] as object,
  ) ?? [];

describe('TranslationsController', () => {
  it.each([
    'getTranslations',
    'getOverridesByAppId',
    'setOverrideByAppId',
    'deleteOverrideByAppId',
  ])('protects %s with FirebaseAuthGuard', (method) => {
    expect(handlerGuards(method)).toContain(FirebaseAuthGuard);
  });

  it('keeps compose-arb public: the phone build pipeline downloads the ARB bundle without user credentials', () => {
    expect(handlerGuards('composeArb')).toEqual([]);
  });
});
