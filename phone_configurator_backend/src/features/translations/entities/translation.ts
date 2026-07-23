import { Collection } from 'fireorm';
import { Collections } from '../../../common';

@Collection(Collections.translations)
export class Translation {
  id!: string;
  applicationId!: string;
  locale!: string;
  key!: string;
  value!: string;
}
