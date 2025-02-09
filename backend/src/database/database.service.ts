import { Injectable, OnModuleInit } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PrismaClient } from '@prisma/client';
import * as bcrypt from 'bcrypt';

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit {
  constructor(private readonly configService: ConfigService) {
    super();
  }
  async onModuleInit() {
    await this.$connect();
    this.$use(async (params, next) => {
      if (params.action == 'create' && params.model == 'User' ) {
        const user = params.args.data;
        const salt = bcrypt.genSaltSync(+ this.configService.get<number>('salt'));
        const hash = bcrypt.hashSync(user.password, salt);
        user.password = hash;
        params.args.data = user;
      }
      return next(params);
    });
  }

  async onModuleDestroy() {
    await this.$disconnect();
  }
}