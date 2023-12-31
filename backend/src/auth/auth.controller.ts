import { Controller, Post, Body } from '@nestjs/common';

import { AuthService } from './auth.service';
import { SignUpDto } from './dto/sign-up.dto';
import { SignInDto } from './dto/sign-in.dto';
import { User } from 'src/users/entities/user.entity';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('/register')
  async create(@Body() signUpDto: SignUpDto): Promise<User> {
    await this.authService.register(signUpDto);
    return this.authService.login(signUpDto);
  }

  @Post('/login')
  login(@Body() SignInDto: SignInDto): Promise<User> {
    return this.authService.login(SignInDto);
  }
}
