import { Entity, Column, PrimaryGeneratedColumn, OneToMany, ManyToOne, JoinColumn, OneToOne } from 'typeorm';
import { Customer } from './customer.entity';
import { Table } from './table.entity';
import { Order } from './order.entity';
import { Waiter } from './waiter.entity';

@Entity({ name: 'order_serves' })
export class OrderServe {
    @Column({ type: "datetime", name: 'ServedAt' })
    ServedAt: Date;

    @OneToOne(type => Order)
    @JoinColumn({ name: 'OrderId' })
    order: Order;

    @ManyToOne(type => Waiter, waiter => waiter.serves)
    @JoinColumn({ name: 'WaiterId' })
    waiter: Waiter;
}