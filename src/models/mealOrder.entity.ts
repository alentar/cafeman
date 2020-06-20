import { Entity, Column, ManyToOne, JoinColumn, } from 'typeorm';
import { Order } from './order.entity';
import { Meal } from './meal.entity';

@Entity({ name: 'meal_orders' })
export class MealOrder {
    @Column({ type: "datetime", name: 'ServedAt' })
    ServedAt: Date;

    @ManyToOne(type => Order, order => order.mealOrders)
    @JoinColumn({ name: 'OrderId' })
    order: Order;

    @ManyToOne(type => Meal, meal => meal.mealOrders)
    @JoinColumn({ name: 'MealId' })
    meal: Meal;
}