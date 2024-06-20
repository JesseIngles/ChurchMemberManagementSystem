import { Field, InputType, PartialType } from "@nestjs/graphql";
import { CreateMembroInput } from "../create/create-membro.input.dto";

@InputType()
export class UpdateMembroInput extends PartialType(CreateMembroInput)
{
  @Field(() => String)
  id: string;
}