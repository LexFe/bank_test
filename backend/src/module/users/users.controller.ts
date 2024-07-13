import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  Query,
  ParseIntPipe,
 Res,
} from '@nestjs/common';
import { UsersService } from './users.service';
import { GetCurrentUserId } from 'src/common/decorators';
import { User } from '@prisma/client';
import { CreateUserDto } from './dto';
import { Roles } from 'src/common/decorators/get-cerrent-user-rule.decorator';
import { RoleGlobal } from 'src/common/enums';

@Roles(RoleGlobal.ADMIN)
@Controller('users')
export class UsersController {
  constructor(
    private readonly usersService: UsersService,
  ) {}

  @Get(':id')
  findOne(@Param('id') id: string): Promise<User> {
    return this.usersService.user(id);
  }


  @Get()
  async findAll(@Query('skip', ParseIntPipe) skip: number): Promise<User[]> {
    return await this.usersService.users(skip, 8);
  }

  @Post()
  create(@Body() createUser: CreateUserDto): Promise<string> {
    return this.usersService.createUser(createUser);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateUser: CreateUserDto,
  ): Promise<string> {
    return this.usersService.updateUser(id, updateUser);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.usersService.deleteUser({ id });
  }
}

