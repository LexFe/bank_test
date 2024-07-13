import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { NestExpressApplication } from '@nestjs/platform-express';
import { ConfigService } from '@nestjs/config';
import * as csurf from 'csurf';
import * as cookieParser from 'cookie-parser';
import fastifyCsrf from '@fastify/csrf-protection';
import helmet from 'helmet';
import fastifyHelmet from '@fastify/helmet';
import { FastifyAdapter, NestFastifyApplication } from '@nestjs/platform-fastify';

async function bootstrap() {
  // const app = await NestFactory.create<NestFastifyApplication>(AppModule, new FastifyAdapter());

  const app = await NestFactory.create<NestExpressApplication>(AppModule);
  // const configService = app.get(ConfigService);

  // const port = configService.get<number>('port');
  app.useGlobalPipes(new ValidationPipe({
    whitelist: true,
    transform: true,
    forbidNonWhitelisted: true,
    transformOptions: {
      enableImplicitConversion: true,
    },
  }));

  // // basic
  // app.use(cookieParser())
  // app.use(csurf({cookie: true}));
  // app.use(helmet({
  //   contentSecurityPolicy: {
  //     directives: {
  //       defaultSrc: ["'self'"],
  //       scriptSrc: ["'self'", "'unsafe-inline'", "'unsafe-eval'"],
  //       styleSrc: ["'self'", "'unsafe-inline'"],
  //       imgSrc: ["'self'", 'data:', 'validator.swagger.io'],
  //     },
  //   },
  // }));

  // await app.register(fastifyHelmet, {
  //   contentSecurityPolicy: {
  //     directives: {
  //       defaultSrc: [`'self'`, 'unpkg.com'],
  //       styleSrc: [
  //         `'self'`,
  //         `'unsafe-inline'`,
  //         'cdn.jsdelivr.net',
  //         'fonts.googleapis.com',
  //         'unpkg.com',
  //       ],
  //       fontSrc: [`'self'`, 'fonts.gstatic.com', 'data:'],
  //       imgSrc: [`'self'`, 'data:', 'cdn.jsdelivr.net'],
  //       scriptSrc: [
  //         `'self'`,
  //         `https: 'unsafe-inline'`,
  //         `cdn.jsdelivr.net`,
  //         `'unsafe-eval'`,
  //       ],
  //     },
  //   },
  // });

  // await app.register(fastifyCsrf);
  await app.listen(3000);
  console.log(`Application is running on: ${await app.getUrl()}`);
}
bootstrap();
