import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './authentication/auth.module';
import { PrismaModule } from './database/database.module';
import { JwtModule, JwtService } from '@nestjs/jwt';
import {
  AllExceptionsFilter,
} from './common/exceptions';
import {
  LoggingInterceptor,
  ResponseFormatInterceptor,
} from './common/interceptors';
import { AtGuard, RolesGuard } from './common/guards';
import { ConfigsModule } from './config/app/configs.module';
import { UsersModule } from './module/users/users.module';
import { APP_GUARD } from '@nestjs/core';


@Module({
  imports: [AuthModule, PrismaModule , ConfigsModule,PrismaModule ,UsersModule ],
  controllers: [AppController],
  providers: [
    AppService,

    {
      provide: 'APP_INTERCEPTOR',
      useClass: LoggingInterceptor,
    },
    {
      provide: 'APP_INTERCEPTOR',
      useClass: ResponseFormatInterceptor,
    },
    {
      provide: 'APP_FILTER',
      useClass: AllExceptionsFilter,
    },
    {
      provide: 'APP_GUARD',
      useClass: AtGuard,
    },
    {
      provide: APP_GUARD,
      useClass: RolesGuard,
    },
    // {
    //   provide: 'APP_INTERCEPTOR',
    //   useClass: ErrorsInterceptor
    // },
    JwtService,
  ],
})
export class AppModule {}
