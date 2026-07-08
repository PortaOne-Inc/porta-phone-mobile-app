import { Body, Controller, Get, Param, Put, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiParam } from '@nestjs/swagger';
import { ColorSchemesService } from './color-schemes.service';
import { UpsertColorSchemeDto } from './dto/upsert-color-scheme.dto';
import { FirebaseAuthGuard } from '../../../auth/guard/firebase-auth.guard';
import { CurrentUser, Principal } from '../../../auth/current-user.decorator';

type Variant = 'light' | 'dark';

@Controller('applications/:applicationId/themes/:themeId/color-schemes')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
export class ColorSchemesController {
  constructor(private readonly service: ColorSchemesService) {}

  @Get()
  listForTheme(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
  ) {
    return this.service.listForTheme(user.uid, appId, themeId);
  }

  @Put('ensure-pair')
  ensurePair(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
  ) {
    return this.service.ensurePair(user.uid, appId, themeId);
  }

  @Get(':variant')
  @ApiParam({ name: 'variant', enum: ['light', 'dark'] })
  getByThemeVariant(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @Param('variant') variant: Variant,
  ) {
    return this.service.getByThemeVariant(user.uid, appId, themeId, variant);
  }

  @Put(':variant')
  @ApiParam({ name: 'variant', enum: ['light', 'dark'] })
  upsertByThemeVariant(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @Param('variant') variant: Variant,
    @Body() dto: UpsertColorSchemeDto,
  ) {
    return this.service.upsertByThemeVariant(
      user.uid,
      appId,
      themeId,
      variant,
      {
        config: dto.config,
        expectedVersion: dto.expectedVersion,
      },
    );
  }
}
