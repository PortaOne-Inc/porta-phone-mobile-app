import 'reflect-metadata';

import {NextFunction, Request, Response} from 'express';
import {inject, injectable} from 'inversify';

import {BaseController, AuthMiddleware} from '../../../core';

import IStaticService from '../service/static.service.interface';

import Application from '../../../core/models/application';

import {TYPES} from '../../../di';

@injectable()
export default class StaticController extends BaseController {

	constructor(
		@inject(TYPES.StaticService) public staticService: IStaticService,
	) {
		super();
		this.staticService = staticService;
		this.bindRoute([
			{
				path: '/static/themes',
				method: 'get',
				func: this.getTheme,
				middlewares: [new AuthMiddleware()]
			},
			{
				path: '/static/applications',
				method: 'get',
				func: this.getApplication,
				middlewares: [new AuthMiddleware()]
			},
			{
				path: '/static/themes',
				method: 'put',
				func: this.putTheme,
				middlewares: [new AuthMiddleware()]
			},
			{
				path: '/static/applications',
				method: 'put',
				func: this.putApplication,
				middlewares: [new AuthMiddleware()]
			}
		],)
	}

	/*
	#swagger.start
	#swagger.tags = ['Default schemes']
	#swagger.path = '/static/applications'
	#swagger.method = 'get'
	#swagger.description = 'Get default application'
	#swagger.produces = ['application/json']
	#swagger.security = [{
		  "apiKeyAuth": []
		   				}]
  	#swagger.responses[004] = {
      description: 'Application',
      schema: { $ref: '#/definitions/Application' }
  	}
    #swagger.end
    */
	async getApplication(req: Request, res: Response, _: NextFunction) {
		const result = await this.staticService.getApplication();
		if (result == null)
			this.noContent(res);
		else
			this.ok(res, result);
	}

	/*
	#swagger.start
	#swagger.tags = ['Default schemes']
	#swagger.path = '/static/themes'
	#swagger.method = 'get'
	#swagger.description = 'Get default theme'
	#swagger.produces = ['application/json']
	#swagger.security = [{
		  "apiKeyAuth": []
		   				}]
  	#swagger.responses[004] = {
      description: 'Application',
      schema: { $ref: '#/definitions/Theme' }
  	}
    #swagger.end
    */
	async getTheme(req: Request, res: Response, _: NextFunction) {
		const result = await this.staticService.getTheme();
		if (result == null)
			this.noContent(res);
		else
			this.ok(res, result);
	}

	/*
	#swagger.start
	#swagger.tags = ['Default schemes']
	#swagger.path = '/static/applications'
	#swagger.method = 'put'
	#swagger.description = 'Put default application'
	#swagger.produces = ['application/json']
	#swagger.security = [{
		  "apiKeyAuth": []
		   				}]
	#swagger.parameters['obj'] = {
             in: 'body',
             description: 'Put default application',
     		 schema: { $ref: '#/definitions/ApplicationCreate' }
        }
  	#swagger.responses[004] = {
      description: 'Application',
      schema: { $ref: '#/definitions/Application'
      }
  	}
    #swagger.end
    */
	async putApplication(req: Request<{}, {}, Application>, resp: Response) {
		const data = await this.staticService.putApplication(req.body);
		resp.status(200).json(data);
	}

	/*
	#swagger.start
	#swagger.tags = ['Default schemes']
	#swagger.path = '/static/themes'
	#swagger.method = 'put'
	#swagger.description = 'Put default theme'
	#swagger.produces = ['application/json']
	#swagger.security = [{
		  "apiKeyAuth": []
		   				}]
	#swagger.parameters['obj'] = {
             in: 'body',
             description: 'Adding new user.',
     		 schema: { $ref: '#/definitions/Theme' }
        }
  	#swagger.responses[004] = {
      description: 'Application',
      schema: { $ref: '#/definitions/Theme' }
  	}
    #swagger.end
    */
	async putTheme(req: Request, res: Response, _: NextFunction) {
		const data = await this.staticService.putTheme(req.body);
		this.ok(res, data);
	}
}
