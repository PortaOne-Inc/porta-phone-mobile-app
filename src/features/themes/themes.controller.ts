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
import {
  LaunchAssets,
  SplashAssets,
  Theme,
} from '../../common/entities/theme/theme';
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

  @Patch(':themeId/assets/add')
  async addAssets(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body()
    assets: Array<{
      id: number;
      name: string;
      description?: string;
      url?: string;
      type?: string;
    }>,
  ) {
    return this.themesService.addAssets(applicationId, themeId, assets);
  }

  @Patch(':themeId/assets/update/:assetId')
  async updateAssetById(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Param('assetId') assetId: number,
    @Body()
    assetUpdateData: Partial<{
      name: string;
      description: string;
      url: string;
      type: string;
    }>,
  ) {
    return this.themesService.updateAssetById(
      applicationId,
      themeId,
      assetId,
      assetUpdateData,
    );
  }

  @Patch(':themeId/assets/remove/:assetId')
  async removeAssetById(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Param('assetId') assetId: number,
  ) {
    return this.themesService.removeAssetById(applicationId, themeId, assetId);
  }

  @Delete(':themeId/assets')
  async deleteAllAssets(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
  ) {
    return this.themesService.deleteAllAssets(applicationId, themeId);
  }

  @Patch(':themeId/launch-assets')
  async setLaunchAssets(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body() launchAssets: LaunchAssets,
  ) {
    return this.themesService.setLaunchAssets(
      applicationId,
      themeId,
      launchAssets,
    );
  }

  @Patch(':themeId/launch-assets/update')
  async updateLaunchAssets(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body() launchAssetsUpdate: Partial<LaunchAssets>,
  ) {
    return this.themesService.updateLaunchAssets(
      applicationId,
      themeId,
      launchAssetsUpdate,
    );
  }

  @Delete(':themeId/launch-assets')
  async deleteLaunchAssets(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
  ) {
    return this.themesService.deleteLaunchAssets(applicationId, themeId);
  }

  @Patch(':themeId/splash-asset/update')
  async updateSplashAsset(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body() splashAssetUpdate: Partial<SplashAssets>,
  ) {
    return this.themesService.updateSplashAsset(
      applicationId,
      themeId,
      splashAssetUpdate,
    );
  }

  @Delete(':themeId/splash-asset')
  async deleteSplashAsset(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
  ) {
    return this.themesService.deleteSplashAsset(applicationId, themeId);
  }
}
