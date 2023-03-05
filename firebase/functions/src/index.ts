import * as functions from 'firebase-functions'
import * as express from 'express'
import * as bodyParser from "body-parser";

import {getThemesByApplicationId} from './controllers/themes'

const api = express();
const router = express.Router();

router.use(bodyParser.json());
router.use(bodyParser.urlencoded({extended: false}));

router.get('/themes/:applicationId/:userId', (req, res) => getThemesByApplicationId(req, res));


api.use('/v1', router);
exports.api = functions.https.onRequest(api)