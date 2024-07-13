import {
  Injectable,
  ForbiddenException,
} from '@nestjs/common';
import { PrismaService } from '../database/database.service';
import * as bcrypt from 'bcrypt';
import { AuthDto, RegisterDto } from './dto/index';
import { JwtService } from '@nestjs/jwt';
import { JwtPayload, Message, Tokens } from './types';
import { Role, User } from '@prisma/client';
import { ConfigService } from '@nestjs/config';


@Injectable()
export class AuthService {
  constructor(
    private prisma: PrismaService,
    private jwtService: JwtService,
    private readonly configService: ConfigService,
  ) {}



  async register(registerDto: RegisterDto): Promise<User> {
    const user = await this.prisma.user.findUnique({
      where: {
        email: registerDto.email,
        name : registerDto.name,
        lastName : registerDto.lastName,
        phone : registerDto.phone,
      },
    });

    if (user) throw new ForbiddenException('User already exists');


    const data = await this.prisma.user.create({
      data: {
        // id: await this.generatePlayerId(),
        email: registerDto.email,
        password: registerDto.password,
   
      },
    });

    return data;
  }

  async login(authDto: AuthDto): Promise<Tokens> {
    const user = await this.prisma.user.findUnique({
      where: {
        email: authDto.email,
      },
    });
    if (!user) throw new ForbiddenException('Access Denied');

    const passwordMatches = bcrypt.compareSync(authDto.password, user.password);

    if (!passwordMatches) throw new ForbiddenException('Access Denied');

    const tokens = await this.getTokens(user.id, user.email, user.role);
    await this.updateRtHash(user.id, tokens.refresh_token);
    return tokens;
  }

  async refreshTokens(id: string, rt: string): Promise<Tokens> {
    const user = await this.prisma.user.findUnique({
      where: {
        id: id,
      },
    });

    if (!user) throw new ForbiddenException('Access Denied');

    const rtMatches = await bcrypt.compare(rt, user.hashedRt);

    if (!rtMatches) throw new ForbiddenException('Access Denied');

    const tokens = await this.getTokens(user.id, user.email, user.role );

    await this.updateRtHash(user.id, tokens.refresh_token);

    return tokens;
  }

  async logout(id: string): Promise<boolean> {
    await this.prisma.user.updateMany({
      where: {
        id: id,
        hashedRt: {
          not: null,
        },
      },
      data: {
        hashedRt: null,
      },
    });

    return true;
  }



  async updateRtHash(id: string, rt: string): Promise<void> {
    // Hash the refresh token before storing it in the database use in env
    const hash = await bcrypt.hash(rt, + this.configService.get<number>('salt'));
    await this.prisma.user.update({
      where: {
        id: id,
      },
      data: {
        hashedRt: hash,
      },
    });
  }

  async getTokens(id: string, email: string ,roles: Role): Promise<Tokens> {
    const jwtPayload: JwtPayload = {
      sub: id,
      email: email,
      roles: roles,
    };

    const [at, rt] = await Promise.all([
      this.jwtService.signAsync(jwtPayload, {
        secret: this.configService.get<string>('at_secret'),
        expiresIn: this.configService.get<string>('at_expiration'),
      }),
      this.jwtService.signAsync(jwtPayload, {
        secret: this.configService.get<string>('rt_secret'),
        expiresIn: this.configService.get<string>('rt_expiration'),
      }),
    ]);

    return {
      access_token: at,
      refresh_token: rt,
    };
  }
}
