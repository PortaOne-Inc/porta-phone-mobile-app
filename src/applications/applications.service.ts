import { Injectable } from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';

import { BaseFirestoreRepository } from 'fireorm';

import { Application } from '../common/entities/application/application';

@Injectable()
export class ApplicationsService {
  constructor(
    @InjectRepository(Application)
    private readonly applicationRepository: BaseFirestoreRepository<Application>,
  ) {}

  async createApplication(
    applicationDto: Application,
  ): Promise<Application | null> {
    try {
      const newApplication = this.applicationRepository.create(applicationDto);
      return newApplication;
    } catch (error) {
      // Handle error (e.g., logging)
      return null;
    }
  }

  async findApplicationById(id: string): Promise<Application | null> {
    try {
      const application = await this.applicationRepository.findById(id);
      return application;
    } catch (error) {
      // Handle error (e.g., logging)
      return null;
    }
  }

  async updateApplication(
    id: string,
    applicationDto: Application,
  ): Promise<Application | null> {
    try {
      const application = await this.applicationRepository.findById(id);
      if (application) {
        Object.assign(application, applicationDto);
        await this.applicationRepository.update(application);
        return application;
      }
      return null;
    } catch (error) {
      // Handle error (e.g., logging)
      return null;
    }
  }

  async removeApplication(id: string): Promise<void | null> {
    try {
      await this.applicationRepository.delete(id);
    } catch (error) {
      // Handle error (e.g., logging)
      return null;
    }
  }

  async listApplications(): Promise<Application[] | null> {
    try {
      const applications = await this.applicationRepository.find();
      return applications;
    } catch (error) {
      // Handle error (e.g., logging)
      return null;
    }
  }

  async getApplicationEnvironment(
    id: string,
  ): Promise<Record<string, string | boolean | number> | null> {
    try {
      const application = await this.applicationRepository.findById(id);
      return application ? application.environment || {} : null;
    } catch (error) {
      return null;
    }
  }

  // New method: Update environment configuration
  async updateApplicationEnvironment(
    id: string,
    environmentData: Record<string, string | boolean | number>,
  ): Promise<Application | null> {
    try {
      const application = await this.applicationRepository.findById(id);
      if (application) {
        application.environment = {
          ...application.environment,
          ...environmentData,
        };
        await this.applicationRepository.update(application);
        return application;
      }
      return null;
    } catch (error) {
      return null;
    }
  }

}
