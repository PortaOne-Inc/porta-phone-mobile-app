import {
  Controller,
  Get,
  Post,
  Delete,
  Param,
  Body,
  StreamableFile,
  UseGuards,
} from '@nestjs/common';
import type { Readable } from 'stream';
import { TranslationsService } from './translations.service';
import { Translation } from './entities/translation';
import {
  ApiTags,
  ApiOperation,
  ApiParam,
  ApiBody,
  ApiBearerAuth,
  ApiResponse,
} from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';

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
  // Intentionally unauthenticated: the phone build pipeline downloads the
  // ARB bundle server-to-server without user credentials.
  @Get('compose-arb/:appId')
  async composeArb(@Param('appId') appId: string): Promise<StreamableFile> {
    const result = await this.translationsService.composeArb(appId);
    return new StreamableFile(result as Readable, {
      type: 'application/zip',
    });
  }

  @ApiOperation({ summary: 'Retrieve all translations from Localizely' })
  @ApiResponse({
    status: 200,
    description: 'Returns an array of translations',
    type: [Translation],
  })
  @Get()
  @ApiBearerAuth()
  @UseGuards(FirebaseAuthGuard)
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
  @ApiBearerAuth()
  @UseGuards(FirebaseAuthGuard)
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
  @ApiBearerAuth()
  @UseGuards(FirebaseAuthGuard)
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
  @ApiBearerAuth()
  @UseGuards(FirebaseAuthGuard)
  async deleteOverrideByAppId(
    @Param('appId') appId: string,
    @Body() translation: Translation,
  ) {
    await this.translationsService.deleteOverrideByAppId(appId, translation);
  }
}
