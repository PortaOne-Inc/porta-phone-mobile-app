import {functions} from '../../../config/firebase'

export const onThemeCreated = functions.firestore
	.document('themes/{id}')
	.onCreate(async (snap, context) => {
		return null;
	});
