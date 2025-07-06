import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { DestinationsModule } from './destinations/destinations.module';
import { AccommodationsModule } from './accommodations/accommodations.module';
import { SeedModule } from './seed/seed.module';
import { getDatabaseConfig } from './config/database.config';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    TypeOrmModule.forRootAsync({
      inject: [ConfigService],
      useFactory: (configService: ConfigService) => getDatabaseConfig(configService),
    }),
    DestinationsModule,
    AccommodationsModule,
    SeedModule,
  ],
})
export class AppModule {}
