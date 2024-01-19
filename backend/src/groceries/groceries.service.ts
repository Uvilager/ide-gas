import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { FindOneOptions, Repository } from 'typeorm';

import { CreateGroceryDto } from './dto/create-grocery.dto';
import { UpdateGroceryDto } from './dto/update-grocery.dto';
import { Grocery } from './entities/grocery.entity';

@Injectable()
export class GroceriesService {
  constructor(
    @InjectRepository(Grocery) private groceryRepository: Repository<Grocery>,
  ) {}

  // Create a Grocery
  async create(req, createGroceryDto: CreateGroceryDto): Promise<Grocery> {
    try {
      const grocery = new Grocery();
      grocery.name = createGroceryDto.name;
      grocery.quantity = createGroceryDto.quantity;
      grocery.user = req.user;
      const response = await this.groceryRepository.save(grocery);
      return response;
    } catch (error) {
      console.log(error);
      throw error;
    }
  }

  // Fetch all Groceries
  async findAll(req): Promise<Grocery[]> {
    try {
      const response = await this.groceryRepository.find({
        where: { user: req.user },
      });
      return response;
    } catch (error) {
      console.log(error);
      throw error;
    }
  }

  // Fetch a single Grocery by ID
  async findOne(id: string): Promise<Grocery> {
    try {
      const response = await this.groceryRepository.findOneBy({ id });
      if (!response) {
        throw new NotFoundException(`Grocery with ID ${id} not found`);
      }
      return response;
    } catch (error) {
      throw error;
    }
  }

  // Update a single Grocery by ID
  async update(id: string, updateGroceryDto: UpdateGroceryDto): Promise<void> {
    try {
      const response = await this.groceryRepository.update(
        id,
        updateGroceryDto,
      );
      if (response.affected === 0) {
        throw new NotFoundException(`Grocery with ID ${id} not found`);
      }
    } catch (error) {
      throw error;
    }
  }

  // Remove a Grocery
  async remove(id: number): Promise<void> {
    try {
      const response = await this.groceryRepository.delete(id);
      if (response.affected === 0) {
        throw new NotFoundException(`Grocery with ID ${id} not found`);
      }
    } catch (error) {
      throw error;
    }
  }
}
