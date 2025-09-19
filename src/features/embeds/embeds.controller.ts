import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';
import { EmbedsService } from './embeds.service';
import { FirebaseAuthGuard } from '../auth/guard/firebase-auth.guard';
import { ApiBearerAuth } from '@nestjs/swagger';
import { CreateEmbeddedDto } from './dto/create-embed.dto';
import { UpdateEmbeddedDto } from './dto/update-embed.dto';

@Controller('applications/:applicationId/embeds')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
export class EmbedsController {
  constructor(private readonly service: EmbedsService) {}

  @Post()
  async create(
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @Body() dto: CreateEmbeddedDto,
  ) {
    const uid: string = req.user.uid;
    dto.applicationId = applicationId;
    return this.service.create(uid, dto);
  }

  @Get()
  findAll(
    @Req() req: any,
    @Param('applicationId') applicationId: string,
    @Query('limit') _limit?: string,
    @Query('cursor') _cursor?: string,
  ) {
    const uid: string = req.user.uid;
    return this.service.findAll(uid, applicationId);
  }

  @Get(':id')
  findOne(@Req() req: any, @Param('id') id: string) {
    const uid: string = req.user.uid;
    return this.service.findOne(uid, id);
  }

  @Patch(':id')
  update(
    @Req() req: any,
    @Param('id') id: string,
    @Body() dto: UpdateEmbeddedDto,
  ) {
    const uid: string = req.user.uid;
    return this.service.update(uid, id, dto);
  }

  @Delete(':id')
  remove(@Req() req: any, @Param('id') id: string) {
    const uid: string = req.user.uid;
    return this.service.remove(uid, id);
  }

  @Post(':id/link')
  link(
    @Req() req: any,
    @Param('id') id: string,
    @Body() body: { type: string; id: string },
  ) {
    const uid: string = req.user.uid;
    return this.service.link(uid, id, body);
  }

  @Post(':id/unlink')
  unlink(
    @Req() req: any,
    @Param('id') id: string,
    @Body() body: { type: string; id: string },
  ) {
    const uid: string = req.user.uid;
    return this.service.unlink(uid, id, body);
  }
}
