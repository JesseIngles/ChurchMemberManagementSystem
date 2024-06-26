import { CreateMembroInput } from '@application/dto/create/create-membro.input.dto';
import { UpdateMembroInput } from '@application/dto/update/update-membro.input.dto';
import { PrismaService } from '@infra/data/client/prisma.service';
import { Injectable } from '@nestjs/common';
import { ImageUploaderService } from './imageuploader.service';

@Injectable()
export class MembroService {
  
  constructor(private readonly prismaservice: PrismaService,private readonly uploadService: ImageUploaderService) {}

  async create(createMembroInput: CreateMembroInput) {
    const fileName = `profile-${createMembroInput.nomeCompleto}-${Date.now()}`;
    createMembroInput.fotografia = await this.uploadService.uploadImage(createMembroInput.fotografia, fileName);
    return this.prismaservice.membro.create({
      data: createMembroInput,
    });
  }

  update(id: string, updateMembroInput: UpdateMembroInput) {
    return this.prismaservice.membro.update({
      where: {
        id,
      },
      data: {
        codigoMembro: updateMembroInput.codigoMembro,
        dataBaptismoAguas: updateMembroInput.dataBaptismoAguas,
        dataNascimento: updateMembroInput.dataNascimento,
        estadoCivil: updateMembroInput.estadoCivil,
        fotografia: updateMembroInput.fotografia,
        localNascimento: updateMembroInput.localNascimento,
        nomeCompleto: updateMembroInput.nomeCompleto,
        phonenumber: updateMembroInput.phonenumber,
      },
    });
  }
  encontrarMembros(search: string) {
    return this.prismaservice.membro.findMany({
      where: {
        nomeCompleto: {
          contains: search,
          mode: "insensitive"
        }
      }
    });
  }

  findOne(id: string) {
    return this.prismaservice.membro.findFirst({
      where: {
        id,
      },
    });
  }

  findAll() {
    return this.prismaservice.membro.findMany();
  }

  delete(id: string) {
    return this.prismaservice.membro.delete({
      where: {
        id,
      },
    });
  }
}
