import {functions} from '../../../config/firebase'
import {createTheme, getDefaultTheme} from '../../../services/theme';

export const onApplicationCreated = functions.firestore
	.document('applications/{id}')
	.onCreate(async (snap, context) => {
		const myModel = await getDefaultTheme();
		myModel.set('applicationId', snap.data().id)
		await createTheme(myModel)
		return null;
	});

