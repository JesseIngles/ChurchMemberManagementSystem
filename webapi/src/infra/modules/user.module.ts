import { ImageUploaderService } from '@application/services/imageuploader.service';
import { UserService } from '@application/services/user.service';
import { Module } from '@nestjs/common';
import { UserResolver } from '@resolvers/user.resolver';
import { AuthModel } from './auth.module';


@Module({
  imports: [AuthModel],
  providers: [UserResolver, UserService, ImageUploaderService],
})
export class UserModule {}
