import { Global, Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { CommonModule } from '../../common/common.module';
import { AuthService } from './auth.service';
import { UsersService } from '../users/users.service';

@Global()
@Module({
  imports: [CommonModule],
  providers: [AuthService, UsersService],
  controllers: [AuthController],
})
export class AuthModule {}
