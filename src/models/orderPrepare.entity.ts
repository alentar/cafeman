import { Entity, Column, PrimaryGeneratedColumn, OneToMany, ManyToOne, JoinColumn, OneToOne } from 'typeorm';
import { Customer } from './customer.entity';
import { Table } from './table.entity';
import { Order } from './order.entity';
import { Waiter } from './waiter.entity';
import { Meal } from './meal.entity';
import { Chef } from './chef.entity';

@Entity({ name: 'order_prepares' })
export class OrderPrepare {
    @Column({ type: "datetime", name: 'StartTime' })
    StartTime: Date;

    @Column({ type: "datetime", name: 'EndTime' })
    EndTime: Date;

    @OneToOne(type => Order)
    @JoinColumn({ name: 'OrderId' })
    order: Order;

    @ManyToOne(type => Chef, chef => chef.prepares)
    @JoinColumn({ name: 'ChefId' })
    chef: Chef;
}