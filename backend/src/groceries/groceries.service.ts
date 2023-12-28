import { Injectable } from '@nestjs/common';
import { CreateGroceryDto } from './dto/create-grocery.dto';
import { UpdateGroceryDto } from './dto/update-grocery.dto';

@Injectable()
export class GroceriesService {
  create(createGroceryDto: CreateGroceryDto) {
    return 'This action adds a new grocery';
  }

  findAll() {
    return `This action returns all groceries`;
  }

  findOne(id: number) {
    return `This action returns a #${id} grocery`;
  }

  update(id: number, updateGroceryDto: UpdateGroceryDto) {
    return `This action updates a #${id} grocery`;
  }

  remove(id: number) {
    return `This action removes a #${id} grocery`;
  }
}
