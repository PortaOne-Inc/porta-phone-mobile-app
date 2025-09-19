import { Test, TestingModule } from '@nestjs/testing';
import { EmbedsService } from './embeds.service';

describe('EmbedsService', () => {
  let service: EmbedsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [EmbedsService],
    }).compile();

    service = module.get<EmbedsService>(EmbedsService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
