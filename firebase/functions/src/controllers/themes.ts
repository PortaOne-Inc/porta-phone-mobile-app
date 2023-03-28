import {Request, Response} from "express"
import {dbFirestore} from '../config/firebase'

const getThemes = async (req: Request, resp: Response) => {
    const {applicationId} = req.params
    try {
        const querySnapshot = await dbFirestore.collection('themes').where("applicationId", "==", applicationId).get();
        const documents = querySnapshot.docs.map(doc => doc.data());
        return resp.status(200).json(documents);
    } catch (error) {
        return resp.status(500).json(error)
    }
}


const createTheme = async (req: Request, resp: Response) => {
    const {applicationId} = req.params
    try {
        const newDocRef = await dbFirestore.collection('themes').doc();
        const newDocId = newDocRef.id;

        await newDocRef.set({
            id: newDocId,
            applicationId: applicationId,
            name: req.body.name,
            description: req.body.description,
        });

        const application = (await dbFirestore.collection('themes').doc(newDocId).get()).data();
        return resp.status(200).json(application);

    } catch (error) {
        return resp.status(500).json(error)
    }
}


export {getThemes, createTheme}
