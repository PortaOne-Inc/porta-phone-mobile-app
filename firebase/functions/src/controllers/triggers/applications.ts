import {functions} from '../../config/firebase'

export const applicationCreated = functions.firestore
	.document('applications/{id}')
	.onCreate(async (snap, context) => {
		return null;
	});
