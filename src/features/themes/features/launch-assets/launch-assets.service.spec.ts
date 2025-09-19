import { Test, TestingModule } from '@nestjs/testing';
import { LaunchAssetsService } from './launch-assets.service';

describe('LaunchAssetsService', () => {
  let service: LaunchAssetsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [LaunchAssetsService],
    }).compile();

    service = module.get<LaunchAssetsService>(LaunchAssetsService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
