import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';
import { ApiProperty } from '@nestjs/swagger';

@Entity('accommodations')
export class Accommodation {
  @ApiProperty({ description: 'Unique identifier for the accommodation' })
  @PrimaryGeneratedColumn()
  id: number;

  @ApiProperty({ description: 'Name of the accommodation' })
  @Column({ length: 255 })
  name: string;

  @ApiProperty({ description: 'Description of the accommodation' })
  @Column('text')
  description: string;

  @ApiProperty({ description: 'Type of accommodation (hotel, hostel, resort, etc.)' })
  @Column({ length: 50 })
  type: string;

  @ApiProperty({ description: 'Address of the accommodation' })
  @Column('text')
  address: string;

  @ApiProperty({ description: 'City where the accommodation is located' })
  @Column({ length: 100 })
  city: string;

  @ApiProperty({ description: 'Province where the accommodation is located' })
  @Column({ length: 100 })
  province: string;

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

  @ApiProperty({ description: 'Price per night in VND' })
  @Column()
  pricePerNight: number;

  @ApiProperty({ description: 'Star rating (1-5)' })
  @Column({ nullable: true })
  starRating: number;

  @ApiProperty({ description: 'Array of amenities', type: [String] })
  @Column('json')
  amenities: string[];

  @ApiProperty({ description: 'Contact phone number' })
  @Column({ length: 20, nullable: true })
  phoneNumber: string;

  @ApiProperty({ description: 'Contact email address' })
  @Column({ length: 255, nullable: true })
  email: string;

  @ApiProperty({ description: 'Website URL' })
  @Column({ length: 255, nullable: true })
  website: string;

  @ApiProperty({ description: 'Check-in time (HH:mm format)' })
  @Column({ length: 5, nullable: true })
  checkInTime: string;

  @ApiProperty({ description: 'Check-out time (HH:mm format)' })
  @Column({ length: 5, nullable: true })
  checkOutTime: string;

  @ApiProperty({ description: 'Available room types', type: [String] })
  @Column('json', { nullable: true })
  roomTypes: string[];

  @ApiProperty({ description: 'Cancellation policy' })
  @Column('text', { nullable: true })
  cancellationPolicy: string;

  @ApiProperty({ description: 'Whether breakfast is included' })
  @Column({ default: false })
  breakfastIncluded: boolean;

  @ApiProperty({ description: 'Whether WiFi is available' })
  @Column({ default: false })
  wifiAvailable: boolean;

  @ApiProperty({ description: 'Whether parking is available' })
  @Column({ default: false })
  parkingAvailable: boolean;

  @ApiProperty({ description: 'Whether pets are allowed' })
  @Column({ default: false })
  petsAllowed: boolean;

  @ApiProperty({ description: 'Whether the accommodation is featured' })
  @Column({ default: false })
  isFeatured: boolean;

  @ApiProperty({ description: 'Whether the accommodation is active' })
  @Column({ default: true })
  isActive: boolean;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
