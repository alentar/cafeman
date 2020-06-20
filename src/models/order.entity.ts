import { Entity, Column, PrimaryGeneratedColumn, JoinColumn, ManyToOne, OneToMany } from 'typeorm';
import { Customer } from './customer.entity';
import { MealOrder } from './mealOrder.entity';


@Entity({ name: 'orders' })
export class Order {
    @PrimaryGeneratedColumn({ name: 'Id' })
    Id: number;

    @Column({ type: "varchar", length: 10, name: 'Status' })
    Status: string;

    @Column({ type: "int", name: 'Price' })
    Price: number;

    @Column({ type: "int", name: 'Quantity' })
    Quantity: number;

    @Column({ type: "datetime", name: 'CreatedAt' })
    CreatedAt: Date;

    @ManyToOne(type => Customer, customer => customer.orders)
    @JoinColumn({ name: 'CustomerId' })
    customer: Customer;

    @OneToMany(type => MealOrder, mealOrder => mealOrder.order)
    mealOrders: MealOrder[];
}