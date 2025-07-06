// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
      category: json['category'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      entryFee: (json['entryFee'] as num?)?.toInt(),
      openingTime: json['openingTime'] as String?,
      closingTime: json['closingTime'] as String?,
      bestTimeToVisit: json['bestTimeToVisit'] as String?,
      transportation: json['transportation'] as String?,
      tips: json['tips'] as String?,
      isFeatured: json['isFeatured'] as bool,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'city': instance.city,
      'province': instance.province,
      'category': instance.category,
      'images': instance.images,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'entryFee': instance.entryFee,
      'openingTime': instance.openingTime,
      'closingTime': instance.closingTime,
      'bestTimeToVisit': instance.bestTimeToVisit,
      'transportation': instance.transportation,
      'tips': instance.tips,
      'isFeatured': instance.isFeatured,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
