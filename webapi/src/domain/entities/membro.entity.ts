import { Field, ObjectType } from "@nestjs/graphql";
import { Base64 } from "src/globalImport";

@ObjectType()
export class Membro
{
  @Field(() => String)
  id: string;

  @Field(() => String, { description: 'Example field (placeholder)' })
  codigoMembro: string;

  @Field(() => String, { description: 'Example field (placeholder)' })
  nomeCompleto: string;

  @Field(() => String, { description: 'Example field (placeholder)' })
  fotografia: string;//Base64<'png' | 'jpg' | 'jpeg'>;

  @Field(() => String , { description: 'Example field (placeholder)' })
  phonenumber: string;

  @Field(() => String , { description: 'Example field (placeholder)' })
  localNascimento: string;

  @Field(() => String , { description: 'Example field (placeholder)' })
  dataNascimento: string;

  @Field(() => String, { description: 'Example field (placeholder)' })
  dataBaptismoEsp: string;

  @Field(() => String , { description: 'Example field (placeholder)' })
  dataBaptismoAguas: string;

  @Field(() => String , { description: 'Example field (placeholder)' })
  estadoCivil: string;
}