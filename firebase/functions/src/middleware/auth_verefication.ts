import {functions, admin} from '../config/firebase'

async function authorizationMiddleware(
    req: functions.Request,
    res: functions.Response,
    next: () => void
) {
    const authHeader = req.get('Authorization');
    if (!authHeader) {
        return res.status(401).send('Authorization header not found');
    }

    const token = authHeader.split('Bearer ')[1];
    if (!token) {
        return res.status(401).send('Token not found in authorization header');
    }

    try {
        const decodedToken = await admin
            .auth()
            .verifyIdToken(token);
        req.user = decodedToken;
        console.log(`Res:: ${decodedToken}`);
        next();
        return res;

    } catch (error) {
        console.error('Error verifying token:', error);
        return res.status(401).send('Invalid token');
    }
}

export {authorizationMiddleware}
