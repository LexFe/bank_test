import {
  Controller,
  Post,
  Body,
  UseGuards,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthDto } from './dto/auth.dto';
import {  Tokens ,JwtPayloadWithRt } from './types/index';
import { RtGuard, AtGuard } from '../common/guards';
import { GetCurrentUserId, GetCurrentUser, Public } from '../common/decorators';
import { RegisterDto } from './dto';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Public()
  @HttpCode(HttpStatus.OK)
  @Post('login')
  async login(@Body() authDto: AuthDto): Promise<Tokens> {
    return this.authService.login(authDto);
  }

  @Public()
  @Post('register')
  async register(@Body() registerDto: RegisterDto): Promise<string> {
    const user = await this.authService.register(registerDto);
    return "User registered successfully";
  }

  @Public()
  @UseGuards(RtGuard)
  @Post('refresh')
  async refresh(
    @GetCurrentUserId() id: string,
    @GetCurrentUser<JwtPayloadWithRt>('refreshToken') refreshToken: string,
  ): Promise<Tokens> {
    return this.authService.refreshTokens(id, refreshToken);
  }

  @Post('logout')
  async logout(@GetCurrentUserId() id: string): Promise<boolean> {
    return this.authService.logout(id);
  }
}
