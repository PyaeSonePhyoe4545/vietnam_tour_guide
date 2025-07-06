import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateAccommodationDto } from './dto/create-accommodation.dto';
import { UpdateAccommodationDto } from './dto/update-accommodation.dto';
import { Accommodation } from './entities/accommodation.entity';

@Injectable()
export class AccommodationsService {
  constructor(
    @InjectRepository(Accommodation)
    private accommodationsRepository: Repository<Accommodation>,
  ) {}

  async create(createAccommodationDto: CreateAccommodationDto): Promise<Accommodation> {
    const accommodation = this.accommodationsRepository.create(createAccommodationDto);
    return await this.accommodationsRepository.save(accommodation);
  }

  async findAll(): Promise<Accommodation[]> {
    return await this.accommodationsRepository.find({
      where: { isActive: true },
      order: { createdAt: 'DESC' },
    });
  }

  async findFeatured(): Promise<Accommodation[]> {
    return await this.accommodationsRepository.find({
      where: { isActive: true, isFeatured: true },
      order: { rating: 'DESC' },
    });
  }

  async findByType(type: string): Promise<Accommodation[]> {
    return await this.accommodationsRepository.find({
      where: { isActive: true, type },
      order: { rating: 'DESC' },
    });
  }

  async findByProvince(province: string): Promise<Accommodation[]> {
    return await this.accommodationsRepository.find({
      where: { isActive: true, province },
      order: { rating: 'DESC' },
    });
  }

  async findByPriceRange(minPrice: number, maxPrice: number): Promise<Accommodation[]> {
    return await this.accommodationsRepository
      .createQueryBuilder('accommodation')
      .where('accommodation.isActive = :isActive', { isActive: true })
      .andWhere('accommodation.pricePerNight >= :minPrice', { minPrice })
      .andWhere('accommodation.pricePerNight <= :maxPrice', { maxPrice })
      .orderBy('accommodation.rating', 'DESC')
      .getMany();
  }

  async findOne(id: number): Promise<Accommodation> {
    const accommodation = await this.accommodationsRepository.findOne({
      where: { id, isActive: true },
    });

    if (!accommodation) {
      throw new NotFoundException(`Accommodation with ID ${id} not found`);
    }

    return accommodation;
  }

  async update(id: number, updateAccommodationDto: UpdateAccommodationDto): Promise<Accommodation> {
    const accommodation = await this.findOne(id);
    Object.assign(accommodation, updateAccommodationDto);
    return await this.accommodationsRepository.save(accommodation);
  }

  async remove(id: number): Promise<void> {
    const accommodation = await this.findOne(id);
    accommodation.isActive = false;
    await this.accommodationsRepository.save(accommodation);
  }

  async search(query: string): Promise<Accommodation[]> {
    return await this.accommodationsRepository
      .createQueryBuilder('accommodation')
      .where('accommodation.isActive = :isActive', { isActive: true })
      .andWhere(
        '(accommodation.name LIKE :query OR accommodation.description LIKE :query OR accommodation.city LIKE :query OR accommodation.province LIKE :query)',
        { query: `%${query}%` }
      )
      .orderBy('accommodation.rating', 'DESC')
      .getMany();
  }
}
