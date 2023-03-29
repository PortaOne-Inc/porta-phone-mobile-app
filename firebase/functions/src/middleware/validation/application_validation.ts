import {Request, Response} from 'express';
import * as Joi from "joi";

function validateCreateApplication(req: Request, res: Response, next: () => void) {
    const {error} = Joi.object({
        id: Joi.string().allow(null),
        name: Joi.string().required(),
        theme: Joi.string().allow(null),
        platformIdentifier: Joi.string().required(),
        defaultTheme: Joi.string().allow(null),
    }).validate(req.body);

    if (error) {
        return res.status(400).send(error.details[0].message);
    }

    next();
    return;
}

export {validateCreateApplication};