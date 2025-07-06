import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';
import { ApiProperty } from '@nestjs/swagger';

@Entity('destinations')
export class Destination {
  @ApiProperty({ description: 'Unique identifier for the destination' })
  @PrimaryGeneratedColumn()
  id: number;

  @ApiProperty({ description: 'Name of the destination' })
  @Column({ length: 255 })
  name: string;

  @ApiProperty({ description: 'Description of the destination' })
  @Column('text')
  description: string;

  @ApiProperty({ description: 'City where the destination is located' })
  @Column({ length: 100 })
  city: string;

  @ApiProperty({ description: 'Province where the destination is located' })
  @Column({ length: 100 })
  province: string;

  @ApiProperty({ description: 'Category of the destination (e.g., historical, nature, cultural)' })
  @Column({ length: 50 })
  category: string;

  @ApiProperty({ description: 'Array of image URLs', type: [String] })
  @Column('json')
  images: string[];

  @ApiProperty({ description: 'Latitude coordinate' })
  @Column('decimal', { precision: 10, scale: 8, nullable: true })
  latitude: number;

  @ApiProperty({ description: 'Longitude coordinate' })
  @Column('decimal', { precision: 11, scale: 8, nullable: true })
  longitude: number;

  @ApiProperty({ description: 'Average rating (1-5)' })
  @Column('decimal', { precision: 3, scale: 2, default: 0 })
  rating: number;

  @ApiProperty({ description: 'Number of reviews' })
  @Column({ default: 0 })
  reviewCount: number;

  @ApiProperty({ description: 'Entry fee in VND' })
  @Column({ nullable: true })
  entryFee: number;

  @ApiProperty({ description: 'Opening time (HH:mm format)' })
  @Column({ length: 5, nullable: true })
  openingTime: string;

  @ApiProperty({ description: 'Closing time (HH:mm format)' })
  @Column({ length: 5, nullable: true })
  closingTime: string;

  @ApiProperty({ description: 'Best time to visit' })
  @Column({ length: 255, nullable: true })
  bestTimeToVisit: string;

  @ApiProperty({ description: 'Transportation information' })
  @Column('text', { nullable: true })
  transportation: string;

  @ApiProperty({ description: 'Additional tips for visitors' })
  @Column('text', { nullable: true })
  tips: string;

  @ApiProperty({ description: 'Whether the destination is featured' })
  @Column({ default: false })
  isFeatured: boolean;

  @ApiProperty({ description: 'Whether the destination is active' })
  @Column({ default: true })
  isActive: boolean;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
