import {
  createParamDecorator,
  ExecutionContext,
  UnauthorizedException,
} from '@nestjs/common';

/**
 * Transport-agnostic representation of the authenticated caller.
 * Controllers receive it via @CurrentUser() and pass uid/role down to
 * services, so services never depend on the HTTP request shape.
 */
export interface Principal {
  uid: string;
  role?: string;
}

export const CurrentUser = createParamDecorator(
  (_data: unknown, ctx: ExecutionContext): Principal => {
    const user = ctx.switchToHttp().getRequest().user;
    if (!user?.uid) {
      // Guards populate request.user; reaching this without it means the
      // route is missing an auth guard.
      throw new UnauthorizedException('Authenticated principal not found');
    }
    return { uid: user.uid, role: user.role };
  },
);
