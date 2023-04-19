import {database} from '../config/firebase';

async function createTheme(theme: Map<string, any>) {
	const reference = await database.collection('themes').doc();
	theme.set('id', reference.id);
	await reference.set(Object.fromEntries(theme));
	return theme;
}

async function patchTheme(theme: Map<string, any>) {
	const reference = await database.collection('theme').doc(theme.get('id'));
	await reference.update(Object.fromEntries(theme));
	const data = (await database.collection('theme').doc(reference.id).get()).data();
	return new Map<string, any>(Object.entries(data!));
}

async function deleteTheme(id: string, applicationId: string) {
	const reference = await database.collection('applications').doc(applicationId);
	const data = await reference.get();
	return new Map<string, any>(Object.entries(data!));
}

async function getThemes(applicationId: string) {
	const reference = (await database.collection('themes')
		.where('applicationId', '==', applicationId).get())
		.docs.map(doc => doc.data());
	return new Map<string, any>(Object.entries(reference!));
}

async function getTheme(id: string) {
	const document = (await database.collection('themes').doc(id).get()).data();
	return new Map<string, any>(Object.entries(document!));
}

async function getDefaultTheme() {
	const app = (await database.collection('static').doc('default_theme').get()).data();
	return new Map<string, string>(Object.entries(app!));
}

export {createTheme, getDefaultTheme, getThemes, getTheme, patchTheme, deleteTheme}
