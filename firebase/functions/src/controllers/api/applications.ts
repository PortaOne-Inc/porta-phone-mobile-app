import {Request, Response} from 'express'
import {database} from '../../config/firebase'

async function createApplication(req: Request, resp: Response) {
	try {
		const newDocRef = await database.collection('applications').doc();
		const newDocId = newDocRef.id;

		await newDocRef.set({
			uid: req.user?.uid,
			name: req.body.name,
			platformIdentifier: req.body.platformIdentifier,
			id: newDocId,
			theme: null
		});

		const application = (await database.collection('applications').doc(newDocId).get()).data();
		return resp.status(200).json(application);

	} catch (error) {
		return resp.status(500).json(error)
	}
}

async function patchApplication(req: Request, resp: Response) {
	const {applicationId} = req.params
	try {
		const newDocRef = await database.collection('applications').doc(applicationId);
		await newDocRef.update(req.body);
		const application = (await database.collection('applications').doc(applicationId).get()).data();
		return resp.status(200).json(application);
	} catch (error) {
		return resp.status(500).json(error)
	}
}

async function getApplication(req: Request, resp: Response) {
	const {applicationId} = req.params
	try {
		const newDocRef = (await database.collection('applications')
			.where('id', '==', applicationId).get()).docs[0].data();
		return resp.status(200).json(newDocRef);
	} catch (error) {
		return resp.status(500).json(error)
	}
}

async function getApplications(req: Request, resp: Response) {
	try {
		const querySnapshot = await database.collection('applications').where('uid', '==', req.user?.uid).get();
		const documents = querySnapshot.docs.map(doc => doc.data());
		return resp.status(200).json(documents);
	} catch (error) {
		return resp.status(500).json(error)
	}
}

export {createApplication, getApplication, getApplications, patchApplication,}
