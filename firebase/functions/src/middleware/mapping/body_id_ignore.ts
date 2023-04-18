import {functions} from '../../config/firebase'

async function bodyIdIgnoreMiddleware(
    req: functions.Request,
    res: functions.Response,
    next: () => void
) {
    delete req?.body?.id;
    next();
    return res;
}

export {bodyIdIgnoreMiddleware}
