import Theme from '../../../core/models/theme';

export default interface IThemeRepository {
	create: (application: Theme) => Promise<Theme>;
	patch: (application: Theme) => Promise<Theme>;
	getByThemeId: (applicationId: string, id: string) => Promise<Theme | null>;
	getByApplicationsId: (id: string) => Promise<Theme[]>;
}