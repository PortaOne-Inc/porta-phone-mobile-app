import {functions} from '../config/firebase'


async function bodyIdIgnore(
    req: functions.Request,
    res: functions.Response,
    next: () => void
) {
    delete req.body.id;
    next();
    return res;
}

export {bodyIdIgnore}
