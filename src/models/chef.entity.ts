import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { OrderPrepare } from './orderPrepare.entity';

@Entity({ name: 'chefs' })
export class Chef {
    @PrimaryGeneratedColumn({ name: 'Id' })
    Id: number;

    @Column({ type: "varchar", length: 50, name: 'FirstName' })
    FirstName: string;

    @Column({ type: "varchar", length: 50, name: 'LastName' })
    LastName: string;

    @Column({ type: "int", name: 'Salary' })
    Salary: number;

    @OneToMany(type => OrderPrepare, orderPrepare => orderPrepare.chef)
    prepares: OrderPrepare[]
}