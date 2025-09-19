import { Test, TestingModule } from '@nestjs/testing';
import { WidgetConfigsService } from './widget-configs.service';

describe('WidgetConfigsService', () => {
  let service: WidgetConfigsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [WidgetConfigsService],
    }).compile();

    service = module.get<WidgetConfigsService>(WidgetConfigsService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
