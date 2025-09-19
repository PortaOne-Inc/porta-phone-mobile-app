import { Test, TestingModule } from '@nestjs/testing';
import { ColorSchemesController } from './color-schemes.controller';
import { ColorSchemesService } from './color-schemes.service';

describe('ColorSchemesController', () => {
  let controller: ColorSchemesController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ColorSchemesController],
      providers: [ColorSchemesService],
    }).compile();

    controller = module.get<ColorSchemesController>(ColorSchemesController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
