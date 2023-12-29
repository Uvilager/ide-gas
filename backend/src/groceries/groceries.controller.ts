import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { GroceriesService } from './groceries.service';
import { CreateGroceryDto } from './dto/create-grocery.dto';
import { UpdateGroceryDto } from './dto/update-grocery.dto';
import { Grocery } from './entities/grocery.entity';

@Controller('groceries')
export class GroceriesController {
  constructor(private readonly groceriesService: GroceriesService) {}

  @Post()
  create(@Body() createGroceryDto: CreateGroceryDto): Promise<Grocery> {
    return this.groceriesService.create(createGroceryDto);
  }

  @Get()
  findAll(): Promise<Grocery[]> {
    return this.groceriesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<Grocery> {
    return this.groceriesService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateGroceryDto: UpdateGroceryDto,
  ): Promise<void> {
    return this.groceriesService.update(id, updateGroceryDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string): Promise<void> {
    return this.groceriesService.remove(+id);
  }
}
