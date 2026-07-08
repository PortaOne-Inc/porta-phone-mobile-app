import {
  Controller,
  Get,
  Post,
  Patch,
  Delete,
  Param,
  Body,
  HttpException,
  HttpStatus,
  UseGuards,
  Query,
  Logger,
} from '@nestjs/common';
import { ThemesService } from './themes.service';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';
import { CurrentUser, Principal } from '../auth/current-user.decorator';
import { Roles } from '../auth/guard/roles.decorator';
import {
  CreateThemeDto,
  UpdateThemeDto,
  CopyThemeDto,
  CopyThemeToApplicationDto,
} from './dto/themes.dto';

@ApiTags('themes')
@Controller('applications/:applicationId/themes')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
@Roles('admin', 'user')
export class ThemesController {
  private readonly logger = new Logger(ThemesController.name);

  constructor(private readonly themesService: ThemesService) {}

  @Get()
  async getThemesByApplicationId(
    @CurrentUser() user: Principal,
    @Param('applicationId') applicationId: string,
  ) {
    const uid = user.uid;
    this.logger.debug({
      msg: 'getThemesByApplicationId: incoming',
      uid,
      applicationId,
    });

    return this.themesService.getThemesByApplicationId(applicationId, uid);
  }

  @Get('all')
  async getAllThemes(@CurrentUser() user: Principal) {
    const uid = user.uid;
    return this.themesService.getAllThemes(uid);
  }

  @Get(':themeId/legacy')
  async getAggregatedLegacyThemeById(
    @CurrentUser() user: Principal,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
  ) {
    const uid = user.uid;
    const theme = await this.themesService.getAggregatedLegacyThemeById(
      applicationId,
      themeId,
      uid,
    );
    if (!theme) {
      throw new HttpException(
        `Theme with ID ${themeId} not found`,
        HttpStatus.NOT_FOUND,
      );
    }
    return theme;
  }

  @Get(':themeId')
  async getThemeById(
    @CurrentUser() user: Principal,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
  ) {
    const uid = user.uid;
    const theme = await this.themesService.getThemeById(
      applicationId,
      themeId,
      uid,
    );
    if (!theme) {
      throw new HttpException(
        `Theme with ID ${themeId} not found`,
        HttpStatus.NOT_FOUND,
      );
    }
    return theme;
  }

  @Post()
  async createTheme(
    @CurrentUser() user: Principal,
    @Param('applicationId') applicationId: string,
    @Body() dto: CreateThemeDto,
  ) {
    const uid = user.uid;
    const newTheme = await this.themesService.createTheme(
      applicationId,
      dto,
      uid,
    );
    if (!newTheme) {
      throw new HttpException('Failed to create theme', HttpStatus.BAD_REQUEST);
    }
    return newTheme;
  }

  @Patch(':themeId')
  async patchTheme(
    @CurrentUser() user: Principal,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body() updateThemeDto: UpdateThemeDto,
  ) {
    const uid = user.uid;
    return this.themesService.patchTheme(
      applicationId,
      themeId,
      updateThemeDto,
      uid,
    );
  }

  @Delete(':themeId')
  async deleteTheme(
    @CurrentUser() user: Principal,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Query('purgeOrphanAssets') purgeOrphanAssets?: string,
  ) {
    const uid = user.uid;
    await this.themesService.deleteTheme(uid, applicationId, themeId, {
      purgeOrphanAssets: purgeOrphanAssets === 'true',
    });
  }

  @Post(':themeId/copy-to-application')
  async copyThemeToApplication(
    @CurrentUser() user: Principal,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body() dto: CopyThemeToApplicationDto,
  ) {
    const uid = user.uid;
    const cloned = await this.themesService.copyThemeToApplication(
      uid,
      applicationId,
      themeId,
      dto.targetApplicationId,
      {
        title: dto.title,
        description: dto.description,
        label: dto.label,
      },
    );
    if (!cloned) {
      throw new HttpException(
        'Failed to copy theme to application',
        HttpStatus.BAD_REQUEST,
      );
    }
    return cloned;
  }

  @Post(':themeId/copy')
  async copyTheme(
    @CurrentUser() user: Principal,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body() overrides: CopyThemeDto,
  ) {
    const uid = user.uid;
    const cloned = await this.themesService.copyTheme(
      applicationId,
      themeId,
      overrides,
      uid,
    );
    if (!cloned) {
      throw new HttpException('Failed to copy theme', HttpStatus.BAD_REQUEST);
    }
    return cloned;
  }
}
