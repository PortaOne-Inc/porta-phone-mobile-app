import { Module, OnModuleInit } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { GithubProxyService } from './features/github-proxy/github-proxy.service';
import { GithubProxyController } from './features/github-proxy/github-proxy.controller';
import { ApplicationsModule } from './features/applications/applications.module';
import { FireormModule } from 'nestjs-fireorm';
import { CommonModule } from './common/common.module';
import { ThemesModule } from './features/themes/themes.module';
import { StartupService } from './startup/startup.service';
import { AuthModule } from './features/auth/auth.module';
import { UsersModule } from './features/users/users.module';
import { Reflector } from '@nestjs/core';
import { UsersService } from './features/users/users.service';
import { FirebaseAuthGuard } from './features/auth/guard/firebase-auth.guard';
import { UserRole } from './common/entities/userRoles/userRole';
import { TranslationsModule } from './features/translations/translations.module';

@Module({
    imports: [
        ConfigModule.forRoot({isGlobal: true}),
        FireormModule.forRoot({
            firestoreSettings: {},
            fireormSettings: {validateModels: true},
        }),
        FireormModule.forFeature([UserRole]),
        ApplicationsModule,
        CommonModule,
        AuthModule,
        ThemesModule,
        UsersModule,
        TranslationsModule,
    ],
    controllers: [GithubProxyController],
    providers: [
        GithubProxyService,
        StartupService,
        UsersService,
        Reflector,
        FirebaseAuthGuard,
    ],
})
export class AppModule implements OnModuleInit {
    constructor(private readonly initService: StartupService) {
    }

    async onModuleInit() {
        await this.initService.initializeDependencies();
    }
}
