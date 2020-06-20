import { Entity, Column, PrimaryGeneratedColumn, OneToMany, ManyToOne, JoinColumn } from 'typeorm';
import { Customer } from './customer.entity';
import { Table } from './table.entity';

@Entity({ name: 'table_reservations' })
export class TableReservation {
    @PrimaryGeneratedColumn({ name: 'Id' })
    Id: number;

    @Column({ type: "datetime", name: 'StartTime' })
    StartTime: Date;

    @Column({ type: "datetime", name: 'EndTime' })
    EndTime: Date;

    @ManyToOne(type => Customer, customer => customer.tableReservations)
    @JoinColumn({ name: 'CustomerId' })
    customer: Customer

    @ManyToOne(type => Table, table => table.reservations)
    @JoinColumn({ name: 'TableId' })
    table: Table
}