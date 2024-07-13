import { IsEmail, IsEnum, IsNotEmpty, IsString } from 'class-validator';

export class CreateUserDto {

  @IsEmail()
  @IsNotEmpty()
  email: string;


  @IsNotEmpty()
  @IsString()
  name: string;

  @IsEnum(['ADMIN', 'USER'])
  role: 'ADMIN' | 'USER';

  @IsNotEmpty()
  @IsString()
  password: string;


  @IsNotEmpty()
  @IsString()
  phone: string;

  @IsNotEmpty()
  @IsString()
  currency: string;

}