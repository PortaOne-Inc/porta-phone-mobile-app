import * as functions from 'firebase-functions'
import * as express from 'express'
import * as bodyParser from "body-parser";

import {getThemes, createTheme, updateTheme, getTheme, deleteTheme} from './controllers/themes'
import {
    createApplication,
    getApplications,
    getApplication,
    patchApplication
} from './controllers/applications'
import {authorizationMiddleware} from './middleware/auth_verefication'
import {validateCreateApplication} from './middleware/validation/application_validation'
import {validateCreateTheme} from "./middleware/validation/theme_validation";
import {bodyIdIgnore} from "./middleware/body_id_ignore";

const api = express();
const router = express.Router();

router.use(bodyParser.json());
router.use(bodyParser.urlencoded({extended: false}));
router.use(bodyIdIgnore);

router.get('/applications', authorizationMiddleware, (req, res) => getApplications(req, res));
router.post('/applications', authorizationMiddleware, validateCreateApplication, (req, res) => createApplication(req, res));
router.get('/applications/:applicationId', (req, res) => getApplication(req, res));
router.patch('/applications/:applicationId', authorizationMiddleware, validateCreateApplication, (req, res) => patchApplication(req, res));
router.get('/applications/:applicationId/themes', (req, res) => getThemes(req, res));
router.post('/applications/:applicationId/themes', authorizationMiddleware, validateCreateTheme, (req, res) => createTheme(req, res));
router.patch('/applications/:applicationId/themes/:themeId', authorizationMiddleware, validateCreateTheme, (req, res) => updateTheme(req, res));
router.delete('/applications/:applicationId/themes/:themeId', authorizationMiddleware, (req, res) => deleteTheme(req, res));
router.get('/applications/:applicationId/themes/:themeId', validateCreateTheme, (req, res) => getTheme(req, res));

api.use('/v1', router);
exports.api = functions.https.onRequest(api)
