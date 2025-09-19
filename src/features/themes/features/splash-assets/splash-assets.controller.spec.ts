import { Test, TestingModule } from '@nestjs/testing';
import { SplashAssetsController } from './splash-assets.controller';
import { SplashAssetsService } from './splash-assets.service';

describe('SplashAssetsController', () => {
  let controller: SplashAssetsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [SplashAssetsController],
      providers: [SplashAssetsService],
    }).compile();

    controller = module.get<SplashAssetsController>(SplashAssetsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
