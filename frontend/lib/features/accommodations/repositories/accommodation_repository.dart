import '../../../core/services/api_service.dart';
import '../../../core/config/api_config.dart';
import '../models/accommodation.dart';

class AccommodationRepository {
  final ApiService _apiService;

  AccommodationRepository(this._apiService);

  Future<List<Accommodation>> getAllAccommodations() async {
    try {
      final response = await _apiService.get(ApiConfig.accommodationsEndpoint);
      final List<dynamic> data = response.data;
      return data.map((json) => Accommodation.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch accommodations: $e');
    }
  }

  Future<List<Accommodation>> getFeaturedAccommodations() async {
    try {
      final response = await _apiService.get(
        '${ApiConfig.accommodationsEndpoint}/featured',
      );
      final List<dynamic> data = response.data;
      return data.map((json) => Accommodation.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch featured accommodations: $e');
    }
  }

  Future<Accommodation> getAccommodationById(int id) async {
    try {
      final response = await _apiService.get(
        '${ApiConfig.accommodationsEndpoint}/$id',
      );
      return Accommodation.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch accommodation: $e');
    }
  }

  Future<List<Accommodation>> getAccommodationsByType(String type) async {
    try {
      final response = await _apiService.get(
        '${ApiConfig.accommodationsEndpoint}/type/$type',
      );
      final List<dynamic> data = response.data;
      return data.map((json) => Accommodation.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch accommodations by type: $e');
    }
  }

  Future<List<Accommodation>> getAccommodationsByProvince(
    String province,
  ) async {
    try {
      final response = await _apiService.get(
        '${ApiConfig.accommodationsEndpoint}/province/$province',
      );
      final List<dynamic> data = response.data;
      return data.map((json) => Accommodation.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch accommodations by province: $e');
    }
  }

  Future<List<Accommodation>> getAccommodationsByPriceRange(
    int minPrice,
    int maxPrice,
  ) async {
    try {
      final response = await _apiService.get(
        '${ApiConfig.accommodationsEndpoint}/price-range',
        queryParameters: {'min': minPrice, 'max': maxPrice},
      );
      final List<dynamic> data = response.data;
      return data.map((json) => Accommodation.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch accommodations by price range: $e');
    }
  }

  Future<List<Accommodation>> searchAccommodations(String query) async {
    try {
      final response = await _apiService.get(
        '${ApiConfig.accommodationsEndpoint}/search',
        queryParameters: {'q': query},
      );
      final List<dynamic> data = response.data;
      return data.map((json) => Accommodation.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to search accommodations: $e');
    }
  }
}
