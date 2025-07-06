// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accommodation _$AccommodationFromJson(Map<String, dynamic> json) =>
    Accommodation(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      pricePerNight: (json['pricePerNight'] as num).toInt(),
      starRating: (json['starRating'] as num?)?.toInt(),
      amenities:
          (json['amenities'] as List<dynamic>).map((e) => e as String).toList(),
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      checkInTime: json['checkInTime'] as String?,
      checkOutTime: json['checkOutTime'] as String?,
      roomTypes: (json['roomTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cancellationPolicy: json['cancellationPolicy'] as String?,
      breakfastIncluded: json['breakfastIncluded'] as bool,
      wifiAvailable: json['wifiAvailable'] as bool,
      parkingAvailable: json['parkingAvailable'] as bool,
      petsAllowed: json['petsAllowed'] as bool,
      isFeatured: json['isFeatured'] as bool,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AccommodationToJson(Accommodation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'address': instance.address,
      'city': instance.city,
      'province': instance.province,
      'images': instance.images,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'pricePerNight': instance.pricePerNight,
      'starRating': instance.starRating,
      'amenities': instance.amenities,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'website': instance.website,
      'checkInTime': instance.checkInTime,
      'checkOutTime': instance.checkOutTime,
      'roomTypes': instance.roomTypes,
      'cancellationPolicy': instance.cancellationPolicy,
      'breakfastIncluded': instance.breakfastIncluded,
      'wifiAvailable': instance.wifiAvailable,
      'parkingAvailable': instance.parkingAvailable,
      'petsAllowed': instance.petsAllowed,
      'isFeatured': instance.isFeatured,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
