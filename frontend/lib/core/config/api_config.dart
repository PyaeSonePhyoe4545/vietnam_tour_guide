class ApiConfig {
  static const String baseUrl = 'http://localhost:3001';
  static const String destinationsEndpoint = '/destinations';
  static const String accommodationsEndpoint = '/accommodations';

  // Timeout configurations
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  static const int sendTimeout = 30000; // 30 seconds
}
