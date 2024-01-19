import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { GroceriesService } from './groceries.service';
import { GroceriesController } from './groceries.controller';
import { Grocery } from './entities/grocery.entity';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  imports: [TypeOrmModule.forFeature([Grocery]), AuthModule],
  controllers: [GroceriesController],
  providers: [GroceriesService],
})
export class GroceriesModule {}
