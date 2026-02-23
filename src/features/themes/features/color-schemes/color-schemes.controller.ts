import { Body, Controller, Get, Param, Put } from '@nestjs/common';
import { ApiBearerAuth, ApiParam, ApiQuery } from '@nestjs/swagger';
import { ColorSchemesService } from './color-schemes.service';
import { UpsertColorSchemeDto } from './dto/upsert-color-scheme.dto';

type Variant = 'light' | 'dark';

@Controller('applications/:applicationId/themes/:themeId/color-schemes')
@ApiBearerAuth()
export class ColorSchemesController {
  constructor(private readonly service: ColorSchemesService) {}

  @Get()
  listForTheme(
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
  ) {
    return this.service.listForTheme(appId, themeId);
  }

  @Put('ensure-pair')
  ensurePair(
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
  ) {
    return this.service.ensurePair(appId, themeId);
  }

  @Get(':variant')
  @ApiParam({ name: 'variant', enum: ['light', 'dark'] })
  getByThemeVariant(
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @Param('variant') variant: Variant,
  ) {
    return this.service.getByThemeVariant(appId, themeId, variant);
  }

  @Put(':variant')
  @ApiParam({ name: 'variant', enum: ['light', 'dark'] })
  upsertByThemeVariant(
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @Param('variant') variant: Variant,
    @Body() dto: UpsertColorSchemeDto,
  ) {
    return this.service.upsertByThemeVariant(appId, themeId, variant, {
      config: dto.config,
      expectedVersion: dto.expectedVersion,
    });
  }
}
