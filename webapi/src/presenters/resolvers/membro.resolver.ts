import { CreateMembroInput } from '@application/dto/create/create-membro.input.dto';
import { UpdateMembroInput } from '@application/dto/update/update-membro.input.dto';
import { MembroService } from '@application/services/membro.service';
import { Membro } from '@domain/entities/membro.entity';
import { Args, Mutation, Query, Resolver } from '@nestjs/graphql';

@Resolver(() => Membro)
export class MembroResolver {
  constructor(private readonly membroService: MembroService) {}

  @Mutation(() => Membro)
  async createMembro(@Args('createMembroInput') createMembroInput: CreateMembroInput) {
    return await this.membroService.create(createMembroInput);
  }

  @Mutation(() => Membro)
  updateMembro(@Args('updateMembroInput') updateMembroInput: UpdateMembroInput) {
    return this.membroService.update(updateMembroInput.id, updateMembroInput);
  }

  @Mutation(() => Membro)
  deleteMembro(@Args('id') id: string) {
    return this.membroService.delete(id);
  } 

  @Query(() => [Membro], { name: 'findAllMembros'})
  findAllMembros()
  {
    return this.membroService.findAll();
  }

  @Query(() => Membro, {name: "Membro"})
  findOneMembro(@Args('findOneMembro', {type: () => String}) id:string)
  {
    return this.membroService.findOne(id);
  }

  @Query(() => [Membro], {name:"MembrosFiltrados"})
  searchMembros(@Args('name', {type: () => String}) search:string)
  {
    return this.membroService.encontrarMembros(search);
  }
  
}

