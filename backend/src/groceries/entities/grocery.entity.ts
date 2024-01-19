import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';

import { User } from 'src/users/entities/user.entity';

@Entity()
export class Grocery {
  @PrimaryGeneratedColumn()
  id: string;

  @Column()
  name: string;

  @Column()
  quantity: number;

  @ManyToOne(() => User, (user) => user.groceries)
  user: User;
}
