import {Request, Response} from 'express';
import * as Joi from "joi";

function validateCreateTheme(req: Request, res: Response, next: () => void) {
    const {error} = Joi.object({
        name: Joi.string().required(),
        description: Joi.string(),
    }).validate(req.body);

    if (error) {
        return res.status(400).send(error.details[0].message);
    }

    next();
    return;
}

export {validateCreateTheme};