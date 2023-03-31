import {Request, Response} from "express"
import {dbFirestore, signInWithEmailAndPassword, getAuth} from '../config/firebase'

const testAuth = async (req: Request, resp: Response) => {
    try {
        const res = await signInWithEmailAndPassword(getAuth(), "qwerty@gmail.com", "qwerty");
        const buffer = Buffer.from(JSON.stringify(res.user), 'binary');

        console.log(res.user.toJSON())
        // @ts-ignore
        return resp.writeHead(200, {
            'Content-Type': "application/json",
            'Content-disposition': 'attachment;filename=' + "theme.json",
            'Content-Length': buffer.length
        }).end(buffer)

    } catch
        (error) {
        return resp.status(500).json(error)
    }
}

const createApplication = async (req: Request, resp: Response) => {
    try {
        const newDocRef = await dbFirestore.collection('applications').doc();
        const newDocId = newDocRef.id;

        await newDocRef.set({
            uid: req.user?.uid,
            name: req.body.name,
            platformIdentifier: req.body.platformIdentifier,
            id: newDocId,
            theme: null
        });

        const application = (await dbFirestore.collection('applications').doc(newDocId).get()).data();
        return resp.status(200).json(application);

    } catch (error) {
        return resp.status(500).json(error)
    }
}

const patchApplication = async (req: Request, resp: Response) => {
    const {applicationId} = req.params
    try {
        const newDocRef = await dbFirestore.collection("applications").doc(applicationId);
        await newDocRef.update(req.body);
        const application = (await dbFirestore.collection('applications').doc(applicationId).get()).data();
        return resp.status(200).json(application);
    } catch (error) {
        return resp.status(500).json(error)
    }
}

const getApplication = async (req: Request, resp: Response) => {
    const {applicationId} = req.params
    try {
        const newDocRef = (await dbFirestore.collection('applications')
            .where("id", "==", applicationId).get()).docs[0].data();
        return resp.status(200).json(newDocRef);
    } catch (error) {
        return resp.status(500).json(error)
    }
}

const getApplications = async (req: Request, resp: Response) => {
    try {
        const querySnapshot = await dbFirestore.collection('applications').where("uid", "==", req.user?.uid).get();
        const documents = querySnapshot.docs.map(doc => doc.data());
        return resp.status(200).json(documents);
    } catch (error) {
        return resp.status(500).json(error)
    }
}


export {createApplication, getApplication, getApplications, testAuth, patchApplication}
