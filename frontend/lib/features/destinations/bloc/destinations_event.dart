abstract class DestinationsEvent {
  const DestinationsEvent();
}

class LoadDestinations extends DestinationsEvent {}

class RefreshDestinations extends DestinationsEvent {}

class LoadFeaturedDestinations extends DestinationsEvent {}
