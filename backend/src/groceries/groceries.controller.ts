import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
  Req,
} from '@nestjs/common';
import { GroceriesService } from './groceries.service';
import { CreateGroceryDto } from './dto/create-grocery.dto';
import { UpdateGroceryDto } from './dto/update-grocery.dto';
import { Grocery } from './entities/grocery.entity';
import { AuthGuard } from '@nestjs/passport';

@Controller('groceries')
@UseGuards(AuthGuard('jwt'))
export class GroceriesController {
  constructor(private readonly groceriesService: GroceriesService) {}

  @Post()
  create(
    @Req() req,
    @Body() createGroceryDto: CreateGroceryDto,
  ): Promise<Grocery> {
    return this.groceriesService.create(req, createGroceryDto);
  }

  @Get()
  findAll(@Req() req): Promise<Grocery[]> {
    return this.groceriesService.findAll(req);
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
