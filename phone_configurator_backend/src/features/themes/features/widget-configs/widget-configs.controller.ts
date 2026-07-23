import {
  Body,
  Controller,
  Get,
  Param,
  Put,
  UseGuards,
  ParseEnumPipe,
} from '@nestjs/common';
import { ApiBearerAuth, ApiParam } from '@nestjs/swagger';
import { WidgetConfigsService } from './widget-configs.service';
import { UpsertWidgetConfigDto } from './dto/upsert-widget-config.dto';
import { FirebaseAuthGuard } from '../../../auth/guard/firebase-auth.guard';
import { CurrentUser, Principal } from '../../../auth/current-user.decorator';

type Variant = 'light' | 'dark';
const VariantEnum = { light: 'light', dark: 'dark' } as const;

@Controller('applications/:applicationId/themes/:themeId/widget-configs')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
export class WidgetConfigsController {
  constructor(private readonly service: WidgetConfigsService) {}

  // GET /applications/:appId/themes/:themeId/widget-configs
  @Get()
  listForTheme(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
  ) {
    return this.service.listForTheme(user.uid, appId, themeId);
  }

  // PUT /applications/:appId/themes/:themeId/widget-configs/ensure-pair
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
    @Param('variant', new ParseEnumPipe(VariantEnum)) variant: Variant,
  ) {
    return this.service.getByThemeVariant(user.uid, appId, themeId, variant);
  }

  @Put(':variant')
  @ApiParam({ name: 'variant', enum: ['light', 'dark'] })
  upsertByThemeVariant(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @Param('variant', new ParseEnumPipe(VariantEnum)) variant: Variant,
    @Body() dto: UpsertWidgetConfigDto,
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
