import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Destination } from '../destinations/entities/destination.entity';
import { Accommodation } from '../accommodations/entities/accommodation.entity';

@Injectable()
export class SeedService {
  constructor(
    @InjectRepository(Destination)
    private destinationRepository: Repository<Destination>,
    @InjectRepository(Accommodation)
    private accommodationRepository: Repository<Accommodation>,
  ) {}

  async seedDestinations() {
    const destinations = [
      {
        name: 'Ha Long Bay',
        description: 'A UNESCO World Heritage Site featuring thousands of limestone karsts and islands in various shapes and sizes. Ha Long Bay is one of Vietnam\'s most iconic destinations.',
        city: 'Ha Long',
        province: 'Quang Ninh',
        category: 'nature',
        images: [
          'https://images.unsplash.com/photo-1528127269322-539801943592?w=800&h=600&fit=crop',
          'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&h=600&fit=crop'
        ],
        latitude: 20.9101,
        longitude: 107.1839,
        rating: 4.8,
        reviewCount: 1250,
        entryFee: 200000,
        openingTime: '07:00',
        closingTime: '17:00',
        bestTimeToVisit: 'October to December and March to May',
        transportation: 'Take a bus from Hanoi to Ha Long (3.5 hours) or book a tour package',
        tips: 'Book overnight cruise for the best experience. Bring seasickness medication if needed.',
        isFeatured: true,
        isActive: true,
      },
      {
        name: 'Hoi An Ancient Town',
        description: 'A well-preserved example of a Southeast Asian trading port dating from the 15th to the 19th century. Known for its lanterns, tailor shops, and delicious food.',
        city: 'Hoi An',
        province: 'Quang Nam',
        category: 'historical',
        images: [
          'https://images.unsplash.com/photo-1557804506-669a67965ba0?w=800&h=600&fit=crop',
          'https://images.unsplash.com/photo-1528181304800-259b08848526?w=800&h=600&fit=crop'
        ],
        latitude: 15.8801,
        longitude: 108.3380,
        rating: 4.7,
        reviewCount: 980,
        entryFee: 120000,
        openingTime: '08:00',
        closingTime: '22:00',
        bestTimeToVisit: 'February to August',
        transportation: 'Fly to Da Nang, then 45-minute drive to Hoi An',
        tips: 'Visit during lantern festivals. Try the local specialties: Cao Lau and White Rose dumplings.',
        isFeatured: true,
        isActive: true,
      },
      {
        name: 'Sapa Terraced Fields',
        description: 'Stunning rice terraces carved into the mountainsides by ethnic minorities. Offers breathtaking views and cultural experiences.',
        city: 'Sapa',
        province: 'Lao Cai',
        category: 'nature',
        images: [
          'https://images.unsplash.com/photo-1528181304800-259b08848526?w=800&h=600&fit=crop',
          'https://images.unsplash.com/photo-1570366583862-f91883984fde?w=800&h=600&fit=crop'
        ],
        latitude: 22.3364,
        longitude: 103.8438,
        rating: 4.6,
        reviewCount: 756,
        entryFee: 0,
        openingTime: '06:00',
        closingTime: '18:00',
        bestTimeToVisit: 'September to November and March to May',
        transportation: 'Night train from Hanoi to Lao Cai, then bus to Sapa',
        tips: 'Bring warm clothes as it can get cold. Hire a local guide for trekking.',
        isFeatured: true,
        isActive: true,
      }
    ];

    for (const destinationData of destinations) {
      const existing = await this.destinationRepository.findOne({ 
        where: { name: destinationData.name } 
      });
      
      if (!existing) {
        const destination = this.destinationRepository.create(destinationData);
        await this.destinationRepository.save(destination);
        console.log(`Created destination: ${destinationData.name}`);
      }
    }
  }

  async seedAccommodations() {
    const accommodations = [
      {
        name: 'Paradise Luxury Cruise',
        description: 'Luxury cruise experience in Ha Long Bay with premium amenities and stunning views of the limestone karsts.',
        type: 'cruise',
        address: 'Tuan Chau Marina, Ha Long Bay',
        city: 'Ha Long',
        province: 'Quang Ninh',
        images: [
          'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&h=600&fit=crop',
          'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&h=600&fit=crop'
        ],
        latitude: 20.9101,
        longitude: 107.1839,
        rating: 4.8,
        reviewCount: 234,
        pricePerNight: 2500000,
        starRating: 5,
        amenities: ['WiFi', 'Restaurant', 'Bar', 'Spa', 'Kayaking', 'Swimming Pool'],
        phoneNumber: '+84 203 3831 555',
        email: 'booking@paradisecruise.com',
        website: 'https://paradisecruise.com',
        checkInTime: '12:00',
        checkOutTime: '09:00',
        roomTypes: ['Superior Suite', 'Deluxe Suite', 'Presidential Suite'],
        cancellationPolicy: 'Free cancellation up to 7 days before arrival',
        breakfastIncluded: true,
        wifiAvailable: true,
        parkingAvailable: true,
        petsAllowed: false,
        isFeatured: true,
        isActive: true,
      },
      {
        name: 'Anantara Hoi An Resort',
        description: 'Luxury riverside resort in the heart of Hoi An with traditional Vietnamese architecture and modern amenities.',
        type: 'resort',
        address: '1 Pham Hong Thai Street, Hoi An',
        city: 'Hoi An',
        province: 'Quang Nam',
        images: [
          'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&h=600&fit=crop',
          'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&h=600&fit=crop'
        ],
        latitude: 15.8801,
        longitude: 108.3380,
        rating: 4.7,
        reviewCount: 456,
        pricePerNight: 3200000,
        starRating: 5,
        amenities: ['WiFi', 'Restaurant', 'Bar', 'Spa', 'Pool', 'Fitness Center', 'Bike Rental'],
        phoneNumber: '+84 235 3911 777',
        email: 'hoian@anantara.com',
        website: 'https://anantara.com/hoi-an',
        checkInTime: '15:00',
        checkOutTime: '12:00',
        roomTypes: ['Deluxe River View', 'Premium River View', 'Two Bedroom Suite'],
        cancellationPolicy: 'Free cancellation up to 3 days before arrival',
        breakfastIncluded: true,
        wifiAvailable: true,
        parkingAvailable: true,
        petsAllowed: false,
        isFeatured: true,
        isActive: true,
      }
    ];

    for (const accommodationData of accommodations) {
      const existing = await this.accommodationRepository.findOne({ 
        where: { name: accommodationData.name } 
      });
      
      if (!existing) {
        const accommodation = this.accommodationRepository.create(accommodationData);
        await this.accommodationRepository.save(accommodation);
        console.log(`Created accommodation: ${accommodationData.name}`);
      }
    }
  }

  async seedAll() {
    console.log('Starting database seeding...');
    await this.seedDestinations();
    await this.seedAccommodations();
    console.log('Database seeding completed!');
  }
}
