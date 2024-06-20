import { Module } from '@nestjs/common';
import { DataModule } from './data.module';
import { GraphQLModule } from '@nestjs/graphql';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';
import { join } from 'path';
import { JwtModule } from '@nestjs/jwt';
import { UserModule } from './user.module';
import { MembroModule } from './membro.module';
import { MinistroModule } from './ministro.module';
import { JwtAuthService } from '@infra/auth/jwt.service';
import { AuthModel } from './auth.module';
import { ImageUploaderService } from '@application/services/imageuploader.service';

@Module({
  imports: [
    DataModule,
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      autoSchemaFile: join(process.cwd(), 'src/schema.gql'),
    }),
    UserModule,
    MembroModule,
    MinistroModule,
    AuthModel
  ],
  //controllers: [AppService]
  //A idea é deixar no endereço base da api uma página web de introdução do serviço
})
export class AppModule {}
