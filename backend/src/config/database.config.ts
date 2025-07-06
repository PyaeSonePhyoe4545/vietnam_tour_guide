import { ConfigService } from '@nestjs/config';
import { TypeOrmModuleOptions } from '@nestjs/typeorm';
import { Destination } from '../destinations/entities/destination.entity';
import { Accommodation } from '../accommodations/entities/accommodation.entity';

export const getDatabaseConfig = (configService: ConfigService): TypeOrmModuleOptions => {
  const isProduction = configService.get('NODE_ENV') === 'production';
  
  // Try MySQL first, fallback to SQLite if MySQL is not available
  const useMySQL = configService.get('DB_HOST') && configService.get('DB_USERNAME');
  
  if (useMySQL) {
    return {
      type: 'mysql',
      host: configService.get('DB_HOST', 'localhost'),
      port: configService.get('DB_PORT', 3306),
      username: configService.get('DB_USERNAME', 'root'),
      password: configService.get('DB_PASSWORD', ''),
      database: configService.get('DB_NAME', 'vietnam_tour_guide'),
      entities: [Destination, Accommodation],
      synchronize: !isProduction, // Only sync in development
      logging: !isProduction,
      ssl: isProduction ? { rejectUnauthorized: false } : false,
    };
  } else {
    // Fallback to SQLite for development
    console.log('MySQL not configured, using SQLite for development');
    return {
      type: 'sqlite',
      database: isProduction ? 'database.sqlite' : ':memory:',
      entities: [Destination, Accommodation],
      synchronize: true,
      logging: !isProduction,
    };
  }
};
