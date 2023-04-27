import User from '../../../core/models/user';
import Theme from '../../../core/models/theme';

export default interface IThemesService {
	createTheme: (applicationId: string, theme: Theme) => Promise<Theme | null>;
	patchTheme: (theme: Theme, userDto: User) => Promise<Theme | null>;
	patch: (applicationId: string, themeId: string, theme: Theme) => Promise<Theme | null>;
	getByThemeId: (applicationId: string, id: string) => Promise<Theme | null>;
	getByApplicationId: (id: string) => Promise<Theme[]>;
}