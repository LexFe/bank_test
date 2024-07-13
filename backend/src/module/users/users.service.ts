import {
  Injectable,
  NotFoundException,
  ForbiddenException,
} from '@nestjs/common';
import { PrismaService } from '../../database/database.service';
import { CreateUserDto } from './dto';
import { User } from '@prisma/client';

@Injectable()
export class UsersService {
  constructor(private prisma: PrismaService) { }

  async user(id: string): Promise<User> {
    const user = await this.prisma.user.findFirst({ where: { id } });
    if (!user) {
      throw new NotFoundException('User not found');
    }
    return user;
  }

  async users(skip: number, take: number): Promise<User[]> {
    return this.prisma.user.findMany({
      take,
      skip,
    });
  }

  async createUser(data: CreateUserDto): Promise<string> {

    const user = await this.prisma.user.findUnique({
      where: { email: data.email },
    });

    if (user) {
      throw new ForbiddenException('User already exists');
    }


    await this.prisma.user.create(
      {
        data,
      }
    );

    return "User created successfully"
  }

  async updateUser(id: string, data: CreateUserDto): Promise<string> {
    const user = await this.prisma.user.findUnique({
      where: { id: id },
    });

    if (!user) {
      throw new NotFoundException('User not found');
    }

    if (user.email !== data.email) {
      const user = await this.prisma.user.findFirst({
        where: { email: data.email },
      });
      if (user) {
        throw new ForbiddenException('User already exists');
      }
    }

    await this.prisma.user.update({
      data,
      where: { id: id },
    });

    return "User updated successfully"
  }

  async deleteUser(where: { id: string }) {
    const user = await this.prisma.user.findUnique({
      where,
    });
    if (!user) {
      throw new NotFoundException('User not found');
    }

    await this.prisma.user.delete({
      where,
    });
    return {
      massage: 'User deleted successfully',
    };
  }

  async getReferralUrl(id: string): Promise<any> {
    const referralToken = Buffer.from(id.toString()).toString('base64');
    const referralUrl = `/sign-up?referralToke=${referralToken}`;
    return {
      referralToken,
      referralUrl,
    };
  }
}
