import { Global, Module } from '@nestjs/common';
import { PassportModule } from '@nestjs/passport';
import { AuthController } from './auth.controller';
import { CommonModule } from '../common/common.module';
import { AuthService } from './auth.service';
import { UsersService } from '../users/users.service';

@Global()
@Module({
  imports: [
    PassportModule.register({ defaultStrategy: 'firebase-jwt' }),
    CommonModule,
  ],
  providers: [AuthService, UsersService],
  exports: [PassportModule],
  controllers: [AuthController],
})
export class AuthModule {}
