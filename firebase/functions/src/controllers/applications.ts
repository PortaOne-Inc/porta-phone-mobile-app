import {Request, Response} from "express"
import {db} from '../config/firebase'

const createApplication = async (req: Request, resp: Response) => {
    try {
        const newDocRef = await db.collection('applications').doc();
        const newDocId = newDocRef.id;

        await newDocRef.set({
            uid: req.user?.uid,
            name: req.body.name,
            platformIdentifier: req.body.platformIdentifier,
            id: newDocId,
            theme: null
        });

        const application = (await db.collection('applications').doc(newDocId).get()).data();
        return resp.status(200).json(application);

    } catch (error) {
        return resp.status(500).json(error)
    }
}

const patchApplication = async (req: Request, resp: Response) => {
    const {applicationId} = req.params
    try {
        const newDocRef = await db.collection("applications").doc(applicationId);
        await newDocRef.update(req.body);
        const application = (await db.collection('applications').doc(applicationId).get()).data();
        return resp.status(200).json(application);
    } catch (error) {
        return resp.status(500).json(error)
    }
}

const getApplication = async (req: Request, resp: Response) => {
    const {applicationId} = req.params
    try {
        const newDocRef = (await db.collection('applications')
            .where("id", "==", applicationId).get()).docs[0].data();
        return resp.status(200).json(newDocRef);
    } catch (error) {
        return resp.status(500).json(error)
    }
}

const getApplications = async (req: Request, resp: Response) => {
    try {
        const querySnapshot = await db.collection('applications').where("uid", "==", req.user?.uid).get();
        const documents = querySnapshot.docs.map(doc => doc.data());
        return resp.status(200).json(documents);
    } catch (error) {
        return resp.status(500).json(error)
    }
}


export {createApplication, getApplication, getApplications, patchApplication}
