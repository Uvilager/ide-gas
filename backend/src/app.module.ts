import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { GroceriesModule } from './groceries/groceries.module';
import { UsersModule } from './users/users.module';

@Module({
  imports: [GroceriesModule, UsersModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
