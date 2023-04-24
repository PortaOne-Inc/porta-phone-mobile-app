import {Request, Response} from 'express'

import * as service from '../../services/services'

async function createApplication(req: Request, resp: Response) {
	try {
		const data = await service.createApplication(new Map<string, string>(Object.entries({
			uid: req.user?.uid,
			name: req.body.name,
			platformIdentifier: req.body.platformIdentifier,
			theme: null
		})));
		return resp.status(200).json(Object.fromEntries(data));
	} catch (error) {
		return resp.status(500).json(error)
	}
}

async function putDefaultApplication(req: Request, resp: Response) {
	try {
		const data = await service.putDefaultApplication(new Map<string, string>(Object.entries({
			uid: req.user?.uid,
			name: req.body.name,
			platformIdentifier: req.body.platformIdentifier,
			theme: null
		})));
		return resp.status(200).json(Object.fromEntries(data));
	} catch (error) {
		return resp.status(500).json(error)
	}
}

async function patchApplication(req: Request, resp: Response) {
	const {applicationId} = req.params
	try {
		const data = await service.patchApplication(new Map<string, string>(Object.entries({
			uid: req.user?.uid,
			id: applicationId,
			name: req.body.name,
			platformIdentifier: req.body.platformIdentifier,
			theme: null
		})));
		return resp.status(200).json(Object.fromEntries(data));
	} catch (error) {
		return resp.status(500).json(error)
	}
}

async function getApplication(req: Request, resp: Response) {
	const {applicationId} = req.params
	try {
		const data = await service.getApplication(applicationId);
		return resp.status(200).json(Object.fromEntries(data));
	} catch (error) {
		return resp.status(500).json(error)
	}
}

async function getApplications(req: Request, resp: Response) {
	try {
		const data = await service.getApplications(req.user?.uid!);
		return resp.status(200).json(Array.from(data.values()));
	} catch (error) {
		return resp.status(500).json(error)
	}
}

export {createApplication, getApplication, getApplications, patchApplication, putDefaultApplication}
