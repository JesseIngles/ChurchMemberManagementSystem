import { ImageUploaderService } from '@application/services/imageuploader.service';
import { MembroService } from '@application/services/membro.service';
import { Module } from '@nestjs/common';
import { MembroResolver } from '@resolvers/membro.resolver';

@Module({
  providers: [MembroResolver, MembroService, ImageUploaderService],
})
export class MembroModule {}
