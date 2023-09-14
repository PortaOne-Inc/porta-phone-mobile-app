import 'reflect-metadata';

import {inject, injectable} from 'inversify';
import {firestore} from 'firebase-admin';

import {admin} from '../../../config/firebase';

import IApplicationRepository from './application.repository.interface';

import FirestoreThemeMapper from '../../../core/mappers/firestore/theme.mapper';
import FirestoreApplicationMapper from '../../../core/mappers/firestore/application.mapper';

import Application from '../../../core/models/application';

import {TYPES} from '../../../di';

@injectable()
export default class ApplicationRepository implements IApplicationRepository {
	private collection: firestore.CollectionReference;

	constructor(
		@inject(TYPES.FirestoreThemeMapper) public themeMapper: FirestoreThemeMapper,
		@inject(TYPES.FirestoreApplicationMapper) public applicationMapper: FirestoreApplicationMapper,
	) {
		this.collection = admin.firestore().collection('applications');
		console.log(themeMapper);
	}

	async create(application: Application): Promise<Application> {
		const reference = await this.collection.doc();
		application.id = reference.id;
		await reference.set(this.applicationMapper.toPlain(application));
		return application;
	}

	async patch(id: string, application: Application): Promise<Application> {
		const reference = await this.collection.doc(id);
		await reference.update(this.applicationMapper.toPlain(application));
		return application;
	}

	async delete(id: string): Promise<void> {
		const reference = await this.collection.doc(id);
		await reference.delete();
		return;
	}

	// TODO: Handle moment when no application with id
	async getById(id: string): Promise<Application | null> {
		const reference = (await this.collection.doc(id).get());
		return this.applicationMapper.toClass(reference);
	}

	async getByUser(id: string): Promise<Application[] | null> {
		const reference = (await this.collection.where('user', '==', id).get()).docs;
		return reference.map((snapshot) => this.applicationMapper.toClass(snapshot));
	}
}
