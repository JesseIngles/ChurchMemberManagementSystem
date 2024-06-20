import { Field, InputType, Int, PartialType } from "@nestjs/graphql";
import { CreateUserInput } from "../create/create-user.input.dto";

@InputType()
export class UpdateUserInput extends PartialType(CreateUserInput) {
  @Field(() => String)
  id: string;
}