import { Test, TestingModule } from '@nestjs/testing';
import { GithubProxyController } from './github-proxy.controller';

describe('GithubProxyController', () => {
  let controller: GithubProxyController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [GithubProxyController],
    }).compile();

    controller = module.get<GithubProxyController>(GithubProxyController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
