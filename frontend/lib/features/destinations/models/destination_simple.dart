class Destination {
  final int id;
  final String name;
  final String description;
  final String city;
  final String province;
  final String category;
  final List<String> images;
  final double? latitude;
  final double? longitude;
  final double rating;
  final int reviewCount;
  final int? entryFee;
  final String? openingTime;
  final String? closingTime;
  final String? bestTimeToVisit;
  final String? transportation;
  final String? tips;
  final bool isFeatured;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Destination({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.province,
    required this.category,
    required this.images,
    this.latitude,
    this.longitude,
    required this.rating,
    required this.reviewCount,
    this.entryFee,
    this.openingTime,
    this.closingTime,
    this.bestTimeToVisit,
    this.transportation,
    this.tips,
    required this.isFeatured,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
      category: json['category'] as String,
      images: List<String>.from(json['images'] ?? []),
      latitude: _toDouble(json['latitude']),
      longitude: _toDouble(json['longitude']),
      rating: _toDouble(json['rating']) ?? 0.0,
      reviewCount: json['reviewCount'] ?? 0,
      entryFee: json['entryFee'],
      openingTime: json['openingTime'],
      closingTime: json['closingTime'],
      bestTimeToVisit: json['bestTimeToVisit'],
      transportation: json['transportation'],
      tips: json['tips'],
      isFeatured: json['isFeatured'] ?? false,
      isActive: json['isActive'] ?? true,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'city': city,
      'province': province,
      'category': category,
      'images': images,
      'latitude': latitude,
      'longitude': longitude,
      'rating': rating,
      'reviewCount': reviewCount,
      'entryFee': entryFee,
      'openingTime': openingTime,
      'closingTime': closingTime,
      'bestTimeToVisit': bestTimeToVisit,
      'transportation': transportation,
      'tips': tips,
      'isFeatured': isFeatured,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  String get formattedEntryFee {
    if (entryFee == null || entryFee == 0) return 'Free';
    return '${entryFee!.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} VND';
  }

  String get ratingDisplay => rating.toStringAsFixed(1);

  String get mainImage => images.isNotEmpty ? images.first : '';

  bool get hasCoordinates => latitude != null && longitude != null;
}
