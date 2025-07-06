import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../destinations/bloc/destinations_bloc.dart';
import '../../accommodations/bloc/accommodations_bloc.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/hero_section.dart';
import '../../../shared/widgets/featured_destinations_section.dart';
import '../../../shared/widgets/featured_accommodations_section.dart';
import '../../../shared/widgets/categories_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Load initial data
    context.read<DestinationsBloc>().add(LoadFeaturedDestinations());
    context.read<AccommodationsBloc>().add(LoadFeaturedAccommodations());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Vietnam Tour Guide'),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            SizedBox(height: 24),
            CategoriesSection(),
            SizedBox(height: 24),
            FeaturedDestinationsSection(),
            SizedBox(height: 24),
            FeaturedAccommodationsSection(),
            SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/');
            break;
          case 1:
            context.go('/destinations');
            break;
          case 2:
            context.go('/accommodations');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Destinations'),
        BottomNavigationBarItem(icon: Icon(Icons.hotel), label: 'Hotels'),
      ],
    );
  }
}
