import {database} from '../config/firebase';

async function createApplication(application: Map<string, any>) {
	const reference = await database.collection('applications').doc();
	application.set('id', reference.id);
	await reference.set(Object.fromEntries(application));
	const data = (await database.collection('applications').doc(reference.id).get()).data();
	return new Map<string, any>(Object.entries(data!));
}

async function putDefaultApplication(application: Map<string, any>) {
	const reference = await database.collection('static').doc('default_application');
	await reference.set(Object.fromEntries(application));
	const data = (await database.collection('static').doc("default_application").get()).data();
	return new Map<string, any>(Object.entries(data!));
}

async function patchApplication(application: Map<string, any>) {
	const reference = await database.collection('applications').doc(application.get('id'));
	await reference.update(Object.fromEntries(application));
	const data = (await database.collection('applications').doc(reference.id).get()).data();
	return new Map<string, any>(Object.entries(data!));
}

async function getApplication(id: string) {
	const reference = (await database.collection('applications')
		.where('id', '==', id).get()).docs[0].data();
	return new Map<string, any>(Object.entries(reference!));
}

async function getApplications(user: string) {
	const reference = (await database.collection('applications').where('uid', '==', user).get()).docs.map(doc => doc.data());
	return new Map<string, any>(Object.entries(reference!));
}

async function getDefaultApplication() {
	const reference = (await database.collection('static').doc('default_application').get()).data();
	return new Map<string, any>(Object.entries(reference!));
}

export {
	createApplication,
	getDefaultApplication,
	patchApplication,
	getApplication,
	getApplications,
	putDefaultApplication
}
