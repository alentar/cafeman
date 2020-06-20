import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { OrderServe } from './orderServe.entity';

@Entity({ name: 'waiters' })
export class Waiter {
    @PrimaryGeneratedColumn({ name: 'Id' })
    Id: number;

    @Column({ type: "varchar", length: 50, name: 'FirstName' })
    FirstName: string;

    @Column({ type: "varchar", length: 50, name: 'LastName' })
    LastName: string;

    @Column({ type: "int", name: 'Salary' })
    Salary: number;

    @OneToMany(type => OrderServe, orderServe => orderServe.waiter)
    serves: OrderServe[]
}