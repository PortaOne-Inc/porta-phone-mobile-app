import { Test, TestingModule } from '@nestjs/testing';
import { WidgetConfigsController } from './widget-configs.controller';
import { WidgetConfigsService } from './widget-configs.service';

describe('WidgetConfigsController', () => {
  let controller: WidgetConfigsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [WidgetConfigsController],
      providers: [WidgetConfigsService],
    }).compile();

    controller = module.get<WidgetConfigsController>(WidgetConfigsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
