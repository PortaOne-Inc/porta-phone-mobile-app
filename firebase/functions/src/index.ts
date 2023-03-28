import * as functions from 'firebase-functions'
import * as express from 'express'
import * as bodyParser from "body-parser";

import {getThemes, createTheme} from './controllers/themes'
import {createApplication, testAuth, getApplications} from './controllers/applications'
import {parseAuthToken} from './middleware/auth_verefication'
import {validateCreateApplication} from './middleware/validation/application_validation'
import {validateCreateTheme} from "./middleware/validation/theme_validation";

const api = express();
const router = express.Router();

router.use(bodyParser.json());
router.use(bodyParser.urlencoded({extended: false}));

router.get('/users/:userId/applications/:applicationId', (req, res) => getApplications(req, res));
router.post('/users/:userId/applications/:applicationId', (req, res) => createApplication(req, res));
router.get('/users/:userId/applications/:applicationId/themes', (req, res) => getThemes(req, res));
router.post('users/:userId/applications/:applicationId/themes', (req, res) => createTheme(req, res));
router.get('/user/auth', (req, res) => testAuth(req, res));

api.use('/v1', router);
exports.api = functions.https.onRequest(api)
