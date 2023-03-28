import {Request, Response} from 'express';
import * as Joi from "joi";

function validateCreateApplication(req: Request, res: Response, next: () => void) {
    const {error} = Joi.object({
        name: Joi.string().required(),
        platformIdentifier: Joi.string().required(),
        defaultTheme: Joi.string(),
    }).validate(req.body);

    if (error) {
        return res.status(400).send(error.details[0].message);
    }

    next();
    return;
}

export {validateCreateApplication};