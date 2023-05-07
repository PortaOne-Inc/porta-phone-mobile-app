import Theme from '../../../core/models/theme';

export default interface IThemeRepository {
	create: (application: Theme) => Promise<Theme>;
	patch: (application: Theme) => Promise<Theme>;
	delete: (themeId: string) => Promise<void | null>;
	get: (id: string) => Promise<Theme | null>;
	getByApplicationsId: (id: string) => Promise<Theme[]>;
}
