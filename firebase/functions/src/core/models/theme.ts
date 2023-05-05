import 'reflect-metadata';

import Images from './images';
import Colors from './colors';

export default class Theme {
	public name?: string;
	public id?: string;
	public applicationId?: string;
	public images?: Images;
	public fontFamily?: string;
	public colors?: Colors;
}

