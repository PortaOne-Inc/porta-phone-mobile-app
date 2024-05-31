import "reflect-metadata";

import { inject, injectable } from "inversify";

import IApplicationsService from "./applications.service.interface";
import IApplicationRepository from "../repository/application.repository.interface";

import Application from "../../../core/models/application";
import User from "../../../core/models/user";

import { TYPES } from "../../../di";
import GoogleServices from "../../../core/models/google_services";

@injectable()
export default class ApplicationsService implements IApplicationsService {
    constructor(@inject(TYPES.ApplicationRepository) private applicationRepository: IApplicationRepository) { }

    async getApplications({ uid }: User): Promise<Application[] | null> {
        return this.applicationRepository.getByUser(uid!);
    }

    // TODO: extract create app dto
    async createApplication(
        { name, theme, platformIdentifier, androidPlatformId, iosPlatformId, androidVersion, iosVersion, termsConditionsUrl, coreUrl, googleServices, }: Application,
        { uid }: User
    ): Promise<Application | null> {
        const googleServicesModel =
            googleServices?.androidUrl != null || googleServices?.iosUrl != null
                ? new GoogleServices(googleServices?.androidUrl ?? null, googleServices?.iosUrl ?? null)
                : null;
        const userModel = new Application(
            undefined,
            uid,
            name,
            theme,
            platformIdentifier,
            androidPlatformId,
            iosPlatformId,
            androidVersion,
            iosVersion,
            coreUrl,
            termsConditionsUrl,
            googleServicesModel
        );
        return this.applicationRepository.create(userModel);
    }

    async incrementVersion(id: string): Promise<Application | null> {
        const application = await this.applicationRepository.getById(id);
        if (application != null) {
            application.version++;
            return await this.applicationRepository.patch(id, application);
        } else {
            return null;
        }
    }

    async getApplicationById(id: string): Promise<Application | null> {
        return this.applicationRepository.getById(id);
    }

    async patchApplication(id: string, application: Application): Promise<Application | null> {
        return this.applicationRepository.patch(id, application);
    }

    async deleteApplication(id: string, { uid }: User): Promise<void | null> {
        try {
            const application = await this.applicationRepository.getById(id);

            if (application?.user == uid) {
                return this.applicationRepository.delete(id);
            } else {
                return null;
            }
        } catch (e) {
            return null;
        }
    }
}
