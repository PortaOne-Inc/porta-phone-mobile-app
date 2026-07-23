import { Module } from '@nestjs/common';
import { RefLinksService } from './ref-links.service';

@Module({
  providers: [RefLinksService],
  exports: [RefLinksService],
})
export class RefsModule {}
