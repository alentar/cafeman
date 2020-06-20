import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { TableReservation } from './tableReservation.entity';

@Entity({ name: 'tables' })
export class Table {
    @PrimaryGeneratedColumn({ name: 'Id' })
    Id: number;

    @Column({ type: "int", unique: true, name: 'Number' })
    Number: number;

    @Column({ type: "int", name: 'Capacity' })
    Capacity: number;

    @OneToMany(type => TableReservation, tableReservations => tableReservations.table)
    reservations: TableReservation[]
}