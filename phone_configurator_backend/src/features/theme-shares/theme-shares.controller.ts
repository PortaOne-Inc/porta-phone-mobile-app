import { Body, Controller, Get, Param, Post, UseGuards } from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiBody,
  ApiOperation,
  ApiParam,
  ApiResponse,
  ApiTags,
} from '@nestjs/swagger';
import { ThemeSharesService } from './theme-shares.service';
import { CreateShareTokenDto } from './dto/theme-shares.dto';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';
import { Roles } from '../auth/guard/roles.decorator';
import { CurrentUser, Principal } from '../auth/current-user.decorator';

@ApiTags('theme-shares')
@Controller('theme-shares')
export class ThemeSharesController {
  constructor(private readonly service: ThemeSharesService) {}

  @Post()
  @ApiBearerAuth()
  @UseGuards(FirebaseAuthGuard)
  @Roles('admin', 'user')
  @ApiOperation({ summary: 'Create a share token for a theme' })
  @ApiBody({
    type: CreateShareTokenDto,
    description: 'Application and theme to share',
  })
  @ApiResponse({ status: 201, description: 'Share token created successfully' })
  @ApiResponse({ status: 401, description: 'Unauthorized' })
  @ApiResponse({ status: 404, description: 'Theme not found' })
  async createShareToken(
    @Body() dto: CreateShareTokenDto,
    @CurrentUser() user: Principal,
  ) {
    const uid = user.uid;
    return this.service.createShareToken(
      dto.applicationId,
      dto.themeId,
      uid,
      dto.tag,
    );
  }

  @Get(':token')
  @ApiOperation({ summary: 'Get aggregated theme preview by share token' })
  @ApiParam({ name: 'token', required: true, description: 'Share token UUID' })
  @ApiResponse({
    status: 200,
    description: 'Aggregated theme data with all sub-configs',
  })
  @ApiResponse({
    status: 404,
    description: 'Share token not found or inactive',
  })
  async getSharedThemePreview(@Param('token') token: string) {
    return this.service.getSharedThemePreview(token);
  }
}
