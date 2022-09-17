import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

enum BookingStatus {
  confirmed,
  canceled,
}

@freezed
class BookingModel with _$BookingModel {
  const factory BookingModel({
    required String id,
    required String host,
    required String profileName,
    required String propertyUnit,
    required DateTime checkin,
    required DateTime checkout,
    @Default(0) int numberOfGuests,
    required String phoneNumber,
    required BookingStatus bookingStatus,
    @Default(0) double bookingValue,
    required String listingName,
}) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
 // Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}