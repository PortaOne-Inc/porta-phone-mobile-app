import { Body, Controller, Param, Post, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { Throttle } from '@nestjs/throttler';
import { FirebaseAuthGuard } from '../../../auth/guard/firebase-auth.guard';
import { CurrentUser, Principal } from '../../../auth/current-user.decorator';
import { Roles } from '../../../auth/guard/roles.decorator';
import { GenerateThemesService } from './generate.service';
import { GenerateThemeDto } from './dto/create-generate.dto';
import { NudgeThemeDto } from './dto/nudge-theme.dto';
import { FirebaseUidThrottlerGuard } from './guards/firebase-uid-throttler.guard';

@ApiTags('themes-generator')
@Controller('applications/:applicationId/themes/generate')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard, FirebaseUidThrottlerGuard)
@Roles('admin', 'user')
export class GenerateThemesController {
  constructor(private readonly gen: GenerateThemesService) {}

  @Post()
  @Throttle({ generate: { limit: 5, ttl: 60_000 } })
  async generate(
    @CurrentUser() user: Principal,
    @Param('applicationId') applicationId: string,
    @Body() dto: GenerateThemeDto,
  ) {
    const payload: GenerateThemeDto = { ...dto };
    return this.gen.generateAndCreate(user.uid, applicationId, payload);
  }

  @Post(':themeId/generate/nudge')
  @Throttle({ nudge: { limit: 10, ttl: 60_000 } })
  async nudge(
    @CurrentUser() user: Principal,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body() dto: NudgeThemeDto,
  ) {
    return this.gen.nudgeAndUpdate(user.uid, applicationId, themeId, dto);
  }
}
