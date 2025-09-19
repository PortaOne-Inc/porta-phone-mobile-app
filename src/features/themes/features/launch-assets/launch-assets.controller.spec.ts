import { Test, TestingModule } from '@nestjs/testing';
import { LaunchAssetsController } from './launch-assets.controller';
import { LaunchAssetsService } from './launch-assets.service';

describe('LaunchAssetsController', () => {
  let controller: LaunchAssetsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [LaunchAssetsController],
      providers: [LaunchAssetsService],
    }).compile();

    controller = module.get<LaunchAssetsController>(LaunchAssetsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
