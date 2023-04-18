import * as functions from 'firebase-functions'
import * as express from 'express'
import * as bodyParser from 'body-parser';
import * as cors from 'cors';

import {
	getApplications,
	createApplication,
	patchApplication,
	getApplication,
	getThemes,
	getTheme,
	createTheme,
	updateTheme,
	deleteTheme
} from './controllers/controllers'

import {
	bodyIdIgnoreMiddleware,
	authorizationMiddleware,
	validateCreateApplication,
	validatePathApplication,
	validateCreateTheme,
} from './middleware/middleware'


const api = express();
const router = express.Router();

router.use(cors());
router.use(bodyParser.json());
router.use(bodyParser.urlencoded({extended: false}));
router.use(bodyIdIgnoreMiddleware);

router.get('/applications', authorizationMiddleware, (req, res) =>
	getApplications(req, res));
router.post('/applications', authorizationMiddleware, validateCreateApplication, (req, res) =>
	createApplication(req, res));
router.get('/applications/:applicationId', (req, res) =>
	getApplication(req, res));
router.patch('/applications/:applicationId', authorizationMiddleware, validatePathApplication, (req, res) =>
	patchApplication(req, res));
router.get('/applications/:applicationId/themes', (req, res) =>
	getThemes(req, res));
router.post('/applications/:applicationId/themes', authorizationMiddleware, validateCreateTheme, (req, res) =>
	createTheme(req, res));
router.patch('/applications/:applicationId/themes/:themeId', authorizationMiddleware, validateCreateTheme, (req, res) =>
	updateTheme(req, res));
router.delete('/applications/:applicationId/themes/:themeId', authorizationMiddleware, (req, res) =>
	deleteTheme(req, res));
router.get('/applications/:applicationId/themes/:themeId', validateCreateTheme, (req, res) =>
	getTheme(req, res));

api.use('/v1', router);

exports.api = functions.https.onRequest(api)

export {triggers} from './controllers/controllers'
