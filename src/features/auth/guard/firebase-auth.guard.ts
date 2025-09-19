import {
  Injectable,
  CanActivate,
  ExecutionContext,
  UnauthorizedException,
  ForbiddenException,
} from '@nestjs/common';
import * as admin from 'firebase-admin';
import { Reflector } from '@nestjs/core';
import { ROLES_KEY } from './roles.decorator';

@Injectable()
export class FirebaseAuthGuard implements CanActivate {
  constructor(private reflector: Reflector) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const rolesMeta = this.reflector.getAllAndOverride<string[] | string>(
      ROLES_KEY,
      [context.getHandler(), context.getClass()],
    );

    const roles: string[] = Array.isArray(rolesMeta)
      ? rolesMeta
      : typeof rolesMeta === 'string'
        ? [rolesMeta]
        : [];

    const request = context.switchToHttp().getRequest();
    const token = FirebaseAuthGuard.extractTokenFromHeader(request);
    if (!token)
      throw new UnauthorizedException('Authentication token not found');

    try {
      const decodedToken = await admin.auth().verifyIdToken(token);
      request.user = decodedToken;

      if (roles.length > 0 && !roles.some((r) => decodedToken.role === r)) {
        throw new ForbiddenException('Insufficient permissions');
      }

      return true;
    } catch (error: any) {
      switch (error?.code) {
        case 'auth/id-token-expired':
          throw new UnauthorizedException('Expired authentication token');
        case 'auth/argument-error':
          throw new UnauthorizedException('Invalid authentication token');
        default:
          throw error;
      }
    }
  }

  private static extractTokenFromHeader(request: any): string | null {
    const authHeader = request.headers?.authorization;
    if (!authHeader) return null;
    const [bearer, token] = authHeader.split(' ');
    return bearer === 'Bearer' && token ? token : null;
  }
}
