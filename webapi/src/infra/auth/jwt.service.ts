import { User } from "@domain/entities/user.entity";
import { Injectable } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";

@Injectable()
export class JwtAuthService
{
  constructor(private jwtService: JwtService){}

  async generateToken(user: User){
    const payload = {username: user.userName, sub: user.id};
    return await this.jwtService.signAsync(payload);
  }
  
}