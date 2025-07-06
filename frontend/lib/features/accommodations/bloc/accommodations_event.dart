abstract class AccommodationsEvent {
  const AccommodationsEvent();
}

class LoadAccommodations extends AccommodationsEvent {}

class RefreshAccommodations extends AccommodationsEvent {}

class LoadFeaturedAccommodations extends AccommodationsEvent {}
