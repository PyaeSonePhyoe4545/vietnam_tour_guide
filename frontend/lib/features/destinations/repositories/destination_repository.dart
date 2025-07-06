import '../../../core/services/api_service.dart';
import '../../../core/config/api_config.dart';
import '../models/destination.dart';

class DestinationRepository {
  final ApiService _apiService;

  DestinationRepository(this._apiService);

  Future<List<Destination>> getAllDestinations() async {
    try {
      final response = await _apiService.get(ApiConfig.destinationsEndpoint);
      final List<dynamic> data = response.data;
      return data.map((json) => Destination.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch destinations: $e');
    }
  }

  Future<List<Destination>> getFeaturedDestinations() async {
    try {
      final response = await _apiService.get(
        '${ApiConfig.destinationsEndpoint}/featured',
      );
      final List<dynamic> data = response.data;
      return data.map((json) => Destination.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch featured destinations: $e');
    }
  }

  Future<Destination> getDestinationById(int id) async {
    try {
      final response = await _apiService.get(
        '${ApiConfig.destinationsEndpoint}/$id',
      );
      return Destination.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch destination: $e');
    }
  }

  Future<List<Destination>> getDestinationsByCategory(String category) async {
    try {
      final response = await _apiService.get(
        '${ApiConfig.destinationsEndpoint}/category/$category',
      );
      final List<dynamic> data = response.data;
      return data.map((json) => Destination.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch destinations by category: $e');
    }
  }

  Future<List<Destination>> getDestinationsByProvince(String province) async {
    try {
      final response = await _apiService.get(
        '${ApiConfig.destinationsEndpoint}/province/$province',
      );
      final List<dynamic> data = response.data;
      return data.map((json) => Destination.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch destinations by province: $e');
    }
  }

  Future<List<Destination>> searchDestinations(String query) async {
    try {
      final response = await _apiService.get(
        '${ApiConfig.destinationsEndpoint}/search',
        queryParameters: {'q': query},
      );
      final List<dynamic> data = response.data;
      return data.map((json) => Destination.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to search destinations: $e');
    }
  }
}
