import {Request, Response} from "express"
import {db} from '../config/firebase'

const getApplication = async (req: Request, resp: Response) => {
    const {userId, applicationId} = req.params
    try {
        const application = (await db.ref(`/applications/${userId}/${applicationId}`).get()).val();
        const buffer = Buffer.from(JSON.stringify(application), 'binary');

        return resp.writeHead(200, {
            'Content-Type': "application/json",
            'Content-disposition': 'attachment;filename=' + "theme.json",
            'Content-Length': buffer.length
        }).end(buffer)

    } catch (error) {
        return resp.status(500).json(error)
    }
}

const getApplicationTheme = async (req: Request, resp: Response) => {
    const {userId, applicationId} = req.params
    try {
        const application = (await db.ref(`/applications/${userId}/${applicationId}`).get()).val();
        const theme = application["theme"];
        const buffer = Buffer.from(JSON.stringify(theme), 'binary');

        return resp.writeHead(200, {
            'Content-Type': "application/json",
            'Content-disposition': 'attachment;filename=' + "theme.json",
            'Content-Length': buffer.length
        }).end(buffer)

    } catch (error) {
        return resp.status(500).json(error)
    }
}

export {getApplicationTheme, getApplication}
