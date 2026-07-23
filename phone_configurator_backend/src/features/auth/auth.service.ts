import {
  BadRequestException,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import * as admin from 'firebase-admin';
import 'firebase/auth';
import {
  getAuth,
  signInWithCustomToken,
  signInWithEmailAndPassword,
} from 'firebase/auth';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';
import { UserRole } from '../users/entities/userRole';
import { UsersService } from '../users/users.service';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(UserRole)
    private readonly userRoleRepository: BaseFirestoreRepository<UserRole>,
    private readonly userService: UsersService,
  ) {}

  async register(
    email: string,
    password: string,
    role: string,
  ): Promise<string> {
    if (!['admin', 'user', 'guest'].includes(role)) {
      throw new BadRequestException('Invalid role');
    }

    try {
      const userRecord = await admin.auth().createUser({
        email: email,
        password: password,
      });

      await admin.auth().setCustomUserClaims(userRecord.uid, { role });
      const token = await admin.auth().createCustomToken(userRecord.uid);
      const userCredential = await signInWithCustomToken(getAuth(), token);

      const userRole = new UserRole();
      userRole.id = userRecord.uid;
      userRole.role = role;
      userRole.createdAt = new Date();
      userRole.updatedAt = new Date();
      await this.userRoleRepository.create(userRole);

      return await userCredential.user.getIdToken();
    } catch (error) {
      throw new UnauthorizedException('Registration failed: ' + error.message);
    }
  }

  async login(email: string, password: string): Promise<string> {
    try {
      const userCredential = await signInWithEmailAndPassword(
        getAuth(),
        email,
        password,
      );
      const idToken = await userCredential.user.getIdToken();

      return idToken;
    } catch (error) {
      throw new UnauthorizedException('Login failed: ' + error.message);
    }
  }

  async generateCustomToken(uid: string): Promise<string> {
    try {
      const token = await admin.auth().createCustomToken(uid);
      return token;
    } catch (error) {
      throw new UnauthorizedException(
        'Token generation failed: ' + error.message,
      );
    }
  }

  async generateIdToken(uid: string): Promise<string> {
    try {
      // Generate custom token
      const customToken = await this.generateCustomToken(uid);

      // Sign in with custom token
      const userCredential = await signInWithCustomToken(
        getAuth(),
        customToken,
      );

      // Get ID token
      return await userCredential.user.getIdToken(true);
    } catch (error) {
      throw new UnauthorizedException(
        'ID token generation failed: ' + error.message,
      );
    }
  }
}
