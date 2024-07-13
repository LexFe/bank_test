import { Injectable, NestInterceptor, ExecutionContext, CallHandler } from '@nestjs/common';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import  { Response }  from '../interfaces';

@Injectable()
export class ResponseFormatInterceptor<T> implements NestInterceptor<T, Response<T>> {
  intercept(context: ExecutionContext, next: CallHandler):  Observable<Response<T>> {
    return next.handle().pipe(
      map(data => {
        const response: Response<T> = {
          message: 'Success',
          statusCode: context.switchToHttp().getResponse().statusCode,
          data: data !== undefined ? data : null,
        };
        return response;
      }),
    );
  }
}
