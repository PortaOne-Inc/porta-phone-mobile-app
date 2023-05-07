import 'reflect-metadata';

import {NextFunction, Request, Response} from 'express';
import {inject, injectable} from 'inversify';

import {BaseController} from '../../../core';
import {AuthMiddleware} from '../../../core';
import IThemesService from '../service/themes.service.interface';

import {TYPES} from '../../../di';

@injectable()
export default class ThemeController extends BaseController {
	themesService: IThemesService;

	constructor(
		@inject(TYPES.ThemeService) themesService: IThemesService,
	) {
		super();
		this.themesService = themesService;
		this.bindRoute([
			{
				path: '/applications/:applicationId/themes',
				method: 'get',
				func: this.getThemesByApplicationId,
			},
			{
				path: '/applications/:applicationId/themes/:themeId',
				method: 'get',
				func: this.getThemeById,
			},
			{
				path: '/applications/:applicationId/themes/:themeId',
				method: 'get',
				func: this.getThemeByApplication,
			},
			{
				path: '/applications/:applicationId/themes',
				method: 'post',
				func: this.createTheme,
				middlewares: [new AuthMiddleware()]
			},
			{
				path: '/applications/:applicationId/themes/:themeId',
				method: 'patch',
				func: this.patchTheme,
				middlewares: [new AuthMiddleware()]
			},
			{
				path: '/applications/:applicationId/themes/:themeId',
				method: 'delete',
				func: this.deleteTheme,
				middlewares: [new AuthMiddleware()]
			},

		],)
	}

	/*
	#swagger.start
	#swagger.tags = ['Themes']
	#swagger.path = '/applications/{applicationId}/themes'
	#swagger.method = 'get'
	#swagger.description = 'Get application by themes'
	#swagger.produces = ['application/json']
	#swagger.parameters['applicationId'] = {
            in: 'path',
            type: 'string',
            description: 'Application ID.' }
    #swagger.end
    */
	async getThemesByApplicationId(req: Request, res: Response, _: NextFunction) {
		const data = await this.themesService.getByApplicationId(req!.params!.applicationId!);
		this.ok(res, data);
	}

	/*
	#swagger.start
	#swagger.tags = ['Themes']
	#swagger.path = '/applications/{applicationId}/themes'
	#swagger.method = 'post'
	#swagger.description = 'Create application theme'
	#swagger.produces = ['application/json']
	#swagger.security = [{
		  "apiKeyAuth": []
		   				}]
	#swagger.parameters['applicationId'] = {
            in: 'path',
            type: 'string',
            description: 'Application ID.' }

 	#swagger.parameters['obj'] = {
             in: 'body',
             description: 'Adding new user.',
     		 schema: { $ref: '#/definitions/Theme' }
        }

    #swagger.responses[004] = {
      description: 'Theme',
      schema: { $ref: '#/definitions/Theme' }
  	}
    #swagger.end
    */
	async createTheme(req: Request, res: Response, _: NextFunction) {
		const result = await this.themesService.createTheme(req.params.applicationId, req.body!);
		this.ok(res, result);
	}

	/*
	#swagger.start
	#swagger.tags = ['Themes']
	#swagger.path = '/applications/{applicationId}/themes/{themeId}'
	#swagger.method = 'patch'
	#swagger.description = 'Create application theme'
	#swagger.produces = ['application/json']
	#swagger.security = [{
		  "apiKeyAuth": []
		   				}]
	#swagger.parameters['applicationId'] = {
            in: 'path',
            type: 'string',
            description: 'Application ID.' }

    #swagger.parameters['themeId'] = {
            in: 'path',
            type: 'string',
            description: 'Theme ID.' }

 	#swagger.parameters['obj'] = {
             in: 'body',
             description: 'Adding new user.',
     		 schema: { $ref: '#/definitions/Theme' }
        }

    #swagger.responses[004] = {
      description: 'Theme',
      schema: { $ref: '#/definitions/Theme' }
  	}
    #swagger.end
    */

	// TODO: Add params validation
	async patchTheme(req: Request, res: Response) {
		const applicationId = req.params!.applicationId;
		const themeId = req.params!.themeId;
		const result = await this.themesService.patchById(applicationId, themeId, req.body);
		this.ok(res, result);
	}


	/*
	#swagger.start
	#swagger.tags = ['Themes']
	#swagger.path = '/applications/{applicationId}/themes/{themeId}'
	#swagger.method = 'delete'
	#swagger.description = 'Delete theme by id'
	#swagger.produces = ['application/json']
	#swagger.security = [{
		  "apiKeyAuth": []
		   				}]
	#swagger.parameters['applicationId'] = {
            in: 'path',
            type: 'string',
            description: 'Application ID.' }

    #swagger.parameters['themeId'] = {
            in: 'path',
            type: 'string',
            description: 'Theme ID.' }
        }

    #swagger.responses[004] = {
      description: 'Application response',
      schema: { $ref: '#/definitions/Application' }
  	}
    #swagger.end
    */
	async deleteTheme(req: Request, resp: Response) {
		const applicationId = req.params!.applicationId;
		const themeId = req.params!.themeId;
		const user = req.user;

		const result = await this.themesService.deleteTheme(applicationId, themeId, user!);

		if (result === undefined) {
			this.ok(resp, 'Theme deleted successfully')
		} else {
			this.noContent(resp)
		}
	}

	/*
	#swagger.start
	#swagger.tags = ['Themes']
	#swagger.path = '/applications/{applicationId}/themes'
	#swagger.method = 'get'
	#swagger.description = 'Get default application theme'
	#swagger.produces = ['application/json']
	#swagger.parameters['applicationId'] = {
            in: 'path',
            type: 'string',
            description: 'Application ID.' }
    #swagger.end
    */
	async getThemeByApplication(req: Request, res: Response, _: NextFunction) {
		const result = await this.themesService.getByApplicationId(req.params.applicationId);
		this.ok(res, result);
	}

	/*
	#swagger.start
	#swagger.tags = ['Themes']
	#swagger.path = '/applications/{applicationId}/themes/{themeId}'
	#swagger.method = 'get'
	#swagger.description = 'Get theme by id'
	#swagger.produces = ['application/json']
	#swagger.parameters['applicationId'] = {
            in: 'path',
            type: 'string',
            description: 'Application ID.' }

    #swagger.parameters['themeId'] = {
            in: 'path',
            type: 'string',
            description: 'Theme ID.' }
        }

    #swagger.responses[004] = {
      description: 'Theme',
      schema: { $ref: '#/definitions/Theme' }
  	}
    #swagger.end
    */
	async getThemeById(req: Request, res: Response, _: NextFunction) {
		const applicationId = req.params!.applicationId;
		const themeId = req.params!.themeId;
		const result = await this.themesService.getByThemeId(applicationId, themeId);
		if (result == null)
			this.noContent(res);
		else
			this.ok(res, result);
	}
}
