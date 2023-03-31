import {Request, Response} from "express"
import {db} from '../config/firebase'

const getThemes = async (req: Request, resp: Response) => {
    const {applicationId} = req.params
    try {
        const querySnapshot = await db.collection('themes').where("applicationId", "==", applicationId).get();
        const documents = querySnapshot.docs.map(doc => doc.data());
        return resp.status(200).json(documents);
    } catch (error) {
        return resp.status(500).json(error)
    }
}


const createTheme = async (req: Request, resp: Response) => {
    const {applicationId} = req.params
    try {
        const newDocRef = await db.collection('themes').doc();
        const newDocId = newDocRef.id;

        await newDocRef.set({
            ...req.body,
            ...{
                id: newDocId,
                applicationId: applicationId,
            },
        });

        const theme = (await db.collection('themes').doc(newDocId).get()).data();
        return resp.status(200).json(theme);

    } catch (error) {
        return resp.status(500).json(error)
    }
}

const updateTheme = async (req: Request, resp: Response) => {
    const {themeId} = req.params
    try {
        const newDocRef = await db.collection("themes").doc(themeId);
        await newDocRef.update(req.body);
        const application = (await db.collection('themes').doc(themeId).get()).data();
        return resp.status(200).json(application);

    } catch (error) {
        return resp.status(500).json(error)
    }
}

const getTheme = async (req: Request, resp: Response) => {
    const {themeId} = req.params
    try {
        const newDocRef = (await db.collection('themes').doc(themeId).get()).data();
        return resp.status(200).json(newDocRef);
    } catch (error) {
        return resp.status(500).json(error)
    }
}
const deleteTheme = async (req: Request, resp: Response) => {
    const {themeId, applicationId} = req.params
    try {
        const docRef = await db.collection("applications").doc(applicationId);
        const doc = await docRef.get();
        if (doc.exists) {
            await db.collection('themes').doc(themeId).delete();
            return resp.status(200).json({"status": "ok"});

        } else {
            return resp.status(404).json({"status": "error"});
        }

    } catch (error) {
        return resp.status(500).json(error)
    }
}


export {getThemes, createTheme, updateTheme, getTheme, deleteTheme}
