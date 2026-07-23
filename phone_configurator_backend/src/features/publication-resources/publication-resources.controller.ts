// src/features/publication-resources/publication-resources.controller.ts
import {
  Controller,
  Get,
  Post,
  Patch,
  Delete,
  Param,
  Body,
  UseGuards,
} from '@nestjs/common';
import { ApiBearerAuth } from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';
import { CurrentUser, Principal } from '../auth/current-user.decorator';
import { PublicationResourcesService } from './publication-resources.service';
import { CreatePublicationResourceDto } from './dto/create-publication-resource.dto';
import { UpdatePublicationResourceDto } from './dto/update-publication-resource.dto';

@Controller('applications/:applicationId/publication-resources')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
export class PublicationResourcesController {
  constructor(private readonly service: PublicationResourcesService) {}

  @Post()
  create(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
    @Body() dto: CreatePublicationResourceDto,
  ) {
    dto.applicationId = appId;
    return this.service.create(user.uid, dto);
  }

  @Get()
  findAll(
    @CurrentUser() user: Principal,
    @Param('applicationId') appId: string,
  ) {
    return this.service.findAll(user.uid, appId);
  }

  @Get(':id')
  findOne(@CurrentUser() user: Principal, @Param('id') id: string) {
    return this.service.findOne(user.uid, id);
  }

  @Patch(':id')
  update(
    @CurrentUser() user: Principal,
    @Param('id') id: string,
    @Body() dto: UpdatePublicationResourceDto,
  ) {
    return this.service.update(user.uid, id, dto);
  }

  @Delete(':id')
  remove(@CurrentUser() user: Principal, @Param('id') id: string) {
    return this.service.remove(user.uid, id);
  }
}
