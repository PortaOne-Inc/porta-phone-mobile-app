import 'reflect-metadata';

import {firestore} from 'firebase-admin';
import {inject, injectable} from 'inversify';

import {admin} from '../../../config/firebase';

import IStaticRepository from './static.repository.interface';

import FirestoreThemeMapper from '../../../core/mappers/firestore/theme.mapper';
import FirestoreApplicationMapper from '../../../core/mappers/firestore/application.mapper';

import Theme from '../../../core/models/theme';
import Application from '../../../core/models/application';

import {TYPES} from '../../../di';


@injectable()
export default class StaticRepository implements IStaticRepository {
	private collection: firestore.CollectionReference;

	constructor(
		@inject(TYPES.FirestoreThemeMapper) public themeMapper: FirestoreThemeMapper,
		@inject(TYPES.FirestoreApplicationMapper) public applicationMapper: FirestoreApplicationMapper,
	) {
		this.collection = admin.firestore().collection('static');
	}

	async getApplication(): Promise<Application | null> {
		const reference = (await this.collection.doc('application').get());
		if (reference.exists) {
			return this.applicationMapper.toClass(reference);
		} else {
			return null;
		}
	}

	async putApplication(application: Application): Promise<Application> {
		const reference = await this.collection.doc('application');
		await reference.set(this.applicationMapper.toPlain(application));
		return application;
	}

	async getTheme(): Promise<Theme | null> {
		const reference = (await this.collection.doc('theme').get());
		if (reference.exists) {
			return this.themeMapper.toClass(reference.data()!);
		} else {
			return null;
		}
	}

	async putTheme(theme: Theme): Promise<Theme> {
		const reference = await this.collection.doc('theme');
		await reference.set(this.themeMapper.toPlain(theme));
		return theme;
	}
}
