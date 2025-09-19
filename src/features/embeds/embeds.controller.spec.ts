import { Test, TestingModule } from '@nestjs/testing';
import { EmbedsController } from './embeds.controller';
import { EmbedsService } from './embeds.service';

describe('EmbedsController', () => {
  let controller: EmbedsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [EmbedsController],
      providers: [EmbedsService],
    }).compile();

    controller = module.get<EmbedsController>(EmbedsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
