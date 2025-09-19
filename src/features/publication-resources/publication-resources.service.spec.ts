import { Test, TestingModule } from '@nestjs/testing';
import { PublicationResourcesService } from './publication-resources.service';

describe('PublicationResourcesService', () => {
  let service: PublicationResourcesService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PublicationResourcesService],
    }).compile();

    service = module.get<PublicationResourcesService>(
      PublicationResourcesService,
    );
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
