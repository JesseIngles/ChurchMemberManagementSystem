import { Field, ObjectType } from "@nestjs/graphql";
import { Membro } from "./membro.entity";

@ObjectType()
export class Ministro
{
  @Field(() => String)
  id: string;

  @Field(() => String, { description: 'Example field (placeholder)' })
  dataBaptismoEsp: string;

  @Field(() => String, { description: 'Example field (placeholder)' })
  membroId: string;

  @Field(() => Membro, { description: 'Example field (placeholder)' })
  membro: Membro

  @Field(() => String, { description: 'Example field (placeholder)' })
  biografia: string
}