import { Global, Module } from '@nestjs/common';
import { CloudStorageService } from './cloud-storage.service';
import { Storage } from 'firebase-admin/storage';
import * as admin from 'firebase-admin';

@Global()
@Module({
  providers: [
    CloudStorageService,
    {
      provide: Storage,
      useFactory: () => admin.storage(),
    },
  ],
  exports: [CloudStorageService],
})
export class CloudStorageModule {}
