// @ts-ignore
const swaggerAutogen = require('swagger-autogen')()

const outputFile = './public/swagger.json'
const endpointsFiles = ['src/features/**/controller/**/*.ts']

// @ts-ignore
const args = process.argv.slice(2);
// @ts-ignore
const host = args.find(arg => arg.startsWith('--host=')).substring(7);


const doc = {
	info: {
		version: '1.0.0',
		title: 'Webtrit configurator api',
	},
	host: host,
	basePath: '/',
	schemes: [ 'https'],
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
			theme: null,
			id: '3kzRn8wqN7KYOgjByBxE',
			platformIdentifier: 'com.webtrit.id'
		},
		ApplicationCreate: {
			name: 'Application',
			platformIdentifier: 'com.webtrit.id'
		}
	}
};


(async () => {
	await swaggerAutogen(outputFile, endpointsFiles, doc);
})();