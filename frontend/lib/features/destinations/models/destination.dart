import 'package:json_annotation/json_annotation.dart';

part 'destination.g.dart';

@JsonSerializable()
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

  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationToJson(this);

  String get formattedEntryFee {
    if (entryFee == null || entryFee == 0) return 'Free';
    return '${entryFee!.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} VND';
  }

  String get ratingDisplay => rating.toStringAsFixed(1);

  String get mainImage => images.isNotEmpty ? images.first : '';

  bool get hasCoordinates => latitude != null && longitude != null;
}
