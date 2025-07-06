import 'package:json_annotation/json_annotation.dart';

part 'accommodation.g.dart';

@JsonSerializable()
class Accommodation {
  final int id;
  final String name;
  final String description;
  final String type;
  final String address;
  final String city;
  final String province;
  final List<String> images;
  final double? latitude;
  final double? longitude;
  final double rating;
  final int reviewCount;
  final int pricePerNight;
  final int? starRating;
  final List<String> amenities;
  final String? phoneNumber;
  final String? email;
  final String? website;
  final String? checkInTime;
  final String? checkOutTime;
  final List<String>? roomTypes;
  final String? cancellationPolicy;
  final bool breakfastIncluded;
  final bool wifiAvailable;
  final bool parkingAvailable;
  final bool petsAllowed;
  final bool isFeatured;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Accommodation({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.address,
    required this.city,
    required this.province,
    required this.images,
    this.latitude,
    this.longitude,
    required this.rating,
    required this.reviewCount,
    required this.pricePerNight,
    this.starRating,
    required this.amenities,
    this.phoneNumber,
    this.email,
    this.website,
    this.checkInTime,
    this.checkOutTime,
    this.roomTypes,
    this.cancellationPolicy,
    required this.breakfastIncluded,
    required this.wifiAvailable,
    required this.parkingAvailable,
    required this.petsAllowed,
    required this.isFeatured,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Accommodation.fromJson(Map<String, dynamic> json) =>
      _$AccommodationFromJson(json);

  Map<String, dynamic> toJson() => _$AccommodationToJson(this);

  String get formattedPrice {
    return '${pricePerNight.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} VND/night';
  }

  String get ratingDisplay => rating.toStringAsFixed(1);

  String get mainImage => images.isNotEmpty ? images.first : '';

  bool get hasCoordinates => latitude != null && longitude != null;

  String get starDisplay => starRating != null ? '$starRating★' : 'Unrated';

  List<String> get keyAmenities {
    final key = <String>[];
    if (wifiAvailable) key.add('WiFi');
    if (breakfastIncluded) key.add('Breakfast');
    if (parkingAvailable) key.add('Parking');
    if (petsAllowed) key.add('Pet-friendly');
    return key;
  }
}
