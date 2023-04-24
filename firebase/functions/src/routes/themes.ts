import * as express from 'express'
import {createTheme, deleteTheme, getTheme, getThemes, patchTheme} from '../controllers/api/themes';
import {authorizationMiddleware} from '../middleware/auth/auth_verefication';
import {validateCreateTheme} from '../middleware/validation/theme_validation';

export const router = express.Router();

router.get('/applications/:applicationId/themes', (req, res) =>
	getThemes(req, res));
router.post('/applications/:applicationId/themes', authorizationMiddleware, validateCreateTheme, (req, res) =>
	createTheme(req, res));
router.patch('/applications/:applicationId/themes/:themeId', authorizationMiddleware, validateCreateTheme, (req, res) =>
	patchTheme(req, res));
router.patch('/applications/default/themes/default', authorizationMiddleware, validateCreateTheme, (req, res) =>
	patchTheme(req, res));
router.delete('/applications/:applicationId/themes/:themeId', authorizationMiddleware, (req, res) =>
	deleteTheme(req, res));
router.get('/applications/:applicationId/themes/:themeId', validateCreateTheme, (req, res) =>
	getTheme(req, res));

