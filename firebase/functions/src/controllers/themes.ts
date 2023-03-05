import {Request, Response} from "express"
import {db} from '../config/firebase'


const getThemesByApplicationId = async (req: Request, resp: Response) => {
    const {applicationId, userId} = req.params
    try {
        const database = (await db.ref(`/applications/${userId}/${applicationId}`).get()).val();
        const databaseTheme = (await db.ref(`/themes/${userId}/${database["theme"]}`).get()).val();

        const file = Buffer.from(JSON.stringify(databaseTheme), 'binary');

        resp.writeHead(200, {
            'Content-Type': "application/json",
            'Content-disposition': 'attachment;filename=' + "theme.json",
            'Content-Length': file.length
        });

        return resp.end(file)

    } catch (error) {
        return resp.status(500).json(error)
    }
}

export {getThemesByApplicationId}