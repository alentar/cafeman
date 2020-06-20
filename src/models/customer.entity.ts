import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { Order } from './order.entity';
import { TableReservation } from './tableReservation.entity';

@Entity({ name: 'customers' })
export class Customer {
    @PrimaryGeneratedColumn({ name: 'Id' })
    Id: number;

    @Column({ type: "varchar", length: 50, name: 'FirstName' })
    FirstName: string;

    @Column({ type: "varchar", length: 50, name: 'LastName' })
    LastName: string;

    @Column({ type: "varchar", length: 15, unique: true, name: 'Mobile' })
    Mobile: boolean;

    @OneToMany(type => Order, order => order.customer)
    orders: Order[]

    @OneToMany(type => TableReservation, tableReservations => tableReservations.customer)
    tableReservations: TableReservation[]
}