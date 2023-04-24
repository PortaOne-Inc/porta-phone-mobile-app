import * as express from 'express'
import {authorizationMiddleware} from '../middleware/auth/auth_verefication';
import {
	createApplication,
	getApplication,
	getApplications,
	patchApplication,
	putDefaultApplication
} from '../controllers/api/applications';
import {validateCreateApplication, validatePathApplication} from '../middleware/validation/application_validation';

export const router = express.Router();

router.get('/', authorizationMiddleware, (req, res) =>
	getApplications(req, res));
router.post('/', authorizationMiddleware, validateCreateApplication, (req, res) =>
	createApplication(req, res));
router.get('/:applicationId', (req, res) =>
	getApplication(req, res));
router.patch('/:applicationId', authorizationMiddleware, validatePathApplication, (req, res) =>
	patchApplication(req, res));
router.put('/default', authorizationMiddleware, (req, res) =>
	putDefaultApplication(req, res));

