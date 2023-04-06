import {Request, Response} from 'express';
import * as Joi from "joi";

function validateCreateTheme(req: Request, res: Response, next: () => void) {
    const {error} = Joi.object({
        id: Joi.string().allow(null),
        name: Joi.string(),
        fontFamily: Joi.string().allow(null),
        colors: Joi.object({
            primary: Joi.string().allow(null),
            onPrimary: Joi.string().allow(null),
            primaryContainer: Joi.string().allow(null),
            onPrimaryContainer: Joi.string().allow(null),
            secondary: Joi.string().allow(null),
            onSecondary: Joi.string().allow(null),
            secondaryContainer: Joi.string().allow(null),
            onSecondaryContainer: Joi.string().allow(null),
            tertiary: Joi.string().allow(null),
            onTertiary: Joi.string().allow(null),
            tertiaryContainer: Joi.string().allow(null),
            error: Joi.string().allow(null),
            onError: Joi.string().allow(null),
            errorContainer: Joi.string().allow(null),
            onErrorContainer: Joi.string().allow(null),
            outline: Joi.string().allow(null),
            outlineVariant: Joi.string().allow(null),
            background: Joi.string().allow(null),
            onBackground: Joi.string().allow(null),
            surface: Joi.string().allow(null),
            onSurface: Joi.string().allow(null),
            surfaceVariant: Joi.string().allow(null),
            onSurfaceVariant: Joi.string().allow(null),
            inverseSurface: Joi.string().allow(null),
            shadow: Joi.string().allow(null),
            scrim: Joi.string().allow(null),
            surfaceTint: Joi.string().allow(null),
            gradientTabColor: Joi.array().items(Joi.string()).allow(null),
        },),
        images: Joi.object({
            onboarding: Joi.string().allow(null),
            applicationLogo: Joi.string().allow(null),
            notificationLogo: Joi.string().allow(null),
            adaptiveIconBackground: Joi.string().allow(null),
            adaptiveIconForeground: Joi.string().allow(null),
            androidLauncherIcon: Joi.string().allow(null),
            iosLauncherIcon: Joi.string().allow(null),
            webLauncherIcon: Joi.string().allow(null),
        },)
    }).validate(req.body);

    if (error) {
        return res.status(400).send(error.details[0].message);
    }
    next();
    return;
}

export {validateCreateTheme};
