import { Module } from '@nestjs/common';
import { GroceriesService } from './groceries.service';
import { GroceriesController } from './groceries.controller';

@Module({
  controllers: [GroceriesController],
  providers: [GroceriesService],
})
export class GroceriesModule {}
