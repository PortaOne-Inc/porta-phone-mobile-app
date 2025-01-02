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
} from '@nestjs/common';
import { ThemesService } from './themes.service';
import { Theme } from '../common/entities/theme/theme';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';
import { Roles } from '../auth/guard/roles.decorator';

@ApiTags('themes')
@Controller('applications/:applicationId/themes')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
@Roles('admin', 'user')
export class ThemesController {
  constructor(private readonly themesService: ThemesService) {}

  @Get()
  async getThemesByApplicationId(
    @Param('applicationId') applicationId: string,
  ): Promise<Theme[]> {
    return this.themesService.getThemesByApplicationId(applicationId);
  }

  @Get(':themeId')
  async getThemeById(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
  ): Promise<Theme | null> {
    const theme = await this.themesService.getThemeById(applicationId, themeId);
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
    @Param('applicationId') applicationId: string,
    @Body() createThemeDto: Theme,
  ): Promise<Theme | null> {
    const newTheme = await this.themesService.createTheme(
      applicationId,
      createThemeDto,
    );
    if (!newTheme) {
      throw new HttpException('Failed to create theme', HttpStatus.BAD_REQUEST);
    }
    return newTheme;
  }

  @Patch(':themeId')
  async patchTheme(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body() updateThemeDto: Theme,
  ): Promise<Theme | null> {
    const updatedTheme = await this.themesService.patchTheme(
      applicationId,
      themeId,
      updateThemeDto,
    );
    if (!updatedTheme) {
      throw new HttpException(
        `Theme with ID ${themeId} not found`,
        HttpStatus.NOT_FOUND,
      );
    }
    return updatedTheme;
  }

  @Delete(':themeId')
  async deleteTheme(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
  ): Promise<void | null> {
    await this.themesService.deleteTheme(applicationId, themeId);
  }
}
