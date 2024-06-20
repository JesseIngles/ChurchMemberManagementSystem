import { Field, InputType, Int } from "@nestjs/graphql";
import { Base64 } from "src/globalImport";

@InputType()
export class CreateUserInput {
  @Field(() => String, { description: 'Example field (placeholder)' })
  userName: string;
  
  @Field(() => String, { description: 'Example field (placeholder)' })
  fotografia: string;

  @Field(() => String, { description: 'Example field (placeholder)' })
  password: string;

  @Field(() => String, { description: 'Example field (placeholder)' })
  phonenumber: string;
}