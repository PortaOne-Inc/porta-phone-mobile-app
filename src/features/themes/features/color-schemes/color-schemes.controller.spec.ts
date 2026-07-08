import 'reflect-metadata';
import { GUARDS_METADATA } from '@nestjs/common/constants';

import { ColorSchemesController } from './color-schemes.controller';
import { FirebaseAuthGuard } from '../../../auth/guard/firebase-auth.guard';

describe('ColorSchemesController', () => {
  it('is protected by FirebaseAuthGuard at the class level', () => {
    const guards =
      Reflect.getMetadata(GUARDS_METADATA, ColorSchemesController) ?? [];

    expect(guards).toContain(FirebaseAuthGuard);
  });
});
