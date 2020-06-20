import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { MealOrder } from './mealOrder.entity';

@Entity({ name: 'meals' })
export class Meal {
    @PrimaryGeneratedColumn({ name: 'Id' })
    Id: number;

    @Column({ type: "varchar", length: 50, name: 'Name' })
    Name: string;

    @Column({ type: "varchar", length: 225, name: 'Description' })
    Description: string;

    @Column({ type: "int", name: 'Price' })
    Price: number;

    @OneToMany(type => MealOrder, mealOrders => mealOrders.meal)
    mealOrders: MealOrder[]
}