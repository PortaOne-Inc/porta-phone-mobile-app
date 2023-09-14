import 'reflect-metadata';

import {firestore} from 'firebase-admin';
import {injectable} from 'inversify';
import {instanceToPlain, plainToClass} from 'class-transformer';

import Application from '../../models/application';

@injectable()
export default class FirestoreApplicationMapper {
    public toClass(reference: firestore.DocumentSnapshot): Application {
        const data = reference.data()! as Map<string, any>;
        const user = plainToClass(Application, data);
        user.id = reference.id;
        return user;
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
