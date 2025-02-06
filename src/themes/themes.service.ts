import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';
import { LaunchAssets, SplashAsset, Theme } from '../common/entities/theme/theme';

@Injectable()
export class ThemesService {
  constructor(
    @InjectRepository(Theme)
    private readonly themeRepository: BaseFirestoreRepository<Theme>,
  ) {}

  async getThemesByApplicationId(applicationId: string): Promise<Theme[]> {
    return this.themeRepository
      .whereEqualTo('applicationId', applicationId)
      .find();
  }

  async getThemeById(
    applicationId: string,
    themeId: string,
  ): Promise<Theme | null> {
    const theme = await this.themeRepository.findById(themeId);
    if (!theme || theme.applicationId !== applicationId) {
      throw new NotFoundException(`Theme with ID ${themeId} not found`);
    }
    return theme;
  }

  async createTheme(
    applicationId: string,
    createThemeDto: Theme,
  ): Promise<Theme | null> {
    try {
      return this.themeRepository.create({
        applicationId,
        ...createThemeDto,
      });
    } catch (error) {
      // Handle error (e.g., logging)
      return null;
    }
  }

  async patchTheme(
    applicationId: string,
    themeId: string,
    updateThemeDto: Theme,
  ): Promise<Theme | null> {
    try {
      const theme = await this.getThemeById(applicationId, themeId);
      if (!theme) {
        throw new NotFoundException(`Theme with ID ${themeId} not found`);
      }
      Object.assign(theme, updateThemeDto);
      await this.themeRepository.update(theme);
      return theme;
    } catch (error) {
      // Handle error (e.g., logging)
      return null;
    }
  }

  async deleteTheme(
    applicationId: string,
    themeId: string,
  ): Promise<void | null> {
    try {
      const theme = await this.getThemeById(applicationId, themeId);
      if (!theme) {
        throw new NotFoundException(`Theme with ID ${themeId} not found`);
      }
      await this.themeRepository.delete(theme.id);
    } catch (error) {
      // Handle error (e.g., logging)
      return null;
    }
  }

  async addAssets(
    applicationId: string,
    themeId: string,
    assets: Array<{
      id: number;
      name: string;
      description?: string;
      url?: string;
      type?: string;
    }>,
  ): Promise<Theme> {
    const theme = await this.getThemeById(applicationId, themeId);
    theme.assets = [...(theme.assets || []), ...assets];
    await this.themeRepository.update(theme);
    return theme;
  }

  async updateAssetById(
    applicationId: string,
    themeId: string,
    assetId: number,
    assetUpdateData: Partial<{
      name: string;
      description: string;
      url: string;
      type: string;
    }>,
  ): Promise<Theme> {
    const theme = await this.getThemeById(applicationId, themeId);
    const assetIndex = theme.assets.findIndex((asset) => asset.id === assetId);
    if (assetIndex === -1) {
      throw new NotFoundException(`Asset with ID ${assetId} not found`);
    }
    theme.assets[assetIndex] = {
      ...theme.assets[assetIndex],
      ...assetUpdateData,
    };
    await this.themeRepository.update(theme);
    return theme;
  }

  async removeAssetById(
    applicationId: string,
    themeId: string,
    assetId: number,
  ): Promise<Theme> {
    const theme = await this.getThemeById(applicationId, themeId);
    theme.assets = theme.assets.filter((asset) => asset.id !== assetId);
    await this.themeRepository.update(theme);
    return theme;
  }

  async deleteAllAssets(
    applicationId: string,
    themeId: string,
  ): Promise<Theme> {
    const theme = await this.getThemeById(applicationId, themeId);
    theme.assets = [];
    await this.themeRepository.update(theme);
    return theme;
  }

  async setLaunchAssets(
    applicationId: string,
    themeId: string,
    launchAssets: LaunchAssets,
  ): Promise<Theme> {
    const theme = await this.getThemeById(applicationId, themeId);
    theme.launchAssets = launchAssets;
    await this.themeRepository.update(theme);
    return theme;
  }

  async updateLaunchAssets(
    applicationId: string,
    themeId: string,
    launchAssetsUpdate: Partial<LaunchAssets>,
  ): Promise<Theme> {
    const theme = await this.getThemeById(applicationId, themeId);
    theme.launchAssets = { ...theme.launchAssets, ...launchAssetsUpdate };
    await this.themeRepository.update(theme);
    return theme;
  }

  async deleteLaunchAssets(
    applicationId: string,
    themeId: string,
  ): Promise<Theme> {
    const theme = await this.getThemeById(applicationId, themeId);
    theme.launchAssets = undefined;
    await this.themeRepository.update(theme);
    return theme;
  }

  async setSplashAsset(
    applicationId: string,
    themeId: string,
    splashAsset: SplashAsset,
  ): Promise<Theme> {
    const theme = await this.getThemeById(applicationId, themeId);
    theme.splashAsset = splashAsset;
    await this.themeRepository.update(theme);
    return theme;
  }

  async updateSplashAsset(
    applicationId: string,
    themeId: string,
    splashAssetUpdate: Partial<SplashAsset>,
  ): Promise<Theme> {
    const theme = await this.getThemeById(applicationId, themeId);
    theme.splashAsset = { ...theme.splashAsset, ...splashAssetUpdate };
    await this.themeRepository.update(theme);
    return theme;
  }

  async deleteSplashAsset(
    applicationId: string,
    themeId: string,
  ): Promise<Theme> {
    const theme = await this.getThemeById(applicationId, themeId);
    theme.splashAsset = undefined;
    await this.themeRepository.update(theme);
    return theme;
  }
}
