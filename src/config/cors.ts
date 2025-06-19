const ORIGINS = [
  'http://localhost',
  /http:\/\/localhost:\d+/,
  'https://configurator.webtrit.com',
  'https://webtrit-configurator-stage.web.app',
  'https://webtrit-configurator-stage.firebaseapp.com',
  'https://webtrit-configurator.web.app',
  'https://configurator.webtrit.com',
  'https://webtrit-configurator.firebaseapp.com',
];

export const Cors = {
  origin: ORIGINS,
  corsMethods: '*',
  corsAllowedHeaders: '*',
  globalPrefix: 'v1',
};
