import Application from '../../../core/models/application';
import Theme from '../../../core/models/theme';

export default interface IStaticService {
	// API
	getApplication: () => Promise<Application | null>;
	putApplication: (application: Application) => Promise<Application | null>;
	getTheme: () => Promise<Theme | null>;
	putTheme: (theme: Theme) => Promise<Theme | null>;

	// Triggers
	createDefaultTheme: (applicationId: string) => Promise<Theme | null>;


}