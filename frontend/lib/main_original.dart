import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'core/services/api_service.dart';
import 'features/destinations/repositories/destination_repository.dart';
import 'features/accommodations/repositories/accommodation_repository.dart';
import 'features/destinations/bloc/destinations_bloc.dart';
import 'features/accommodations/bloc/accommodations_bloc.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/destinations/presentation/pages/destinations_page.dart';
import 'features/destinations/presentation/pages/destination_detail_page.dart';
import 'features/accommodations/presentation/pages/accommodations_page.dart';
import 'features/accommodations/presentation/pages/accommodation_detail_page.dart';

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

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: destinationRepository),
        RepositoryProvider.value(value: accommodationRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DestinationsBloc(destinationRepository),
          ),
          BlocProvider(
            create: (context) => AccommodationsBloc(accommodationRepository),
          ),
        ],
        child: MaterialApp.router(
          title: 'Vietnam Tour Guide',
          theme: AppTheme.lightTheme,
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/destinations',
      builder: (context, state) => const DestinationsPage(),
    ),
    GoRoute(
      path: '/destinations/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return DestinationDetailPage(destinationId: id);
      },
    ),
    GoRoute(
      path: '/accommodations',
      builder: (context, state) => const AccommodationsPage(),
    ),
    GoRoute(
      path: '/accommodations/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return AccommodationDetailPage(accommodationId: id);
      },
    ),
  ],
);
