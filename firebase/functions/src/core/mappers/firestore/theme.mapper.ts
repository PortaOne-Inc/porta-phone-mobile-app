import 'reflect-metadata';

import {firestore} from 'firebase-admin';
import {injectable} from 'inversify';
import {instanceToPlain} from 'class-transformer';

import Theme from '../../models/theme';
import Images from '../../models/images';
import Colors from '../../models/colors';

@injectable()
export default class FirestoreThemeMapper {
	public toClass(data: firestore.DocumentData): Theme {
		const theme = new Theme();
		const images = new Images();
		const colors = new Colors();

		Object.assign(theme, data);
		Object.assign(images, data?.images);
		Object.assign(colors, data?.colors);

		theme.images = images;
		theme.colors = colors;

		return theme;
	}

	// TODO: Do better way for converting obj
	public toPlain(data: Theme) {
		const plainObject: any = {};
		for (const [key, value] of Object.entries(data)) {
			if (value === undefined) {
				plainObject[key] = null;
			} else {
				plainObject[key] = value;
			}
		}
		return instanceToPlain(plainObject);
	}
}
