import 'reflect-metadata';

import {QueryDocumentSnapshot} from 'firebase-functions/lib/providers/firestore';
import {EventContext} from 'firebase-functions/lib/cloud-functions';
import {inject, injectable} from 'inversify';

import BaseTrigger from '../../../core/controllers/base.trigger';
import IStaticService from '../service/static.service.interface';

import {TYPES} from '../../../di';


@injectable()
export default class StaticTrigger extends BaseTrigger {
	constructor(
		@inject(TYPES.StaticService) protected staticService: IStaticService
	) {
		super();
		this.setDatabaseCreateListener('applications/{id}', this.onCreate.bind(this));
	}

	async onCreate(snapshot: QueryDocumentSnapshot, event: EventContext) {
		const result = await this.staticService.createDefaultTheme(snapshot.data().id);
		if (result == null) {
			console.log('No setup of default them');
			return;
		}
	}
}
