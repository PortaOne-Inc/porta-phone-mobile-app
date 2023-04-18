import * as functions from 'firebase-functions'
import * as express from 'express'
import * as bodyParser from "body-parser";
import * as cors from "cors";

import * as applicationValidation from './middleware/validation/application_validation'
import * as themeValidation from './middleware/validation/theme_validation'

import * as themeController from './controllers/api/themes'
import * as applicationController from './controllers/api/applications'

import {authorizationMiddleware} from './middleware/auth_verefication'
import {bodyIdIgnoreMiddleware} from "./middleware/body_id_ignore";

const api = express();
const router = express.Router();

router.use(cors());
router.use(bodyParser.json());
router.use(bodyParser.urlencoded({extended: false}));
router.use(bodyIdIgnoreMiddleware);

router.get('/applications',
    authorizationMiddleware, (req, res) =>
        applicationController.getApplications(req, res));
router.post('/applications',
    authorizationMiddleware, applicationValidation.validateCreateApplication, (req, res) =>
        applicationController.createApplication(req, res));
router.get('/applications/:applicationId',
    (req, res) =>
        applicationController.getApplication(req, res));
router.patch('/applications/:applicationId',
    authorizationMiddleware, applicationValidation.validatePathApplication, (req, res) =>
        applicationController.patchApplication(req, res));
router.get('/applications/:applicationId/themes',
    (req, res) =>
        themeController.getThemes(req, res));
router.post('/applications/:applicationId/themes',
    authorizationMiddleware, themeValidation.validateCreateTheme, (req, res) =>
        themeController.createTheme(req, res));
router.patch('/applications/:applicationId/themes/:themeId',
    authorizationMiddleware, themeValidation.validateCreateTheme, (req, res) =>
        themeController.updateTheme(req, res));
router.delete('/applications/:applicationId/themes/:themeId',
    authorizationMiddleware, (req, res) =>
        themeController.deleteTheme(req, res));
router.get('/applications/:applicationId/themes/:themeId',
    themeValidation.validateCreateTheme, (req, res) =>
        themeController.getTheme(req, res));

api.use('/v1', router);
exports.api = functions.https.onRequest(api)
