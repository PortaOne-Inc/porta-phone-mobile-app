import 'reflect-metadata';

import * as swaggerUiExpress from 'swagger-ui-express';
import * as express from 'express'
import * as cors from 'cors';
import * as bodyParser from 'body-parser';
import {inject, injectable} from 'inversify';

import ApplicationController from './features/applications/controller/application.controller';
import ThemeController from './features/themes/controller/theme.controller';
import StaticController from './features/static/controller/static.controller';
import TranslationsController from './features/translations/controller/translations.controller';

import ExceptionFilter from './core/errorrs/exception.filter';
import StaticTrigger from './features/static/controller/static.trigger';
import AuthTrigger from './features/auth/contoller/auth.trigger';

import {TYPES} from './di';

@injectable()
export class App {
	app: express.Express;
	router: express.Router;

	constructor(
		@inject(TYPES.ApplicationController) private readonly applicationController: ApplicationController,
		@inject(TYPES.ThemeController) private readonly themeController: ThemeController,
		@inject(TYPES.StaticController) private readonly staticController: StaticController,
		@inject(TYPES.TranslationsController) public readonly translationsController: TranslationsController,
		@inject(TYPES.ApplicationTrigger) public readonly applicationTrigger: StaticTrigger,
		@inject(TYPES.ExceptionFilter) private readonly exceptionFilter: ExceptionFilter,
		@inject(TYPES.AuthTrigger) public readonly authTrigger: AuthTrigger,
	) {
		this.app = express();
		this.router = express.Router();
	}

	useRoutes() {
		this.router.use('/', this.applicationController.router);
		this.router.use('/', this.themeController.router);
		this.router.use('/', this.staticController.router);
		this.router.use('/', this.translationsController.router);
	}


	useMiddleware() {
		this.router.use(cors());
		this.router.use(bodyParser.json());
		this.router.use(bodyParser.urlencoded({extended: false}));
	}

	useDoc() {
		const opts = {
			swaggerOptions: {
				persistAuthorization: true,
			},
		};
		const swaggerJsonPath = require('../public/swagger.json');
		this.app.use('/docs', swaggerUiExpress.serve, swaggerUiExpress.setup(swaggerJsonPath, opts));
	}

	useExceptionFilter() {
		this.app.use(this.exceptionFilter.catch.bind(this.exceptionFilter))
	}

	init() {
		this.app.use('/v1', this.router);
		this.app.use(express.static('public'));		
		this.useDoc()
		this.useMiddleware();
		this.useRoutes();
		this.useExceptionFilter();
	}
}
