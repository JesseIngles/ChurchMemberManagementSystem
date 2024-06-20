import { CreateUserInput } from '@application/dto/create/create-user.input.dto';
import { UpdateUserInput } from '@application/dto/update/update-user.input.dto';
import * as bcrypt from 'bcrypt';
import { JwtAuthService } from '@infra/auth/jwt.service';
import { PrismaService } from '@infra/data/client/prisma.service';
import { Injectable } from '@nestjs/common';
import { User } from '@domain/entities/user.entity';
import { ImageUploaderService } from './imageuploader.service';

@Injectable()
export class UserService {
  constructor(
    private readonly prismaService: PrismaService,
    private readonly authService: JwtAuthService,
    private readonly uploadService: ImageUploaderService
  ) {}
  async create(createUserInput: CreateUserInput) {
    createUserInput.password = await bcrypt.hash(createUserInput.password, 10);
    const fileName = `profile-${createUserInput.userName}-${Date.now()}`
    createUserInput.fotografia = await this.uploadService.uploadImage(createUserInput.fotografia, fileName);
    
    return await this.prismaService.user.create({
      data: createUserInput,
    });
  }

  findAll() {
    return this.prismaService.user.findMany();
  }

  findOne(id: string) {
    return this.prismaService.user.findFirst({
      where: {
        id,
      },
    });
  }

  async update(id: string, updateUserInput: UpdateUserInput) {
    return this.prismaService.user.update({
      where: {
        id,
      },
      data: {
        userName: updateUserInput.userName,
        fotografia: updateUserInput.fotografia,
        password: await bcrypt.hash(updateUserInput.password, 10),
        phonenumber: updateUserInput.phonenumber,
      },
    });
  }

  remove(id: string) {
    return this.prismaService.user.delete({
      where: {
        id,
      },
    });
  }

  async login(username: string, password: string) {
    const usuario: User = await this.prismaService.user.findFirst({
      where: {
        userName: username,
      },
    });
    return usuario != null && (await bcrypt.compare(password, usuario.password))
      ? await this.authService.generateToken(usuario)
      : '';
  }
}
