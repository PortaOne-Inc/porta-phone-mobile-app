import { Test, TestingModule } from '@nestjs/testing';
import { GithubProxyService } from './github-proxy.service';

describe('GithubProxyService', () => {
  let service: GithubProxyService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [GithubProxyService],
    }).compile();

    service = module.get<GithubProxyService>(GithubProxyService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
