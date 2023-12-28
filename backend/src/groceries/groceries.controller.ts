import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { GroceriesService } from './groceries.service';
import { CreateGroceryDto } from './dto/create-grocery.dto';
import { UpdateGroceryDto } from './dto/update-grocery.dto';

@Controller('groceries')
export class GroceriesController {
  constructor(private readonly groceriesService: GroceriesService) {}

  @Post()
  create(@Body() createGroceryDto: CreateGroceryDto) {
    return this.groceriesService.create(createGroceryDto);
  }

  @Get()
  findAll() {
    return this.groceriesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.groceriesService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateGroceryDto: UpdateGroceryDto) {
    return this.groceriesService.update(+id, updateGroceryDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.groceriesService.remove(+id);
  }
}
