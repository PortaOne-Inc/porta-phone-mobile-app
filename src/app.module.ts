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
import { UserRole } from './features/users/entities/userRole';
import { TranslationsModule } from './features/translations/translations.module';
import { AssetsModule } from './features/assets/assets.module';
import { EmbedsModule } from './features/embeds/embeds.module';
import { PublicationResourcesModule } from './features/publication-resources/publication-resources.module';
import { ColorSchemesModule } from './features/themes/features/color-schemes/color-schemes.module';
import { WidgetConfigsModule } from './features/themes/features/widget-configs/widget-configs.module';
import { FeatureAccessModule } from './features/themes/features/feature-access/feature-access.module';
import { PageConfigsModule } from './features/themes/features/page-configs/page-configs.module';
import { SplashAssetsModule } from './features/themes/features/splash-assets/splash-assets.module';
import { LaunchAssetsModule } from './features/themes/features/launch-assets/launch-assets.module';
import { ArtifactsModule } from './features/artifacts';
import { RefsModule } from './features/common/refs/refs.module';
import { GenerateThemesModule } from './features/themes/features/generate/generate.module';
import { ThemeSharesModule } from './features/theme-shares/theme-shares.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    FireormModule.forRoot({
      firestoreSettings: {},
      fireormSettings: { validateModels: false },
    }),
    FireormModule.forFeature([UserRole]),
    ApplicationsModule,
    CommonModule,
    AuthModule,
    ThemesModule,
    UsersModule,
    TranslationsModule,
    AssetsModule,
    EmbedsModule,
    PublicationResourcesModule,
    ColorSchemesModule,
    WidgetConfigsModule,
    PageConfigsModule,
    FeatureAccessModule,
    SplashAssetsModule,
    LaunchAssetsModule,
    ArtifactsModule,
    RefsModule,
    GenerateThemesModule,
    ThemeSharesModule,
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
  constructor(private readonly initService: StartupService) {}

  async onModuleInit() {
    await this.initService.initializeDependencies();
  }
}
