const ORIGINS = [
  'http://localhost',
  /http:\/\/localhost:\d+/,
  'https://configurator.webtrit.com',
  'https://webtrit-configurator-stage.web.app',
];

export const CONFIG = {
  origin: ORIGINS,
  corsMethods: '*',
  corsAllowedHeaders: '*',
  globalPrefix: 'v1',
};
