import { Injectable } from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';
import * as admin from 'firebase-admin';
import { UserDto } from './dto/user.dto';
import { UserRecord } from 'firebase-admin/auth';
import { UserRole } from './entities/userRole';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(UserRole)
    private readonly userRoleRepository: BaseFirestoreRepository<UserRole>,
  ) {}

  async createUser(
    email: string,
    role: string,
    displayName?: string,
  ): Promise<UserDto> {
    // TODO: Move here user creation logic from auth service
    return null;
  }

  async getAllUsers(): Promise<UserDto[]> {
    const users = await admin.auth().listUsers();

    return users.users.map((userEntity) => this.mapEntityToDto(userEntity));
  }

  async getUserById(uid: string): Promise<UserDto> {
    const userEntity = await admin.auth().getUser(uid);

    return this.mapEntityToDto(userEntity);
  }

  async updateUser(id: string, user: Partial<UserDto>): Promise<UserDto> {
    const { uid, email, displayName, role } = user;

    const updateData: admin.auth.UpdateRequest = {};
    if (email !== undefined) updateData.email = email;
    if (displayName !== undefined) updateData.displayName = displayName;
    if (role !== undefined) {
      const userRole = await this.userRoleRepository.findById(id);
      userRole.role = role;
      await this.userRoleRepository.update(userRole);
      await admin.auth().setCustomUserClaims(id, { role });
    }

    const updatedUserEntity = await admin.auth().updateUser(uid, updateData);

    return this.mapEntityToDto(updatedUserEntity);
  }

  async deleteUser(uid: string): Promise<void> {
    admin.auth().deleteUser(uid);
  }

  mapEntityToDto(
    userEntity: UserRecord,
    defaultUserRole: string = 'user',
  ): UserDto {
    const userDto = new UserDto();
    userDto.uid = userEntity.uid;
    userDto.email = userEntity.email;
    userDto.displayName = userEntity.displayName;
    userDto.role = userEntity.customClaims?.role || defaultUserRole;

    return userDto;
  }

  dtoToJson<T>(dto: T): Partial<T> {
    const jsonObject: Partial<T> = {};
    for (const [key, value] of Object.entries(dto)) {
      if (value !== null && value !== undefined) {
        jsonObject[key as keyof T] = value;
      }
    }

    return jsonObject;
  }
}
