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
import { OwnershipService } from '../../../../common/data/ownership.service';
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
    private readonly ownership: OwnershipService,
  ) {}

  private coll() {
    return admin.firestore().collection(Collections.applicationCapabilities);
  }

  async getOrCreate(
    uid: string,
    applicationId: string,
  ): Promise<ApplicationCapabilities> {
    await this.ownership.assertOwnsApplication(uid, applicationId);

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
      updatedBy: uid,
      updatedFrom: 'api',
    };
    await this.repo.create(fresh);
    return fresh;
  }

  async get(
    uid: string,
    applicationId: string,
  ): Promise<ApplicationCapabilities> {
    await this.ownership.assertOwnsApplication(uid, applicationId);

    const doc = await this.repo.findById(applicationId).catch(() => null);
    if (!doc) throw new NotFoundException('Capabilities not found');
    return doc;
  }

  async update(
    uid: string,
    applicationId: string,
    dtoRaw: unknown,
  ): Promise<ApplicationCapabilities> {
    await this.ownership.assertOwnsApplication(uid, applicationId);

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
          updatedBy: uid,
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
        updatedBy: uid,
        updatedFrom: dto.updatedFrom ?? 'ui',
      };

      tx.set(ref, next);
    });

    return this.get(uid, applicationId);
  }
}
