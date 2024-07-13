import {  Module } from '@nestjs/common';
import { UsersService } from './users.service';
import { UsersController } from './users.controller';
import { PrismaModule } from '../../database/database.module';
import { JwtService } from '@nestjs/jwt';

@Module({
  imports: [PrismaModule],
  controllers: [UsersController],
  providers: [UsersService,JwtService],
  exports: [UsersModule],
})
export class UsersModule {}
