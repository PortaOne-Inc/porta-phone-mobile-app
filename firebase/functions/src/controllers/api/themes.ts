import {Request, Response} from 'express'

import * as service from '../../services/services'

async function getThemes(req: Request, resp: Response) {
	const {applicationId} = req.params
	try {
		const data = await service.getThemes(applicationId);
		return resp.status(200).json(Array.from(data.values()));
	} catch (error) {
		return resp.status(500).json(error)
	}
}

async function getTheme(req: Request, resp: Response) {
	const {themeId} = req.params
	try {
		const data = await service.getTheme(themeId);
		return resp.status(200).json(Object.fromEntries(data));
	} catch (error) {
		return resp.status(500).json(error)
	}
}

async function createTheme(req: Request, resp: Response) {
	const {applicationId} = req.params
	try {
		const data = await service.createTheme(new Map<string, string>(Object.entries({
			...req.body,
			...{
				applicationId: applicationId,
			},
		})));

		return resp.status(200).json(Object.fromEntries(data));

	} catch (error) {
		return resp.status(500).json(error)
	}
}

async function patchTheme(req: Request, resp: Response) {
	const {themeId} = req.params
	try {
		const data = await service.patchTheme(new Map<string, string>(Object.entries({
			...req.body,
			...{
				id: themeId
			},
		})));
		return resp.status(200).json(Object.fromEntries(data));
	} catch (error) {
		return resp.status(500).json(error)
	}

}

async function deleteTheme(req: Request, resp: Response) {
	const {themeId, applicationId} = req.params
	try {
		const data = await service.deleteTheme(themeId, applicationId);
		return resp.status(200).json(Object.fromEntries(data));
	} catch (error) {
		return resp.status(500).json(error)
	}
}

export {getThemes, createTheme, patchTheme, getTheme, deleteTheme}
