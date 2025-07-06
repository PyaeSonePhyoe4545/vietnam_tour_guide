import '../models/destination_simple.dart';

abstract class DestinationsState {
  const DestinationsState();
}

class DestinationsInitial extends DestinationsState {}

class DestinationsLoading extends DestinationsState {}

class DestinationsLoaded extends DestinationsState {
  final List<Destination> destinations;
  final List<Destination> featuredDestinations;

  const DestinationsLoaded({
    required this.destinations,
    required this.featuredDestinations,
  });
}

class DestinationsError extends DestinationsState {
  final String message;

  const DestinationsError(this.message);
}
