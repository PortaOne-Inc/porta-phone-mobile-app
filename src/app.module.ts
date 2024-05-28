import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { GithubProxyService } from './github-proxy/github-proxy.service';
import { GithubProxyController } from './github-proxy/github-proxy.controller';

@Module({
  imports: [ConfigModule.forRoot({ isGlobal: true })],
  controllers: [AppController, GithubProxyController],
  providers: [AppService, GithubProxyService],
})
export class AppModule {}
