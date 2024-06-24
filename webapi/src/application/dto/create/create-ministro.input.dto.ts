import { Field, InputType } from "@nestjs/graphql";
import { CreateMembroInput } from "./create-membro.input.dto";
import { Base64 } from "src/globalImport";

@InputType()
export class CreateMinistroInput {
  @Field(() => String, { description: 'Example field (placeholder)' })
  membroId: string;

  @Field(() => String, { description: 'Example field (placeholder)' })
  dataBaptismoEsp: string;

  @Field(() => String, { description: 'Example field (placeholder)' })
  biografia: string
}