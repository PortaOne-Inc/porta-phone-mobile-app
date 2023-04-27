import {Container, ContainerModule, interfaces} from 'inversify';

import IStaticRepository from '../features/static/repository/static.repository.interface';
import IApplicationRepository from '../features/applications/repository/application.repository.interface';
import ApplicationRepository from '../features/applications/repository/application.repository';
import IThemeRepository from '../features/themes/repository/themes.repository.interface';
import ThemeRepository from '../features/themes/repository/themes.repository';
import StaticRepository from '../features/static/repository/static.repository';

import IExceptionFilter from '../core/errorrs/exception.filter.interface';
import ExceptionFilter from '../core/errorrs/exception.filter';

import {BaseController} from '../core';
import ThemeController from '../features/themes/controller/theme.controller';
import ApplicationController from '../features/applications/controller/application.controller';
import StaticController from '../features/static/controller/static.controller';

import StaticTrigger from '../features/static/controller/static.trigger';
import AuthTrigger from '../features/auth/contoller/auth.trigger';
import BaseTrigger from '../core/controllers/base.trigger';

import StaticService from '../features/static/service/static.service';
import IApplicationsService from '../features/applications/service/applications.service.interface';
import ApplicationsService from '../features/applications/service/applications.service';
import ThemesService from '../features/themes/service/themes.service';
import IThemesService from '../features/themes/service/themes.service.interface';
import IStaticService from '../features/static/service/static.service.interface';

import {TYPES} from './types';
import {App} from '../app';
import IAuthService from '../features/auth/service/auth.service.interface';
import AuthService from '../features/auth/service/auth.service';
import FirestoreThemeMapper from '../core/mappers/firestore/theme.mapper';
import FirestoreApplicationMapper from '../core/mappers/firestore/application.mapper';

const exceptionModule = new ContainerModule((bind: interfaces.Bind) => {
	bind<IExceptionFilter>(TYPES.ExceptionFilter).to(ExceptionFilter);
});


const mappersModule = new ContainerModule((bind: interfaces.Bind) => {
	bind<FirestoreApplicationMapper>(TYPES.FirestoreApplicationMapper).to(FirestoreApplicationMapper);
	bind<FirestoreThemeMapper>(TYPES.FirestoreThemeMapper).to(FirestoreThemeMapper);
});

const controllerModule = new ContainerModule((bind: interfaces.Bind) => {
	bind<BaseController>(TYPES.ApplicationController).to(ApplicationController);
	bind<BaseController>(TYPES.StaticController).to(StaticController);
	bind<BaseController>(TYPES.ThemeController).to(ThemeController);
	bind<BaseTrigger>(TYPES.ApplicationTrigger).to(StaticTrigger);
});

const serviceModule = new ContainerModule((bind: interfaces.Bind) => {
	bind<IStaticService>(TYPES.StaticService).to(StaticService);
	bind<IAuthService>(TYPES.AuthService).to(AuthService);
	bind<IApplicationsService>(TYPES.ApplicationsService).to(ApplicationsService);
	bind<IThemesService>(TYPES.ThemeService).to(ThemesService);
});

const repositoryModule = new ContainerModule((bind: interfaces.Bind) => {
	bind<IStaticRepository>(TYPES.StaticRepository).to(StaticRepository);
	bind<IThemeRepository>(TYPES.ThemeRepository).to(ThemeRepository).inSingletonScope();
	bind<IApplicationRepository>(TYPES.ApplicationRepository).to(ApplicationRepository).inSingletonScope();
});

const componentsModule = new ContainerModule((bind: interfaces.Bind) => {
	bind<App>(TYPES.Applications).to(App);
	bind<AuthTrigger>(TYPES.AuthTrigger).to(AuthTrigger);

});

export const appContainer = new Container();

appContainer.load(mappersModule, exceptionModule, repositoryModule, controllerModule, serviceModule, componentsModule)
