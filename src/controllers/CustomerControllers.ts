
import { Controller, Get } from '@nestjs/common';
import { EntityManager } from 'typeorm';

@Controller('cats')
export class CustomerController {
    @Get()
    findAll (): string {
        return 'This action returns all cats';
    }
}