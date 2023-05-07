// @ts-ignore
const swaggerAutogen = require('swagger-autogen')()

const outputFile = './public/swagger.json'
const endpointsFiles = ['src/features/**/controller/**/*.ts']

// @ts-ignore
const args = process.argv.slice(2);

// Define default values for the host and scheme parameters
let host = '127.0.0.1:7981/webtrit-configurator-stage/us-central1/api/v1';
let scheme = 'https';

// Parse the command line arguments
args.forEach(arg => {
	if (arg.startsWith('--host=')) {
		host = arg.substring(7);
	} else if (arg.startsWith('--scheme=')) {
		scheme = arg.substring(9);
	}
});


const doc = {
	info: {
		version: '1.0.1',
		title: 'Webtrit configurator api',
	},
	host: host,
	basePath: '/',
	schemes: [scheme],
	consumes: ['application/json'],
	produces: ['application/json'],
	tags: [
		{
			name: 'Organization',
			description: 'Endpoints',
		},
	],
	securityDefinitions: {
		apiKeyAuth: {
			type: 'apiKey',
			in: 'header',
			name: 'Authorization',
			description: 'any description...',
		},
	},
	definitions: {
		Theme: {
			name: 'Winter style',
			id: 'YKsDyoZde7PoqIjaQnMD',
			applicationId: 'frfdsYNuRUuJ0RUVJk1E',
			fontFamily: 'Aboreto',
			images: {
				adaptiveIconBackground: null,
				iosLauncherIcon: null,
				onboarding: null,
				androidLauncherIcon: null,
				notificationLogo: null,
				applicationLogo: null,
				adaptiveIconForeground: null,
				webLauncherIcon: null
			},
			colors: {
				onPrimary: '#ff021d31',
				onSurface: '#ff5a89ad',
				surface: '#ff466791',
				onSecondaryContainer: '#ff08416e',
				secondaryContainer: '#ff25455d',
				tertiary: '#ff202223',
				error: '#ff142d42',
				secondary: '#ff0c3747',
				outline: '#ff1f4c6f',
				background: '#ff7a91a6',
				onBackground: '#ffb9b9b9',
				gradientTabColor: [
					'#ffe8f0f6',
					'#ffc6f0e0'
				],
				primary: '#ff4a9de0'
			}
		},
		Application: {
			uid: 'CBAlTVH7YzWWauK8KqWF4gclwmt1',
			name: 'Application',
			version: 0,
			theme: null,
			id: '3kzRn8wqN7KYOgjByBxE',
			platformIdentifier: 'com.webtrit.id'
		},
		ApplicationCreate: {
			name: 'Application',
			version: 0,
			platformIdentifier: 'com.webtrit.id'
		}
	}
};

(async () => {
	await swaggerAutogen(outputFile, endpointsFiles, doc);
})();