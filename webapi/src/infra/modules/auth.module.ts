import { JwtAuthService } from "@infra/auth/jwt.service";
import { Module } from "@nestjs/common";
import { JwtModule } from "@nestjs/jwt";

@Module({
  imports: [
    JwtModule.register({
    secret: 'Jessé João Carlos Inglês -- Mr. English',
    signOptions: { expiresIn: '60h' },
  }),
  ],
  providers: [JwtAuthService],
  exports: [JwtModule, JwtAuthService]
  
})
export class AuthModel {}