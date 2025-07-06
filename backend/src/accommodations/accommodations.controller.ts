import { Controller, Get, Post, Body, Patch, Param, Delete, Query } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse, ApiParam, ApiQuery } from '@nestjs/swagger';
import { AccommodationsService } from './accommodations.service';
import { CreateAccommodationDto } from './dto/create-accommodation.dto';
import { UpdateAccommodationDto } from './dto/update-accommodation.dto';
import { Accommodation } from './entities/accommodation.entity';

@ApiTags('accommodations')
@Controller('accommodations')
export class AccommodationsController {
  constructor(private readonly accommodationsService: AccommodationsService) {}

  @Post()
  @ApiOperation({ summary: 'Create a new accommodation' })
  @ApiResponse({ status: 201, description: 'Accommodation created successfully', type: Accommodation })
  create(@Body() createAccommodationDto: CreateAccommodationDto): Promise<Accommodation> {
    return this.accommodationsService.create(createAccommodationDto);
  }

  @Get()
  @ApiOperation({ summary: 'Get all accommodations' })
  @ApiResponse({ status: 200, description: 'List of all accommodations', type: [Accommodation] })
  findAll(): Promise<Accommodation[]> {
    return this.accommodationsService.findAll();
  }

  @Get('featured')
  @ApiOperation({ summary: 'Get featured accommodations' })
  @ApiResponse({ status: 200, description: 'List of featured accommodations', type: [Accommodation] })
  findFeatured(): Promise<Accommodation[]> {
    return this.accommodationsService.findFeatured();
  }

  @Get('search')
  @ApiOperation({ summary: 'Search accommodations' })
  @ApiQuery({ name: 'q', description: 'Search query' })
  @ApiResponse({ status: 200, description: 'Search results', type: [Accommodation] })
  search(@Query('q') query: string): Promise<Accommodation[]> {
    return this.accommodationsService.search(query);
  }

  @Get('type/:type')
  @ApiOperation({ summary: 'Get accommodations by type' })
  @ApiParam({ name: 'type', description: 'Accommodation type' })
  @ApiResponse({ status: 200, description: 'Accommodations of the specified type', type: [Accommodation] })
  findByType(@Param('type') type: string): Promise<Accommodation[]> {
    return this.accommodationsService.findByType(type);
  }

  @Get('province/:province')
  @ApiOperation({ summary: 'Get accommodations by province' })
  @ApiParam({ name: 'province', description: 'Province name' })
  @ApiResponse({ status: 200, description: 'Accommodations in the specified province', type: [Accommodation] })
  findByProvince(@Param('province') province: string): Promise<Accommodation[]> {
    return this.accommodationsService.findByProvince(province);
  }

  @Get('price-range')
  @ApiOperation({ summary: 'Get accommodations by price range' })
  @ApiQuery({ name: 'min', description: 'Minimum price per night' })
  @ApiQuery({ name: 'max', description: 'Maximum price per night' })
  @ApiResponse({ status: 200, description: 'Accommodations in the specified price range', type: [Accommodation] })
  findByPriceRange(@Query('min') min: string, @Query('max') max: string): Promise<Accommodation[]> {
    return this.accommodationsService.findByPriceRange(+min, +max);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get an accommodation by ID' })
  @ApiParam({ name: 'id', description: 'Accommodation ID' })
  @ApiResponse({ status: 200, description: 'Accommodation details', type: Accommodation })
  @ApiResponse({ status: 404, description: 'Accommodation not found' })
  findOne(@Param('id') id: string): Promise<Accommodation> {
    return this.accommodationsService.findOne(+id);
  }

  @Patch(':id')
  @ApiOperation({ summary: 'Update an accommodation' })
  @ApiParam({ name: 'id', description: 'Accommodation ID' })
  @ApiResponse({ status: 200, description: 'Accommodation updated successfully', type: Accommodation })
  @ApiResponse({ status: 404, description: 'Accommodation not found' })
  update(@Param('id') id: string, @Body() updateAccommodationDto: UpdateAccommodationDto): Promise<Accommodation> {
    return this.accommodationsService.update(+id, updateAccommodationDto);
  }

  @Delete(':id')
  @ApiOperation({ summary: 'Delete an accommodation' })
  @ApiParam({ name: 'id', description: 'Accommodation ID' })
  @ApiResponse({ status: 200, description: 'Accommodation deleted successfully' })
  @ApiResponse({ status: 404, description: 'Accommodation not found' })
  remove(@Param('id') id: string): Promise<void> {
    return this.accommodationsService.remove(+id);
  }
}
