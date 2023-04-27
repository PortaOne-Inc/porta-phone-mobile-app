import Application from '../../../core/models/application';
import Theme from '../../../core/models/theme';

export default interface IStaticRepositoryInterface {
	putApplication: (application: Application) => Promise<Application>;
	getApplication: () => Promise<Application | null>;
	putTheme: (application: Theme) => Promise<Theme>;
	getTheme: () => Promise<Theme | null>;
}