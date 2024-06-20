import { CreateMinistroInput } from "@application/dto/create/create-ministro.input.dto";
import { MinistoService } from "@application/services/ministro.service";
import { Ministro } from "@domain/entities/ministro.entity";
import { Args, Mutation, Query, Resolver } from "@nestjs/graphql";

@Resolver(() => Ministro)
export class MinistroResolver {
  constructor(private readonly ministroService: MinistoService) {}

  @Mutation(() => Ministro)
  async createMinistro(@Args('createMinistro') createMinistroInput: CreateMinistroInput) {
    return await this.ministroService.createMinistro(createMinistroInput);
  }

  @Query(() => Ministro, {name: 'Ministro'})
  async findOneMinistro(@Args('findOneMinistro' , {type: () => String}) id: string)
  {
    return await this.ministroService.findOneMinistro(id);
  }

  @Query(() => [Ministro], {name: 'Ministros'})
  async findAllMinistro()
  {
    return await this.ministroService.findAllMinistro();
  }
}