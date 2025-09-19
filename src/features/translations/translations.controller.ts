import {
  Controller,
  Get,
  Post,
  Delete,
  Param,
  Body,
  Res,
} from '@nestjs/common';
import { TranslationsService } from './translations.service';
import { Response } from 'express';
import { Translation } from './entities/translation';
import {
  ApiTags,
  ApiOperation,
  ApiParam,
  ApiBody,
  ApiResponse,
} from '@nestjs/swagger';

@ApiTags('Translations')
@Controller('translations')
export class TranslationsController {
  constructor(private readonly translationsService: TranslationsService) {}

  @ApiOperation({
    summary:
      'Generate and download an ARB translation zip file for a given app ID',
  })
  @ApiParam({ name: 'appId', required: true, description: 'Application ID' })
  @ApiResponse({
    status: 200,
    description: 'Returns a zip file containing ARB translations',
  })
  @Get('compose-arb/:appId')
  async composeArb(@Param('appId') appId: string, @Res() res: Response) {
    const result = await this.translationsService.composeArb(appId);
    res.setHeader('Content-Type', 'application/zip');
    result.pipe(res);
  }

  @ApiOperation({ summary: 'Retrieve all translations from Localizely' })
  @ApiResponse({
    status: 200,
    description: 'Returns an array of translations',
    type: [Translation],
  })
  @Get()
  async getTranslations(): Promise<Translation[]> {
    return this.translationsService.getTranslations();
  }

  @ApiOperation({ summary: 'Get translation overrides for a specific app' })
  @ApiParam({ name: 'appId', required: true, description: 'Application ID' })
  @ApiResponse({
    status: 200,
    description: 'Returns a list of overridden translations',
    type: [Translation],
  })
  @Get('overrides/:appId')
  async getOverridesByAppId(
    @Param('appId') appId: string,
  ): Promise<Translation[]> {
    return this.translationsService.getOverridesByAppId(appId);
  }

  @ApiOperation({ summary: 'Set a translation override for a specific app' })
  @ApiParam({ name: 'appId', required: true, description: 'Application ID' })
  @ApiBody({ type: Translation, description: 'Translation override data' })
  @ApiResponse({ status: 201, description: 'Override successfully set' })
  @Post('overrides/:appId')
  async setOverrideByAppId(
    @Param('appId') appId: string,
    @Body() translation: Translation,
  ) {
    await this.translationsService.setOverrideByAppId(appId, translation);
  }

  @ApiOperation({ summary: 'Delete a translation override for a specific app' })
  @ApiParam({ name: 'appId', required: true, description: 'Application ID' })
  @ApiBody({ type: Translation, description: 'Translation override to delete' })
  @ApiResponse({ status: 200, description: 'Override successfully deleted' })
  @Delete('overrides/:appId')
  async deleteOverrideByAppId(
    @Param('appId') appId: string,
    @Body() translation: Translation,
  ) {
    await this.translationsService.deleteOverrideByAppId(appId, translation);
  }
}
