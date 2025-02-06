import { Collection } from 'fireorm';

@Collection('translations')
export class Translation {
  id: string;
  appId: string;
  locale: string;
  key: string;
  value: string;
}
