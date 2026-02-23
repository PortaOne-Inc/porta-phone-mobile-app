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
import { PageConfigsService } from './page-configs.service';
import { FirebaseAuthGuard } from '../../../auth/guard/firebase-auth.guard';
import { UpsertPageConfigDto } from './dto/create-page-config.dto';

type Variant = 'light' | 'dark';
const VariantEnum = { light: 'light', dark: 'dark' } as const;

@Controller('applications/:applicationId/themes/:themeId/page-configs')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
export class PageConfigsController {
  constructor(private readonly service: PageConfigsService) {}

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
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Param('variant', new ParseEnumPipe(VariantEnum)) variant: Variant,
  ) {
    return this.service.getByThemeVariant(applicationId, themeId, variant);
  }

  @Put(':variant')
  @ApiParam({ name: 'variant', enum: ['light', 'dark'] })
  upsertByThemeVariant(
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @Param('variant', new ParseEnumPipe(VariantEnum)) variant: Variant,
    @Body() dto: UpsertPageConfigDto,
  ) {
    return this.service.upsertByThemeVariant(appId, themeId, variant, {
      config: dto.config,
      expectedVersion: dto.expectedVersion,
    });
  }
}
