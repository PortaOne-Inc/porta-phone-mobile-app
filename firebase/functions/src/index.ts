import * as functions from 'firebase-functions'
import * as express from 'express'
import * as bodyParser from "body-parser";

import {getApplication, getApplicationTheme} from './controllers/themes'

const api = express();
const router = express.Router();

router.use(bodyParser.json());
router.use(bodyParser.urlencoded({extended: false}));

router.get('/user/:userId/application/:applicationId', (req, res) => getApplication(req, res));
router.get('/user/:userId/application/:applicationId/theme', (req, res) => getApplicationTheme(req, res));

api.use('/v1', router);
exports.api = functions.https.onRequest(api)
