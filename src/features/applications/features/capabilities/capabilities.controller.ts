import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  Put,
  UseGuards,
} from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../../../auth/guard/firebase-auth.guard';
import { CurrentUser, Principal } from '../../../auth/current-user.decorator';
import { Roles } from '../../../auth/guard/roles.decorator';
import { ApplicationCapabilitiesService } from './capabilities.service';

@ApiTags('capabilities')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
@Roles('admin', 'user')
@Controller('applications/:applicationId/capabilities')
export class ApplicationCapabilitiesController {
  constructor(private readonly svc: ApplicationCapabilitiesService) {}

  @Get()
  async get(
    @Param('applicationId') applicationId: string,
    @CurrentUser() user: Principal,
  ) {
    return this.svc.get(user.uid, applicationId);
  }

  @Put()
  @HttpCode(HttpStatus.OK)
  async update(
    @Param('applicationId') applicationId: string,
    @CurrentUser() user: Principal,
    @Body() body: unknown,
  ) {
    return this.svc.update(user.uid, applicationId, body);
  }
}
