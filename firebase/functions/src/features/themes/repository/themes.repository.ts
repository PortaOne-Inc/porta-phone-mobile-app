import 'reflect-metadata';

import {inject, injectable} from 'inversify';
import {firestore} from 'firebase-admin';

import {admin} from '../../../config/firebase';

import IThemeRepository from './themes.repository.interface';

import {TYPES} from '../../../di';

import FirestoreThemeMapper from '../../../core/mappers/firestore/theme.mapper';
import FirestoreApplicationMapper from '../../../core/mappers/firestore/application.mapper';

import Theme from '../../../core/models/theme';


@injectable()
export default class ThemeRepository implements IThemeRepository {
	private collection: firestore.CollectionReference;

	constructor(
		@inject(TYPES.FirestoreThemeMapper) public themeMapper: FirestoreThemeMapper,
		@inject(TYPES.FirestoreApplicationMapper) public applicationMapper: FirestoreApplicationMapper,
	) {
		this.collection = admin.firestore().collection('themes');
	}

	async create(theme: Theme): Promise<Theme> {
		const reference = await this.collection.doc();
		theme.id = reference.id;
		await reference.set(this.themeMapper.toPlain(theme));
		return theme;
	}

	async patch(theme: Theme): Promise<Theme> {
		const reference = await this.collection.doc(theme.id!);
		await reference.update(this.themeMapper.toPlain(theme));
		return theme;
	}

	async getByThemeId(applicationId: string, id: string): Promise<Theme | null> {
		const reference = (await this.collection.doc(id).get());
		if (reference.exists) {
			return this.themeMapper.toClass(reference.data()!);
		} else {
			return null;
		}
	}

	async getThemes(user: string) {
		const reference = (await this.collection.where('uid', '==', user).get()).docs.map(doc => doc.data());
		return reference.map((snapshot) => this.themeMapper.toClass(snapshot))!;
	}

	async getByApplicationsId(id: string): Promise<Theme[]> {
		return (await this.collection.where('applicationId', '==', id).get())
			.docs.map(doc => this.themeMapper.toClass(doc.data()));
	}
}