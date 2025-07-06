import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/api_service.dart';
import 'features/destinations/bloc/destinations_bloc.dart';
import 'features/destinations/bloc/destinations_event.dart';
import 'features/destinations/bloc/destinations_state.dart';
import 'features/destinations/repositories/destination_repository.dart';
import 'features/accommodations/bloc/accommodations_bloc.dart';
import 'features/accommodations/bloc/accommodations_event.dart';
import 'features/accommodations/bloc/accommodations_state.dart';
import 'features/accommodations/repositories/accommodation_repository.dart';

void main() {
  runApp(const VietnamTourGuideApp());
}

class VietnamTourGuideApp extends StatelessWidget {
  const VietnamTourGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    final destinationRepository = DestinationRepository(apiService);
    final accommodationRepository = AccommodationRepository(apiService);

    return MaterialApp(
      title: 'Vietnam Tour Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DestinationsBloc(destinationRepository)
              ..add(LoadDestinations()),
          ),
          BlocProvider(
            create: (context) => AccommodationsBloc(accommodationRepository)
              ..add(LoadAccommodations()),
          ),
        ],
        child: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vietnam Tour Guide'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<DestinationsBloc>().add(RefreshDestinations());
              context.read<AccommodationsBloc>().add(RefreshAccommodations());
            },
          ),
        ],
      ),
      body: BlocBuilder<DestinationsBloc, DestinationsState>(
        builder: (context, destinationsState) {
          return BlocBuilder<AccommodationsBloc, AccommodationsState>(
            builder: (context, accommodationsState) {
              // Show loading if either is loading
              if (destinationsState is DestinationsLoading ||
                  accommodationsState is AccommodationsLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              // Show error if either has error
              if (destinationsState is DestinationsError) {
                return _buildErrorWidget(
                  context,
                  'Failed to fetch destinations: ${destinationsState.message}',
                );
              }

              if (accommodationsState is AccommodationsError) {
                return _buildErrorWidget(
                  context,
                  'Failed to fetch accommodations: ${accommodationsState.message}',
                );
              }

              // Build UI with loaded data
              final destinations = destinationsState is DestinationsLoaded
                  ? destinationsState.destinations
                      .map((dest) => {
                            'id': dest.id,
                            'name': dest.name,
                            'description': dest.description,
                            'city': dest.city,
                            'province': dest.province,
                            'category': dest.category,
                            'rating': dest.rating,
                            'reviewCount': dest.reviewCount,
                          })
                      .toList()
                  : <dynamic>[];
              final accommodations = accommodationsState is AccommodationsLoaded
                  ? accommodationsState.accommodations
                      .map((acc) => {
                            'id': acc.id,
                            'name': acc.name,
                            'description': acc.description,
                            'city': acc.city,
                            'province': acc.province,
                            'type': acc.type,
                            'starRating': acc.starRating,
                            'rating': acc.rating,
                            'reviewCount': acc.reviewCount,
                            'pricePerNight': acc.pricePerNight,
                          })
                      .toList()
                  : <dynamic>[];

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildWelcomeSection(
                        destinations.length, accommodations.length),
                    const SizedBox(height: 32),
                    _buildDestinationsSection(destinations),
                    const SizedBox(height: 32),
                    _buildAccommodationsSection(accommodations),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context, String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(error, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<DestinationsBloc>().add(RefreshDestinations());
              context.read<AccommodationsBloc>().add(RefreshAccommodations());
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeSection(int destinationsCount, int accommodationsCount) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.blue.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(Icons.location_on, size: 64, color: Colors.white),
          const SizedBox(height: 16),
          const Text(
            'Welcome to Vietnam!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Discover $destinationsCount amazing destinations and $accommodationsCount accommodations',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationsSection(List<dynamic> destinations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.place, color: Colors.blue),
            const SizedBox(width: 8),
            const Text(
              'Featured Destinations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              final destination = destinations[index];
              return _buildDestinationCard(destination);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAccommodationsSection(List<dynamic> accommodations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.hotel, color: Colors.blue),
            const SizedBox(width: 8),
            const Text(
              'Premium Accommodations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: accommodations.length,
            itemBuilder: (context, index) {
              final accommodation = accommodations[index];
              return _buildAccommodationCard(accommodation);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDestinationCard(dynamic destination) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade300, Colors.blue.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child:
                    const Icon(Icons.landscape, size: 48, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination['name'] ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_city,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${destination['city']}, ${destination['province']}',
                          style: const TextStyle(color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        '${destination['rating']} (${destination['reviewCount']} reviews)',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: destination['category'] == 'nature'
                          ? Colors.green.shade100
                          : Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      destination['category']?.toString().toUpperCase() ??
                          'OTHER',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: destination['category'] == 'nature'
                            ? Colors.green.shade700
                            : Colors.orange.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    destination['description'] ?? '',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccommodationCard(dynamic accommodation) {
    final pricePerNight = accommodation['pricePerNight'] ?? 0;
    final formattedPrice = (pricePerNight / 1000).toStringAsFixed(0);

    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade300, Colors.purple.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(Icons.hotel, size: 48, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    accommodation['name'] ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_city,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${accommodation['city']}, ${accommodation['province']}',
                          style: const TextStyle(color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < (accommodation['starRating'] ?? 0)
                                ? Icons.star
                                : Icons.star_border,
                            size: 16,
                            color: Colors.amber,
                          );
                        }),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${accommodation['rating']} (${accommodation['reviewCount']})',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          accommodation['type']?.toString().toUpperCase() ??
                              'HOTEL',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${formattedPrice}K VND/night',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    accommodation['description'] ?? '',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
