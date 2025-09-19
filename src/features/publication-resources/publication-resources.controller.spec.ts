import { Test, TestingModule } from '@nestjs/testing';
import { PublicationResourcesController } from './publication-resources.controller';
import { PublicationResourcesService } from './publication-resources.service';

describe('PublicationResourcesController', () => {
  let controller: PublicationResourcesController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [PublicationResourcesController],
      providers: [PublicationResourcesService],
    }).compile();

    controller = module.get<PublicationResourcesController>(
      PublicationResourcesController,
    );
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
