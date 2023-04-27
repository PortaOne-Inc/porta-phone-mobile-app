import {Request, Response} from 'express';
import {string, object} from 'joi';

function validateCreateApplication(req: Request, res: Response, next: () => void) {
	const {error} = object({
		id: string().allow(null),
		name: string().required(),
		theme: string().allow(null),
		platformIdentifier: string().required(),
	}).validate(req.body);

	if (error) {
		return res.status(400).send(error.details[0].message);
	}

	next();
	return;
}

function validatePathApplication(req: Request, res: Response, next: () => void) {
	const {error} = object({
		id: string().optional(),
		name: string().optional(),
		theme: string().allow(null),
	}).validate(req.body);

	if (error) {
		return res.status(400).send(error.details[0].message);
	}

	next();
	return;
}

export {validateCreateApplication, validatePathApplication};
