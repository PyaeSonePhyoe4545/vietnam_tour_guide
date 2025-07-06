import 'package:flutter_bloc/flutter_bloc.dart';
import 'accommodations_event.dart';
import 'accommodations_state.dart';
import '../repositories/accommodation_repository.dart';

class AccommodationsBloc
    extends Bloc<AccommodationsEvent, AccommodationsState> {
  final AccommodationRepository _repository;

  AccommodationsBloc(this._repository) : super(AccommodationsInitial()) {
    on<LoadAccommodations>(_onLoadAccommodations);
    on<RefreshAccommodations>(_onRefreshAccommodations);
    on<LoadFeaturedAccommodations>(_onLoadFeaturedAccommodations);
  }

  Future<void> _onLoadAccommodations(
    LoadAccommodations event,
    Emitter<AccommodationsState> emit,
  ) async {
    try {
      emit(AccommodationsLoading());
      final accommodations = await _repository.getAllAccommodations();
      final featuredAccommodations =
          accommodations.where((acc) => acc.isFeatured).toList();

      emit(AccommodationsLoaded(
        accommodations: accommodations,
        featuredAccommodations: featuredAccommodations,
      ));
    } catch (e) {
      emit(AccommodationsError(e.toString()));
    }
  }

  Future<void> _onRefreshAccommodations(
    RefreshAccommodations event,
    Emitter<AccommodationsState> emit,
  ) async {
    try {
      final accommodations = await _repository.getAllAccommodations();
      final featuredAccommodations =
          accommodations.where((acc) => acc.isFeatured).toList();

      emit(AccommodationsLoaded(
        accommodations: accommodations,
        featuredAccommodations: featuredAccommodations,
      ));
    } catch (e) {
      emit(AccommodationsError(e.toString()));
    }
  }

  Future<void> _onLoadFeaturedAccommodations(
    LoadFeaturedAccommodations event,
    Emitter<AccommodationsState> emit,
  ) async {
    try {
      emit(AccommodationsLoading());
      final featuredAccommodations =
          await _repository.getFeaturedAccommodations();

      emit(AccommodationsLoaded(
        accommodations: [],
        featuredAccommodations: featuredAccommodations,
      ));
    } catch (e) {
      emit(AccommodationsError(e.toString()));
    }
  }
}
