import * as functions from 'firebase-functions'
import * as express from 'express'
import * as bodyParser from "body-parser";

import {getThemes, createTheme, updateTheme, getTheme, deleteTheme} from './controllers/themes'
import {createApplication, testAuth, getApplications, getApplication} from './controllers/applications'
import {parseAuthToken} from './middleware/auth_verefication'
import {validateCreateApplication} from './middleware/validation/application_validation'
import {validateCreateTheme} from "./middleware/validation/theme_validation";
import {bodyIdIgnore} from "./middleware/body_id_ignore";

const api = express();
const router = express.Router();

router.use(bodyParser.json());
router.use(bodyParser.urlencoded({extended: false}));

router.get('/applications', parseAuthToken, (req, res) => getApplications(req, res));
router.post('/applications', parseAuthToken, validateCreateApplication, (req, res) => createApplication(req, res));
router.get('/applications/:applicationId', (req, res) => getApplication(req, res));
router.get('/applications/:applicationId/themes', (req, res) => getThemes(req, res));
router.post('/applications/:applicationId/themes', parseAuthToken, validateCreateTheme, (req, res) => createTheme(req, res));
router.patch('/applications/:applicationId/themes/:themeId', parseAuthToken, validateCreateTheme, bodyIdIgnore, (req, res) => updateTheme(req, res));
router.delete('/applications/:applicationId/themes/:themeId', parseAuthToken, (req, res) => deleteTheme(req, res));
router.get('/applications/:applicationId/themes/:themeId', validateCreateTheme, (req, res) => getTheme(req, res));
router.get('/user/auth', (req, res) => testAuth(req, res));

api.use('/v1', router);
exports.api = functions.https.onRequest(api)
