import {
  Body,
  Controller,
  Get,
  Param,
  Patch,
  Post,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../../../auth/guard/firebase-auth.guard';
import { Roles } from '../../../auth/guard/roles.decorator';
import { ThemeHistoryService } from './theme-history.service';
import { CreateThemeHistoryDto, ListThemeHistoryQueryDto, PatchThemeHistoryDto } from './dto/theme-history.dto';

@ApiTags('theme-history')
@Controller('applications/:applicationId/themes/:themeId/history')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
@Roles('admin', 'user')
export class ThemeHistoryController {
  constructor(private readonly service: ThemeHistoryService) {}

  @Post()
  async create(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Body() dto: CreateThemeHistoryDto,
    @Req() req: any,
  ) {
    return this.service.createSnapshot({
      themeId,
      applicationId,
      changedBy: req.user?.uid ?? '',
      tag: dto.tag,
      description: dto.description,
    });
  }

  @Get()
  async list(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Query() query: ListThemeHistoryQueryDto,
  ) {
    return this.service.listByTheme(applicationId, themeId, {
      limit: query.limit,
      startAfter: query.startAfter,
    });
  }

  @Get(':historyId')
  async getById(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Param('historyId') historyId: string,
  ) {
    return this.service.getById(applicationId, themeId, historyId);
  }

  @Patch(':historyId')
  async patchEntry(
    @Param('applicationId') applicationId: string,
    @Param('themeId') themeId: string,
    @Param('historyId') historyId: string,
    @Body() dto: PatchThemeHistoryDto,
  ) {
    return this.service.patchEntry(applicationId, themeId, historyId, dto);
  }
}
