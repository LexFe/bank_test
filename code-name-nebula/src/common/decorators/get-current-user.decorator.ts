import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export const GetCurrentUser = createParamDecorator(
  <T>(data: keyof T | undefined, context: ExecutionContext): T | T[keyof T] => {
    const request = context.switchToHttp().getRequest();
    if (!data) return request.user as T;
    return request.user[data];
  },
);