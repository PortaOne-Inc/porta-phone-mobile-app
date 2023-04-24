import * as functions from 'firebase-functions'
import * as express from 'express'
import * as bodyParser from 'body-parser';
import * as cors from 'cors';
import * as timeout from 'connect-timeout';

import {bodyIdIgnoreMiddleware} from './middleware/middleware'

import {router as themesRouter} from './routes/applications';
import {router as applicationsRouter} from './routes/themes';

const api = express();
const router = express.Router();

router.use(cors());
router.use(bodyParser.json());
router.use(bodyParser.urlencoded({extended: false}));
router.use(bodyIdIgnoreMiddleware);

api.use(timeout('30s'));
api.use('/v1', router);

router.use('/applications', themesRouter);
router.use('/applications', applicationsRouter);

exports.api = functions.https.onRequest(api)

export {triggers} from './controllers/controllers'
