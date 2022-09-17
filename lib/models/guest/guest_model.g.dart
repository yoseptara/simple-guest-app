// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GuestModel _$$_GuestModelFromJson(Map<String, dynamic> json) =>
    _$_GuestModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      origin: json['origin'] as String,
      pngImgAssetName: json['pngImgAssetName'] as String,
    );

Map<String, dynamic> _$$_GuestModelToJson(_$_GuestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'origin': instance.origin,
      'pngImgAssetName': instance.pngImgAssetName,
    };
