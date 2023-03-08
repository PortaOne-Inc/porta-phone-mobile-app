import {Request, Response} from "express"
import {db} from '../config/firebase'

const getUserDefaultTheme = async (req: Request, resp: Response) => {
    const {userId, vendorId} = req.params
    try {
        const vendor = (await db.ref(`/applications/${userId}/${vendorId}`).get()).val();
        const vendorDefaultThemeId = vendor["theme"];
        const vendorThemesDefaultThemeObject = (await db.ref(`/themes/${userId}/${vendorId}/${vendorDefaultThemeId}`).get()).val();
        const buffer = Buffer.from(JSON.stringify(vendorThemesDefaultThemeObject), 'binary');

        return resp.writeHead(200, {
            'Content-Type': "application/json",
            'Content-disposition': 'attachment;filename=' + "theme.json",
            'Content-Length': buffer.length
        }).end(buffer)

    } catch (error) {
        return resp.status(500).json(error)
    }
}

export {getUserDefaultTheme}
