import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Grocery {
  @PrimaryGeneratedColumn()
  id: string;

  @Column()
  name: string;

  @Column()
  quantity: number;
}
