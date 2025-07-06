import { Controller, Get, Post, Body, Patch, Param, Delete, Query } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse, ApiParam, ApiQuery } from '@nestjs/swagger';
import { DestinationsService } from './destinations.service';
import { CreateDestinationDto } from './dto/create-destination.dto';
import { UpdateDestinationDto } from './dto/update-destination.dto';
import { Destination } from './entities/destination.entity';

@ApiTags('destinations')
@Controller('destinations')
export class DestinationsController {
  constructor(private readonly destinationsService: DestinationsService) {}

  @Post()
  @ApiOperation({ summary: 'Create a new destination' })
  @ApiResponse({ status: 201, description: 'Destination created successfully', type: Destination })
  create(@Body() createDestinationDto: CreateDestinationDto): Promise<Destination> {
    return this.destinationsService.create(createDestinationDto);
  }

  @Get()
  @ApiOperation({ summary: 'Get all destinations' })
  @ApiResponse({ status: 200, description: 'List of all destinations', type: [Destination] })
  findAll(): Promise<Destination[]> {
    return this.destinationsService.findAll();
  }

  @Get('featured')
  @ApiOperation({ summary: 'Get featured destinations' })
  @ApiResponse({ status: 200, description: 'List of featured destinations', type: [Destination] })
  findFeatured(): Promise<Destination[]> {
    return this.destinationsService.findFeatured();
  }

  @Get('search')
  @ApiOperation({ summary: 'Search destinations' })
  @ApiQuery({ name: 'q', description: 'Search query' })
  @ApiResponse({ status: 200, description: 'Search results', type: [Destination] })
  search(@Query('q') query: string): Promise<Destination[]> {
    return this.destinationsService.search(query);
  }

  @Get('category/:category')
  @ApiOperation({ summary: 'Get destinations by category' })
  @ApiParam({ name: 'category', description: 'Destination category' })
  @ApiResponse({ status: 200, description: 'Destinations in the specified category', type: [Destination] })
  findByCategory(@Param('category') category: string): Promise<Destination[]> {
    return this.destinationsService.findByCategory(category);
  }

  @Get('province/:province')
  @ApiOperation({ summary: 'Get destinations by province' })
  @ApiParam({ name: 'province', description: 'Province name' })
  @ApiResponse({ status: 200, description: 'Destinations in the specified province', type: [Destination] })
  findByProvince(@Param('province') province: string): Promise<Destination[]> {
    return this.destinationsService.findByProvince(province);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get a destination by ID' })
  @ApiParam({ name: 'id', description: 'Destination ID' })
  @ApiResponse({ status: 200, description: 'Destination details', type: Destination })
  @ApiResponse({ status: 404, description: 'Destination not found' })
  findOne(@Param('id') id: string): Promise<Destination> {
    return this.destinationsService.findOne(+id);
  }

  @Patch(':id')
  @ApiOperation({ summary: 'Update a destination' })
  @ApiParam({ name: 'id', description: 'Destination ID' })
  @ApiResponse({ status: 200, description: 'Destination updated successfully', type: Destination })
  @ApiResponse({ status: 404, description: 'Destination not found' })
  update(@Param('id') id: string, @Body() updateDestinationDto: UpdateDestinationDto): Promise<Destination> {
    return this.destinationsService.update(+id, updateDestinationDto);
  }

  @Delete(':id')
  @ApiOperation({ summary: 'Delete a destination' })
  @ApiParam({ name: 'id', description: 'Destination ID' })
  @ApiResponse({ status: 200, description: 'Destination deleted successfully' })
  @ApiResponse({ status: 404, description: 'Destination not found' })
  remove(@Param('id') id: string): Promise<void> {
    return this.destinationsService.remove(+id);
  }
}
