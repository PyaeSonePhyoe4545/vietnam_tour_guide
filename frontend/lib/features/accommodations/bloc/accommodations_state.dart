import '../models/accommodation_simple.dart';

abstract class AccommodationsState {
  const AccommodationsState();
}

class AccommodationsInitial extends AccommodationsState {}

class AccommodationsLoading extends AccommodationsState {}

class AccommodationsLoaded extends AccommodationsState {
  final List<Accommodation> accommodations;
  final List<Accommodation> featuredAccommodations;

  const AccommodationsLoaded({
    required this.accommodations,
    required this.featuredAccommodations,
  });
}

class AccommodationsError extends AccommodationsState {
  final String message;

  const AccommodationsError(this.message);
}
