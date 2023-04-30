import 'reflect-metadata';

import {inject, injectable} from 'inversify';
import {NextFunction, Request, Response} from 'express';

import {BaseController, AuthMiddleware} from '../../../core';

import ApplicationsService from '../service/applications.service';

import Application from '../../../core/models/application';

import {TYPES} from '../../../di';


@injectable()
export default class ApplicationController extends BaseController {

	constructor(
		@inject(TYPES.ApplicationsService) protected applicationsService: ApplicationsService
	) {
		super();
		this.bindRoute([
			{
				path: '/applications',
				method: 'get',
				func: this.getApplications,
				middlewares: [new AuthMiddleware()]
			},
			{
				path: '/applications/:applicationId',
				method: 'get',
				func: this.getApplicationsById,
				middlewares: [new AuthMiddleware()]
			},
			{
				path: '/applications/:applicationId',
				method: 'patch',
				func: this.patchApplication,
				middlewares: [new AuthMiddleware()]
			},
			{
				path: '/applications',
				method: 'post',
				func: this.createApplication,
				middlewares: [new AuthMiddleware()]
			},
			{
				path: '/applications',
				method: 'patch',
				func: this.createApplication,
				middlewares: [new AuthMiddleware()]
			},
			{
				path: '/applications/:applicationId/version',
				method: 'put',
				func: this.incrementVersion,
				middlewares: [new AuthMiddleware()]
			},
		],)
	}

	/*
	#swagger.start
	#swagger.tags = ['Applications']
	#swagger.path = '/applications'
	#swagger.method = 'get'
	#swagger.description = 'Get all user applications'
	#swagger.produces = ['application/json']
	#swagger.security = [{
		  "apiKeyAuth": []
		   				}]
    #swagger.end
    */
	async getApplications(req: Request, res: Response, _: NextFunction) {
		const data = await this.applicationsService.getApplications(req.user!);
		this.ok(res, data);
	}

	/*
	#swagger.start
	#swagger.tags = ['Applications']
	#swagger.path = '/applications'
	#swagger.method = 'post'
	#swagger.description = 'Create user application'
	#swagger.produces = ['application/json']
	#swagger.security = [{
		  "apiKeyAuth": []
		   				}]

	#swagger.parameters['obj'] = {
             in: 'body',
             description: 'Adding new applications.',
     		 schema: { $ref: '#/definitions/ApplicationCreate' }
        }

    #swagger.responses[004] = {
      description: 'Applications response',
      schema: { $ref: '#/definitions/Application' }
  	}
    #swagger.end
    */
	async createApplication({body, user}: Request<{}, {}, Application>, res: Response, _: NextFunction) {
		const result = await this.applicationsService.createApplication(body, user!);
		this.ok(res, result);
	}

	/*
	#swagger.start
	#swagger.tags = ['Applications']
	#swagger.path = '/applications/{applicationId}/version'
	#swagger.method = 'put'
	#swagger.description = 'Update application version'
	#swagger.produces = ['application/json']
	#swagger.security = [{
		  "apiKeyAuth": []
		   				}]
	#swagger.parameters['applicationId'] = {
            in: 'path',
            type: 'string',
            description: 'Application ID.' }
    #swagger.responses[004] = {
      description: 'Applications response',
      schema: { $ref: '#/definitions/Application' }
  	}
    #swagger.end
    */
	async incrementVersion(req: Request, res: Response, _: NextFunction) {
		const result = await this.applicationsService.incrementVersion(req.params.applicationId);
		if (result == null) {
			this.noContent(res);
		} else {
			this.ok(res, result);
		}
	}

	/*
	#swagger.start
	#swagger.tags = ['Applications']
	#swagger.path = '/applications/{applicationId}'
	#swagger.method = 'patch'
	#swagger.description = 'Update applications by id'
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
             description: 'Update applications by id',
     		 schema: { $ref: '#/definitions/ApplicationCreate' }
        }
    #swagger.responses[004] = {
      description: 'Application response',
      schema: { $ref: '#/definitions/Application' }
  	}
    #swagger.end
    */
	async patchApplication({params, body}: Request, resp: Response) {
		const data = await this.applicationsService.patchApplication(params.applicationId, body);
		resp.status(200).json(data);
	}

	/*
	#swagger.start
	#swagger.tags = ['Applications']
	#swagger.path = '/applications/{applicationId}'
	#swagger.method = 'get'
	#swagger.description = 'Get application by id'
	#swagger.produces = ['application/json']
	#swagger.security = [{
		  "apiKeyAuth": []
		   				}]
	#swagger.parameters['applicationId'] = {
            in: 'path',
            type: 'string',
            description: 'Application ID.' }
    #swagger.end
    */
	async getApplicationsById(req: Request, res: Response, _: NextFunction) {
		const result = await this.applicationsService.getApplicationById(req.params.applicationId);
		this.ok(res, result);
	}
}
