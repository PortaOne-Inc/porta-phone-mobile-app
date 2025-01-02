import { Module, OnModuleInit } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { GithubProxyService } from './github-proxy/github-proxy.service';
import { GithubProxyController } from './github-proxy/github-proxy.controller';
import { ApplicationsModule } from './applications/applications.module';
import { FireormModule } from 'nestjs-fireorm';
import { CommonModule } from './common/common.module';
import { ThemesModule } from './themes/themes.module';
import { InitService } from './init/init.service';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { Reflector } from '@nestjs/core';
import { UsersService } from './users/users.service';
import { FirebaseAuthGuard } from './auth/guard/firebase-auth.guard';
import { UserRole } from './common/entities/userRoles/userRole';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    FireormModule.forRoot({
      firestoreSettings: {},
      fireormSettings: { validateModels: true },
    }),
    FireormModule.forFeature([UserRole]),
    ApplicationsModule,
    CommonModule,
    AuthModule,
    ThemesModule,
    UsersModule,
  ],
  controllers: [AppController, GithubProxyController],
  providers: [
    AppService,
    GithubProxyService,
    InitService,
    UsersService,
    Reflector,
    FirebaseAuthGuard,
  ],
})
export class AppModule implements OnModuleInit {
  constructor(private readonly initService: InitService) {}

  async onModuleInit() {
    await this.initService.initializeDependencies();
  }
}
