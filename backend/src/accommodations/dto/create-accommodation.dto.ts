import { IsString, IsNotEmpty, IsOptional, IsNumber, IsArray, IsBoolean, Min, Max, IsEmail } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateAccommodationDto {
  @ApiProperty({ description: 'Name of the accommodation' })
  @IsString()
  @IsNotEmpty()
  name: string;

  @ApiProperty({ description: 'Description of the accommodation' })
  @IsString()
  @IsNotEmpty()
  description: string;

  @ApiProperty({ description: 'Type of accommodation' })
  @IsString()
  @IsNotEmpty()
  type: string;

  @ApiProperty({ description: 'Address of the accommodation' })
  @IsString()
  @IsNotEmpty()
  address: string;

  @ApiProperty({ description: 'City where the accommodation is located' })
  @IsString()
  @IsNotEmpty()
  city: string;

  @ApiProperty({ description: 'Province where the accommodation is located' })
  @IsString()
  @IsNotEmpty()
  province: string;

  @ApiProperty({ description: 'Array of image URLs', type: [String] })
  @IsArray()
  @IsString({ each: true })
  images: string[];

  @ApiProperty({ description: 'Latitude coordinate', required: false })
  @IsOptional()
  @IsNumber()
  latitude?: number;

  @ApiProperty({ description: 'Longitude coordinate', required: false })
  @IsOptional()
  @IsNumber()
  longitude?: number;

  @ApiProperty({ description: 'Average rating (1-5)', required: false })
  @IsOptional()
  @IsNumber()
  @Min(1)
  @Max(5)
  rating?: number;

  @ApiProperty({ description: 'Number of reviews', required: false })
  @IsOptional()
  @IsNumber()
  reviewCount?: number;

  @ApiProperty({ description: 'Price per night in VND' })
  @IsNumber()
  @IsNotEmpty()
  pricePerNight: number;

  @ApiProperty({ description: 'Star rating (1-5)', required: false })
  @IsOptional()
  @IsNumber()
  @Min(1)
  @Max(5)
  starRating?: number;

  @ApiProperty({ description: 'Array of amenities', type: [String] })
  @IsArray()
  @IsString({ each: true })
  amenities: string[];

  @ApiProperty({ description: 'Contact phone number', required: false })
  @IsOptional()
  @IsString()
  phoneNumber?: string;

  @ApiProperty({ description: 'Contact email address', required: false })
  @IsOptional()
  @IsEmail()
  email?: string;

  @ApiProperty({ description: 'Website URL', required: false })
  @IsOptional()
  @IsString()
  website?: string;

  @ApiProperty({ description: 'Check-in time (HH:mm format)', required: false })
  @IsOptional()
  @IsString()
  checkInTime?: string;

  @ApiProperty({ description: 'Check-out time (HH:mm format)', required: false })
  @IsOptional()
  @IsString()
  checkOutTime?: string;

  @ApiProperty({ description: 'Available room types', type: [String], required: false })
  @IsOptional()
  @IsArray()
  @IsString({ each: true })
  roomTypes?: string[];

  @ApiProperty({ description: 'Cancellation policy', required: false })
  @IsOptional()
  @IsString()
  cancellationPolicy?: string;

  @ApiProperty({ description: 'Whether breakfast is included', required: false })
  @IsOptional()
  @IsBoolean()
  breakfastIncluded?: boolean;

  @ApiProperty({ description: 'Whether WiFi is available', required: false })
  @IsOptional()
  @IsBoolean()
  wifiAvailable?: boolean;

  @ApiProperty({ description: 'Whether parking is available', required: false })
  @IsOptional()
  @IsBoolean()
  parkingAvailable?: boolean;

  @ApiProperty({ description: 'Whether pets are allowed', required: false })
  @IsOptional()
  @IsBoolean()
  petsAllowed?: boolean;

  @ApiProperty({ description: 'Whether the accommodation is featured', required: false })
  @IsOptional()
  @IsBoolean()
  isFeatured?: boolean;

  @ApiProperty({ description: 'Whether the accommodation is active', required: false })
  @IsOptional()
  @IsBoolean()
  isActive?: boolean;
}
