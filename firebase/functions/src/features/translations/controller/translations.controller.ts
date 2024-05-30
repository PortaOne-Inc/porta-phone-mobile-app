import 'reflect-metadata';

import { NextFunction, Request, Response } from 'express';
import { inject, injectable } from 'inversify';

import ITranslationsService from '../service/translations.service.interface';

import { BaseController } from '../../../core';
import { TYPES } from '../../../di';

// TODO: swagger

@injectable()
export default class TranslationsController extends BaseController {
    translationssService: ITranslationsService;

    constructor(
        @inject(TYPES.TranslationsService) translationssService: ITranslationsService,
    ) {
        super();
        this.translationssService = translationssService;
        this.bindRoute([
            {
                path: '/translations/compose-arb/:appId',
                method: 'get',
                func: this.composeArb,
            },
            {
                path: '/translations',
                method: 'get',
                func: this.getTranslations,
            },
            {
                path: '/translations/overrides/:appId',
                method: 'get',
                func: this.getOverridesByAppId,
            },
            {
                path: '/translations/overrides/:appId',
                method: 'post',
                func: this.setOverrideByAppId,
            },
            {
                path: '/translations/overrides/:appId',
                method: 'delete',
                func: this.deleteOverrideByAppId,
            },

        ],)
    }

    async composeArb(req: Request, res: Response, _: NextFunction) {
        const appId = req.params.appId;
        const result:NodeJS.ReadableStream = await this.translationssService.composeArb(appId);
        result.pipe(res);
    }

    async getTranslations(req: Request, res: Response, _: NextFunction) {
        const result = await this.translationssService.getTranslations();
        this.ok(res, result);
    }

    async getOverridesByAppId(req: Request, res: Response, _: NextFunction) {
        const appId = req.params.appId;
        const result = await this.translationssService.getOverridesByAppId(appId);
        this.ok(res, result);
    }

    async setOverrideByAppId(req: Request, res: Response, _: NextFunction) {
        const appId = req.params.appId;
        const translation = req.body;
        await this.translationssService.setOverrideByAppId(appId, translation);
        this.ok(res, 'ok');
    }

    async deleteOverrideByAppId(req: Request, res: Response, _: NextFunction) {
        const appId = req.params.appId;
        const translation = req.body;
        await this.translationssService.deleteOverrideByAppId(appId, translation);
        this.ok(res, 'ok');
    }
}
