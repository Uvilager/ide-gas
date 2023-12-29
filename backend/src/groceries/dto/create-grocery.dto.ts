import { IsNotEmpty } from 'class-validator';

export class CreateGroceryDto {
  @IsNotEmpty()
  name: string;

  @IsNotEmpty()
  quantity: number;
}
