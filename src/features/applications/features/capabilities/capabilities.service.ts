import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { BaseFirestoreRepository } from 'fireorm';
import { InjectRepository } from 'nestjs-fireorm';
import * as admin from 'firebase-admin';
import { ApplicationCapabilities } from './entities/capability.entity';
import { Collections } from '../../../../common';
import { UpdateCapabilitiesZ } from './dto/update-capability.dto';

const DEFAULT_CAPABILITIES: Record<string, boolean> = {
  favorites: true,
  recents: true,
  contacts: true,
  keypad: true,
  messaging: false,
  voicemail: false,
  embeddedTabs: false,
  systemNotifications: true,
};

@Injectable()
export class ApplicationCapabilitiesService {
  constructor(
    @InjectRepository(ApplicationCapabilities)
    private readonly repo: BaseFirestoreRepository<ApplicationCapabilities>,
  ) {}

  private coll() {
    return admin.firestore().collection(Collections.applicationCapabilities);
  }

  async getOrCreate(
    applicationId: string,
    createdByUid: string,
  ): Promise<ApplicationCapabilities> {
    const existing = await this.repo.findById(applicationId).catch(() => null);
    if (existing) return existing;

    const now = new Date();
    const fresh: ApplicationCapabilities = {
      id: applicationId,
      applicationId,
      version: 0,
      capabilities: DEFAULT_CAPABILITIES,
      defaultCapabilities: DEFAULT_CAPABILITIES,
      updatedAt: now,
      updatedBy: createdByUid,
      updatedFrom: 'api',
    };
    await this.repo.create(fresh);
    return fresh;
  }

  async get(applicationId: string): Promise<ApplicationCapabilities> {
    const doc = await this.repo.findById(applicationId).catch(() => null);
    if (!doc) throw new NotFoundException('Capabilities not found');
    return doc;
  }

  async update(
    applicationId: string,
    dtoRaw: unknown,
    actorUid: string,
  ): Promise<ApplicationCapabilities> {
    const dto = UpdateCapabilitiesZ.parse(dtoRaw);
    const ref = this.coll().doc(applicationId);

    await admin.firestore().runTransaction(async (tx) => {
      const snap = await tx.get(ref);
      const now = new Date();

      if (!snap.exists) {
        const fresh: ApplicationCapabilities = {
          id: applicationId,
          applicationId,
          version: 0,
          capabilities: dto.capabilities,
          defaultCapabilities: DEFAULT_CAPABILITIES,
          updatedAt: now,
          updatedBy: actorUid,
          updatedFrom: dto.updatedFrom ?? 'ui',
        };
        tx.set(ref, fresh);
        return;
      }

      const current = snap.data() as ApplicationCapabilities;

      if (
        typeof dto.expectedVersion === 'number' &&
        dto.expectedVersion !== current.version
      ) {
        throw new BadRequestException(
          `Version mismatch: expected ${dto.expectedVersion}, actual ${current.version}`,
        );
      }

      const next: ApplicationCapabilities = {
        ...current,
        capabilities: dto.capabilities,
        version: current.version + 1,
        updatedAt: now,
        updatedBy: actorUid,
        updatedFrom: dto.updatedFrom ?? 'ui',
      };

      tx.set(ref, next);
    });

    return this.get(applicationId);
  }
}
