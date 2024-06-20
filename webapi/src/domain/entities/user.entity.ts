import { ObjectType, Field, Int } from '@nestjs/graphql';
import { Base64 } from 'src/globalImport';

@ObjectType()
export class User {
  @Field(() => String)
  id: string;

  @Field(() => String, { description: 'Example field (placeholder)' })
  fotografia: string;//Base64<'png' | 'jpg' | 'jpeg'>;

  @Field(() => String, { description: 'Example field (placeholder)' })
  userName: string;

  @Field(() => String, { description: 'Example field (placeholder)' })
  password: string;

  @Field(() => String, { description: 'Example field (placeholder)' })
  phonenumber: string;
}
