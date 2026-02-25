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
  Req,
  Query,
  Logger,
} from '@nestjs/common';
import { ThemesService } from './themes.service';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';
import { Roles } from '../auth/guard/roles.decorator';
import { CreateThemeDto, UpdateThemeDto, CopyThemeDto, CopyThemeToApplicationDto } from './dto/themes.dto';

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
    @Req() req: any,
    @Param('applicationId') applicationId: string,
  ) {
    const uid: string = req.user?.uid ?? '';
    this.logger.debug({
      msg: 'getThemesByApplicationId: incoming',
      uid,
      applicationId,
      headersAuth: req.headers['authorization'] ? 'present' : 'missing',
    });

    return this.themesService.getThemesByApplicationId(applicationId, uid);
  }

  @Get('all')
  async getAllThemes(@Req() req: any) {
    const uid: string = req.user?.uid ?? '';
    return this.themesService.getAllThemes(uid);
  }

  @Get(':themeId/legacy')
  async getAggregatedLegacyThemeById(
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
  ) {
    const uid: string = req.user?.uid ?? '';
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
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
  ) {
    const uid: string = req.user?.uid ?? '';
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
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @Body() dto: CreateThemeDto,
  ) {
    const uid: string = req.user?.uid ?? '';
    const newTheme = await this.themesService.createTheme(applicationId, dto, uid);
    if (!newTheme) {
      throw new HttpException('Failed to create theme', HttpStatus.BAD_REQUEST);
    }
    return newTheme;
  }

  @Patch(':themeId')
  async patchTheme(
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body() updateThemeDto: UpdateThemeDto,
  ) {
    const uid: string = req.user?.uid ?? '';
    return this.themesService.patchTheme(
      applicationId,
      themeId,
      updateThemeDto,
      uid,
    );
  }

  @Delete(':themeId')
  async deleteTheme(
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Query('purgeOrphanAssets') purgeOrphanAssets?: string,
  ) {
    const uid: string = req.user?.uid ?? '';
    await this.themesService.deleteTheme(uid, applicationId, themeId, {
      purgeOrphanAssets: purgeOrphanAssets === 'true',
    });
  }

  @Post(':themeId/copy-to-application')
  async copyThemeToApplication(
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body() dto: CopyThemeToApplicationDto,
  ) {
    const uid: string = req.user?.uid ?? '';
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
      throw new HttpException('Failed to copy theme to application', HttpStatus.BAD_REQUEST);
    }
    return cloned;
  }

  @Post(':themeId/copy')
  async copyTheme(
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body() overrides: CopyThemeDto,
  ) {
    const uid: string = req.user?.uid ?? '';
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
