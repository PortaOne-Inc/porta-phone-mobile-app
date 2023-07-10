import 'reflect-metadata';

import {firestore} from 'firebase-admin';
import {injectable} from 'inversify';
import {instanceToPlain} from 'class-transformer';

import Application from '../../models/application';

@injectable()
export default class FirestoreApplicationMapper {
    public toClass(data: firestore.DocumentData): Application {
        const {id, user, name, platformIdentifier, googleServices, version} = data;
        return new Application(id, user, name, platformIdentifier, googleServices, version);
    }

    // TODO: Do better way for converting obj
    public toPlain(data: Application) {
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
