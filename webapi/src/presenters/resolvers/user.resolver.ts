import { CreateUserInput } from '@application/dto/create/create-user.input.dto';
import { UpdateUserInput } from '@application/dto/update/update-user.input.dto';
import { UserService } from '@application/services/user.service';
import { User } from '@domain/entities/user.entity';
import { Resolver, Query, Mutation, Args, Int } from '@nestjs/graphql';

@Resolver(() => User)
export class UserResolver {
  constructor(private readonly userService: UserService) {}

  @Mutation(() => User)
  async createUser(@Args('createUserInput') createUserInput: CreateUserInput) {
    return await this.userService.create(createUserInput);
  }

  @Query(() => [User], { name: 'findAllUsers' })
  findAll() {
    return this.userService.findAll();
  }

  @Query(() => User, { name: 'user' })
  findOne(@Args('id', { type: () => String }) id: string) {
    return this.userService.findOne(id);
  }

  @Mutation(() => User)
  async updateUser(@Args('updateUserInput') updateUserInput: UpdateUserInput) {
    return await this.userService.update(updateUserInput.id, updateUserInput);
  }

  @Mutation(() => User)
  removeUser(@Args('id', { type: () => String }) id: string) {
    return this.userService.remove(id);
  }

  @Query(() => String, { name: 'LoginUser' })
  async loginUser(
    @Args('username', { type: () => String }) username: string,
    @Args('password', { type: () => String }) password: string,
  ): Promise<string> {
    const acesstoken = await this.userService.login(username, password);
    return acesstoken ;
  }

  @Query(() => User)
  getMyDetails(@Args('token') token: string) {
    return this.userService.getMyDetails(token);
  }
}
