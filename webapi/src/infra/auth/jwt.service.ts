import { User } from "@domain/entities/user.entity";
import { Injectable, UnauthorizedException } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";

@Injectable()
export class JwtAuthService
{
  constructor(private jwtService: JwtService){}

  async generateToken(user: User){
    const payload = {username: user.userName, sub: user.id};
    return await this.jwtService.signAsync(payload);
  }

  async verify(token: string): Promise<any> {
    try {
      const decoded = await this.jwtService.verifyAsync(token);
      return decoded;
    } catch (e) {
      throw new UnauthorizedException('Invalid token');
    }
  }
  
}