// src/features/publication-resources/publication-resources.controller.ts
import {
    Controller,
    Get,
    Post,
    Patch,
    Delete,
    Param,
    Body,
    Req,
    UseGuards,
} from '@nestjs/common';
import { ApiBearerAuth } from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';
import { PublicationResourcesService } from './publication-resources.service';
import { CreatePublicationResourceDto } from './dto/create-publication-resource.dto';
import { UpdatePublicationResourceDto } from './dto/update-publication-resource.dto';

@Controller('applications/:applicationId/publication-resources')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
export class PublicationResourcesController {
    constructor(private readonly service: PublicationResourcesService) {
    }

    @Post()
    create(
        @Req() req: any,
        @Param('applicationId') appId: string,
        @Body() dto: CreatePublicationResourceDto,
    ) {
        dto.applicationId = appId;
        return this.service.create(req.user.uid, dto);
    }

    @Get()
    findAll(@Req() req: any, @Param('applicationId') appId: string) {
        return this.service.findAll(req.user.uid, appId);
    }

    @Get(':id')
    findOne(@Req() req: any, @Param('id') id: string) {
        return this.service.findOne(req.user.uid, id);
    }

    @Patch(':id')
    update(
        @Req() req: any,
        @Param('id') id: string,
        @Body() dto: UpdatePublicationResourceDto,
    ) {
        return this.service.update(req.user.uid, id, dto);
    }

    @Delete(':id')
    remove(@Req() req: any, @Param('id') id: string) {
        return this.service.remove(req.user.uid, id);
    }
}
