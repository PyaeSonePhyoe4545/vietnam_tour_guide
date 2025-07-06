import { IsString, IsNotEmpty, IsOptional, IsNumber, IsArray, IsBoolean, Min, Max } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateDestinationDto {
  @ApiProperty({ description: 'Name of the destination' })
  @IsString()
  @IsNotEmpty()
  name: string;

  @ApiProperty({ description: 'Description of the destination' })
  @IsString()
  @IsNotEmpty()
  description: string;

  @ApiProperty({ description: 'City where the destination is located' })
  @IsString()
  @IsNotEmpty()
  city: string;

  @ApiProperty({ description: 'Province where the destination is located' })
  @IsString()
  @IsNotEmpty()
  province: string;

  @ApiProperty({ description: 'Category of the destination' })
  @IsString()
  @IsNotEmpty()
  category: string;

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

  @ApiProperty({ description: 'Entry fee in VND', required: false })
  @IsOptional()
  @IsNumber()
  entryFee?: number;

  @ApiProperty({ description: 'Opening time (HH:mm format)', required: false })
  @IsOptional()
  @IsString()
  openingTime?: string;

  @ApiProperty({ description: 'Closing time (HH:mm format)', required: false })
  @IsOptional()
  @IsString()
  closingTime?: string;

  @ApiProperty({ description: 'Best time to visit', required: false })
  @IsOptional()
  @IsString()
  bestTimeToVisit?: string;

  @ApiProperty({ description: 'Transportation information', required: false })
  @IsOptional()
  @IsString()
  transportation?: string;

  @ApiProperty({ description: 'Additional tips for visitors', required: false })
  @IsOptional()
  @IsString()
  tips?: string;

  @ApiProperty({ description: 'Whether the destination is featured', required: false })
  @IsOptional()
  @IsBoolean()
  isFeatured?: boolean;

  @ApiProperty({ description: 'Whether the destination is active', required: false })
  @IsOptional()
  @IsBoolean()
  isActive?: boolean;
}
