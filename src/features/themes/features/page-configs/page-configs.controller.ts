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
import { CurrentUser, Principal } from '../../../auth/current-user.decorator';

type Variant = 'light' | 'dark';
const VariantEnum = { light: 'light', dark: 'dark' } as const;

@Controller('applications/:applicationId/themes/:themeId/page-configs')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
export class PageConfigsController {
  constructor(private readonly service: PageConfigsService) {}

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
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Param('variant', new ParseEnumPipe(VariantEnum)) variant: Variant,
  ) {
    return this.service.getByThemeVariant(
      user.uid,
      applicationId,
      themeId,
      variant,
    );
  }

  @Put(':variant')
  @ApiParam({ name: 'variant', enum: ['light', 'dark'] })
  upsertByThemeVariant(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Param('themeId') themeId: string,
    @Param('variant', new ParseEnumPipe(VariantEnum)) variant: Variant,
    @Body() dto: UpsertPageConfigDto,
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
