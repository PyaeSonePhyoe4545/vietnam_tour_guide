import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateDestinationDto } from './dto/create-destination.dto';
import { UpdateDestinationDto } from './dto/update-destination.dto';
import { Destination } from './entities/destination.entity';

@Injectable()
export class DestinationsService {
  constructor(
    @InjectRepository(Destination)
    private destinationsRepository: Repository<Destination>,
  ) {}

  async create(createDestinationDto: CreateDestinationDto): Promise<Destination> {
    const destination = this.destinationsRepository.create(createDestinationDto);
    return await this.destinationsRepository.save(destination);
  }

  async findAll(): Promise<Destination[]> {
    return await this.destinationsRepository.find({
      where: { isActive: true },
      order: { createdAt: 'DESC' },
    });
  }

  async findFeatured(): Promise<Destination[]> {
    return await this.destinationsRepository.find({
      where: { isActive: true, isFeatured: true },
      order: { rating: 'DESC' },
    });
  }

  async findByCategory(category: string): Promise<Destination[]> {
    return await this.destinationsRepository.find({
      where: { isActive: true, category },
      order: { rating: 'DESC' },
    });
  }

  async findByProvince(province: string): Promise<Destination[]> {
    return await this.destinationsRepository.find({
      where: { isActive: true, province },
      order: { rating: 'DESC' },
    });
  }

  async findOne(id: number): Promise<Destination> {
    const destination = await this.destinationsRepository.findOne({
      where: { id, isActive: true },
    });

    if (!destination) {
      throw new NotFoundException(`Destination with ID ${id} not found`);
    }

    return destination;
  }

  async update(id: number, updateDestinationDto: UpdateDestinationDto): Promise<Destination> {
    const destination = await this.findOne(id);
    Object.assign(destination, updateDestinationDto);
    return await this.destinationsRepository.save(destination);
  }

  async remove(id: number): Promise<void> {
    const destination = await this.findOne(id);
    destination.isActive = false;
    await this.destinationsRepository.save(destination);
  }

  async search(query: string): Promise<Destination[]> {
    return await this.destinationsRepository
      .createQueryBuilder('destination')
      .where('destination.isActive = :isActive', { isActive: true })
      .andWhere(
        '(destination.name LIKE :query OR destination.description LIKE :query OR destination.city LIKE :query OR destination.province LIKE :query)',
        { query: `%${query}%` }
      )
      .orderBy('destination.rating', 'DESC')
      .getMany();
  }
}
