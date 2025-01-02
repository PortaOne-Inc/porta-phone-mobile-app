import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from 'nestjs-fireorm';
import { BaseFirestoreRepository } from 'fireorm';
import { Theme } from '../common/entities/theme/theme';

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
}
