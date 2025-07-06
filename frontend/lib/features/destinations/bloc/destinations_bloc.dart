import 'package:flutter_bloc/flutter_bloc.dart';
import 'destinations_event.dart';
import 'destinations_state.dart';
import '../repositories/destination_repository.dart';

class DestinationsBloc extends Bloc<DestinationsEvent, DestinationsState> {
  final DestinationRepository _repository;

  DestinationsBloc(this._repository) : super(DestinationsInitial()) {
    on<LoadDestinations>(_onLoadDestinations);
    on<RefreshDestinations>(_onRefreshDestinations);
    on<LoadFeaturedDestinations>(_onLoadFeaturedDestinations);
  }

  Future<void> _onLoadDestinations(
    LoadDestinations event,
    Emitter<DestinationsState> emit,
  ) async {
    try {
      emit(DestinationsLoading());
      final destinations = await _repository.getAllDestinations();
      final featuredDestinations =
          destinations.where((dest) => dest.isFeatured).toList();

      emit(DestinationsLoaded(
        destinations: destinations,
        featuredDestinations: featuredDestinations,
      ));
    } catch (e) {
      emit(DestinationsError(e.toString()));
    }
  }

  Future<void> _onRefreshDestinations(
    RefreshDestinations event,
    Emitter<DestinationsState> emit,
  ) async {
    try {
      final destinations = await _repository.getAllDestinations();
      final featuredDestinations =
          destinations.where((dest) => dest.isFeatured).toList();

      emit(DestinationsLoaded(
        destinations: destinations,
        featuredDestinations: featuredDestinations,
      ));
    } catch (e) {
      emit(DestinationsError(e.toString()));
    }
  }

  Future<void> _onLoadFeaturedDestinations(
    LoadFeaturedDestinations event,
    Emitter<DestinationsState> emit,
  ) async {
    try {
      emit(DestinationsLoading());
      final featuredDestinations = await _repository.getFeaturedDestinations();

      emit(DestinationsLoaded(
        destinations: [],
        featuredDestinations: featuredDestinations,
      ));
    } catch (e) {
      emit(DestinationsError(e.toString()));
    }
  }
}
