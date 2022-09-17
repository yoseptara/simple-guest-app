// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingModel _$$_BookingModelFromJson(Map<String, dynamic> json) =>
    _$_BookingModel(
      id: json['id'] as String,
      host: json['host'] as String,
      profileName: json['profileName'] as String,
      propertyUnit: json['propertyUnit'] as String,
      checkin: DateTime.parse(json['checkin'] as String),
      checkout: DateTime.parse(json['checkout'] as String),
      numberOfGuests: json['numberOfGuests'] as int? ?? 0,
      phoneNumber: json['phoneNumber'] as String,
      bookingStatus: $enumDecode(_$BookingStatusEnumMap, json['bookingStatus']),
      bookingValue: (json['bookingValue'] as num?)?.toDouble() ?? 0,
      listingName: json['listingName'] as String,
    );

Map<String, dynamic> _$$_BookingModelToJson(_$_BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'host': instance.host,
      'profileName': instance.profileName,
      'propertyUnit': instance.propertyUnit,
      'checkin': instance.checkin.toIso8601String(),
      'checkout': instance.checkout.toIso8601String(),
      'numberOfGuests': instance.numberOfGuests,
      'phoneNumber': instance.phoneNumber,
      'bookingStatus': _$BookingStatusEnumMap[instance.bookingStatus]!,
      'bookingValue': instance.bookingValue,
      'listingName': instance.listingName,
    };

const _$BookingStatusEnumMap = {
  BookingStatus.confirmed: 'confirmed',
  BookingStatus.canceled: 'canceled',
};
