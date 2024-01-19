import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

import { Grocery } from 'src/groceries/entities/grocery.entity';

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  username: string;

  @Column({ unique: true })
  email: string;

  @Column()
  password: string;

  @OneToMany(() => Grocery, (grocery) => grocery.user)
  groceries: Grocery[];
}
