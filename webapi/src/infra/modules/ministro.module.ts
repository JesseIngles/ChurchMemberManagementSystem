import { MinistoService } from "@application/services/ministro.service";
import { Module } from "@nestjs/common";
import { MinistroResolver } from "@resolvers/ministro.resolver";

@Module({
  providers: [MinistroResolver, MinistoService]
})

export class MinistroModule {}