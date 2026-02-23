import {
  Body,
  Controller,
  Param,
  Post,
  Req,
  UseGuards,
  BadRequestException,
} from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { Throttle } from '@nestjs/throttler';
import { FirebaseAuthGuard } from '../../../auth/guard/firebase-auth.guard';
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
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @Body() dto: GenerateThemeDto,
  ) {
    const uid: string = req.user?.uid ?? '';
    if (!uid) throw new BadRequestException('Missing user uid');

    const payload: GenerateThemeDto = { ...dto };
    return this.gen.generateAndCreate(uid, applicationId, payload);
  }

  @Post(':themeId/generate/nudge')
  @Throttle({ nudge: { limit: 10, ttl: 60_000 } })
  async nudge(
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body() dto: NudgeThemeDto,
  ) {
    const uid: string = req.user?.uid ?? '';
    if (!uid) throw new BadRequestException('Missing user uid');
    return this.gen.nudgeAndUpdate(uid, applicationId, themeId, dto);
  }
}
