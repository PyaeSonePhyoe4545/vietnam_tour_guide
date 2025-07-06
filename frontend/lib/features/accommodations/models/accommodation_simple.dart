class Accommodation {
  final int id;
  final String name;
  final String description;
  final String city;
  final String province;
  final String type;
  final int starRating;
  final List<String> images;
  final double? latitude;
  final double? longitude;
  final double rating;
  final int reviewCount;
  final int pricePerNight;
  final List<String> amenities;
  final String? address;
  final String? phone;
  final String? email;
  final String? website;
  final String? checkInTime;
  final String? checkOutTime;
  final String? cancellationPolicy;
  final bool isFeatured;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Accommodation({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.province,
    required this.type,
    required this.starRating,
    required this.images,
    this.latitude,
    this.longitude,
    required this.rating,
    required this.reviewCount,
    required this.pricePerNight,
    required this.amenities,
    this.address,
    this.phone,
    this.email,
    this.website,
    this.checkInTime,
    this.checkOutTime,
    this.cancellationPolicy,
    required this.isFeatured,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Accommodation.fromJson(Map<String, dynamic> json) {
    return Accommodation(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
      type: json['type'] as String,
      starRating: json['starRating'] ?? 3,
      images: List<String>.from(json['images'] ?? []),
      latitude: _toDouble(json['latitude']),
      longitude: _toDouble(json['longitude']),
      rating: _toDouble(json['rating']) ?? 0.0,
      reviewCount: json['reviewCount'] ?? 0,
      pricePerNight: json['pricePerNight'] ?? 0,
      amenities: List<String>.from(json['amenities'] ?? []),
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      website: json['website'],
      checkInTime: json['checkInTime'],
      checkOutTime: json['checkOutTime'],
      cancellationPolicy: json['cancellationPolicy'],
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
      'type': type,
      'starRating': starRating,
      'images': images,
      'latitude': latitude,
      'longitude': longitude,
      'rating': rating,
      'reviewCount': reviewCount,
      'pricePerNight': pricePerNight,
      'amenities': amenities,
      'address': address,
      'phone': phone,
      'email': email,
      'website': website,
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
      'cancellationPolicy': cancellationPolicy,
      'isFeatured': isFeatured,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  String get formattedPrice {
    return '${pricePerNight.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} VND';
  }

  String get shortPrice {
    final price = pricePerNight / 1000;
    return '${price.toStringAsFixed(0)}K VND';
  }

  String get ratingDisplay => rating.toStringAsFixed(1);

  String get mainImage => images.isNotEmpty ? images.first : '';

  bool get hasCoordinates => latitude != null && longitude != null;
}
