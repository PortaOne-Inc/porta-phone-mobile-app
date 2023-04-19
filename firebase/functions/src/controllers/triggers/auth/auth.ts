import {functions} from '../../../config/firebase'
import {createApplication, getDefaultApplication} from '../../../services/services'

export const onCreateUser = functions.auth.user().onCreate(async (user) => {
	const defaultApplication = await getDefaultApplication();
	await createApplication(defaultApplication);
});
