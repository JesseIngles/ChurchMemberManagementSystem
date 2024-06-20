import { CreateMembroInput } from '@application/dto/create/create-membro.input.dto';
import { CreateMinistroInput } from '@application/dto/create/create-ministro.input.dto';
import { PrismaService } from '@infra/data/client/prisma.service';
import { Injectable } from '@nestjs/common';

@Injectable()
export class MinistoService {
  constructor(private readonly prismaService: PrismaService) {}

  async createMinistro(createMinistroInput: CreateMinistroInput) {
    return await this.prismaService.ministro.create({
      data: {
        dataBaptismoEsp: createMinistroInput.dataBaptismoEsp,
        membro: {
          connect: {
            id: createMinistroInput.membroId,
          },
        },
      },
    });
  }
  
  async findOneMinistro(id: string) {
    return await this.prismaService.ministro.findFirst({
      include:{
        membro: true
      },
      where: {
        id: id
      }
    })
  }

  async findAllMinistro() {
    return await this.prismaService.ministro.findMany({
      include: {
        membro: true
      }
    });
  }
}
