import * as express from 'express'
import {createTheme, deleteTheme, getTheme, getThemes, patchTheme, putDefaultTheme} from '../controllers/api/themes';
import {authorizationMiddleware} from '../middleware/auth/auth_verefication';
import {validateCreateTheme} from '../middleware/validation/theme_validation';

export const router = express.Router();

router.get('/:applicationId/themes', (req, res) =>
	getThemes(req, res));
router.post('/:applicationId/themes', authorizationMiddleware, validateCreateTheme, (req, res) =>
	createTheme(req, res));
router.put('/default/themes/default', authorizationMiddleware, validateCreateTheme, (req, res) =>
	putDefaultTheme(req, res));
router.patch('/:applicationId/themes/:themeId', authorizationMiddleware, validateCreateTheme, (req, res) =>
	patchTheme(req, res));
router.delete('/:applicationId/themes/:themeId', authorizationMiddleware, (req, res) =>
	deleteTheme(req, res));
router.get('/:applicationId/themes/:themeId', validateCreateTheme, (req, res) =>
	getTheme(req, res));

