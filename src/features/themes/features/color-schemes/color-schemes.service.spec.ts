import { Test, TestingModule } from '@nestjs/testing';
import { ColorSchemesService } from './color-schemes.service';

describe('ColorSchemesService', () => {
  let service: ColorSchemesService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ColorSchemesService],
    }).compile();

    service = module.get<ColorSchemesService>(ColorSchemesService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
