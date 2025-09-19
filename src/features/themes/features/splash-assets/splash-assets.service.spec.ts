import { Test, TestingModule } from '@nestjs/testing';
import { SplashAssetsService } from './splash-assets.service';

describe('SplashAssetsService', () => {
  let service: SplashAssetsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [SplashAssetsService],
    }).compile();

    service = module.get<SplashAssetsService>(SplashAssetsService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
