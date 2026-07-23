import { defineString } from 'firebase-functions/params';

export const localizely_download_url = defineString(
  'LOCALIZELY_DOWNLOAD_URL',
).value();
export const localizely_api_key = defineString('LOCALIZELY_API_KEY').value();
