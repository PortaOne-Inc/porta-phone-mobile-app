import {EventContext} from 'firebase-functions/lib/cloud-functions';
import {QueryDocumentSnapshot} from 'firebase-functions/lib/providers/firestore';

export type OnCreate = (snapshot: QueryDocumentSnapshot, context: EventContext) => PromiseLike<any> | any;
