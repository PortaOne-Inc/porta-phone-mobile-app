import {functions} from '../../config/firebase'

export const themeCreated = functions.firestore
	.document('themes/{id}')
	.onCreate(async (snap, context) => {
		return null;
	});
