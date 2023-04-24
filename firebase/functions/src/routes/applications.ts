import * as express from 'express'
import {authorizationMiddleware} from '../middleware/auth/auth_verefication';
import {createApplication, getApplication, getApplications, patchApplication} from '../controllers/api/applications';
import {validateCreateApplication, validatePathApplication} from '../middleware/validation/application_validation';

export const router = express.Router();

router.get('/applications', authorizationMiddleware, (req, res) =>
	getApplications(req, res));
router.post('/applications', authorizationMiddleware, validateCreateApplication, (req, res) =>
	createApplication(req, res));
router.get('/applications/:applicationId', (req, res) =>
	getApplication(req, res));
router.patch('/applications/:applicationId', authorizationMiddleware, validatePathApplication, (req, res) =>
	patchApplication(req, res));
router.patch('/applications/default', authorizationMiddleware, validatePathApplication, (req, res) =>
	patchApplication(req, res));

