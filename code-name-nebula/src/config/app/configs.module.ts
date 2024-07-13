import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import configs from './configs';
import { JwtModule } from '@nestjs/jwt';

@Module({
  imports: [
    ConfigModule.forRoot({
    cache: true,
    isGlobal: true,
    load: [configs],
    envFilePath: process.env.NODE_ENV === 'prod' ? '.env.prod' : '.env.dev',
  })],
  exports: [ConfigsModule],
})
export class ConfigsModule {}
