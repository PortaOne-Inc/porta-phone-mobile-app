import 'reflect-metadata';
import { ExecutionContext, UnauthorizedException } from '@nestjs/common';
import { ROUTE_ARGS_METADATA } from '@nestjs/common/constants';

import { CurrentUser, Principal } from './current-user.decorator';

// createParamDecorator factories are only reachable through the route-args
// metadata they attach to a probe handler.
const getFactory = () => {
  class Probe {
    handler(@CurrentUser() _user: Principal) {}
  }
  const args = Reflect.getMetadata(ROUTE_ARGS_METADATA, Probe, 'handler');
  return args[Object.keys(args)[0]].factory as (
    data: unknown,
    ctx: ExecutionContext,
  ) => Principal;
};

const contextWithUser = (user: unknown): ExecutionContext =>
  ({
    switchToHttp: () => ({ getRequest: () => ({ user }) }),
  }) as unknown as ExecutionContext;

describe('CurrentUser', () => {
  const factory = getFactory();

  it('maps request.user to a Principal', () => {
    const principal = factory(
      undefined,
      contextWithUser({ uid: 'user-1', role: 'admin', email: 'x@y.z' }),
    );

    expect(principal).toEqual({ uid: 'user-1', role: 'admin' });
  });

  it('leaves role undefined when the token carries none', () => {
    const principal = factory(undefined, contextWithUser({ uid: 'user-1' }));

    expect(principal).toEqual({ uid: 'user-1', role: undefined });
  });

  it('throws UnauthorizedException when request.user is missing', () => {
    expect(() => factory(undefined, contextWithUser(undefined))).toThrow(
      UnauthorizedException,
    );
  });

  it('throws UnauthorizedException when request.user has no uid', () => {
    expect(() => factory(undefined, contextWithUser({ role: 'admin' }))).toThrow(
      UnauthorizedException,
    );
  });
});
