import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_model.freezed.dart';
part 'guest_model.g.dart';

@freezed
class GuestModel with _$GuestModel {
  const factory GuestModel({
    required int id,
    required String name,
    required String email,
    required String phoneNumber,
    required DateTime joinedAt,
    required String origin,
    required String pngImgAssetName,

}) = _GuestModel;

  factory GuestModel.fromJson(Map<String, dynamic> json) => _$GuestModelFromJson(json);
 // Map<String, dynamic> toJson() => _$GuestModelToJson(this);
}