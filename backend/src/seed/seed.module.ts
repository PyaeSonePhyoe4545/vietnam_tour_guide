import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SeedService } from './seed.service';
import { Destination } from '../destinations/entities/destination.entity';
import { Accommodation } from '../accommodations/entities/accommodation.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Destination, Accommodation])],
  providers: [SeedService],
  exports: [SeedService],
})
export class SeedModule {}
