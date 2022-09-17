import 'dart:convert';

import 'package:bukit_vista_flutter_assessment/models/booking/booking_model.dart';
import 'package:bukit_vista_flutter_assessment/models/guest/guest_model.dart';
import 'package:bukit_vista_flutter_assessment/utils/assets_path.dart';
import 'package:flutter/services.dart';

class GuestRepository {
  Future<List<GuestModel>> getGuests({
    bool useDummyJsonData = true,
  }) async {
    late final dynamic data;
    if (useDummyJsonData) {
      data = jsonDecode(
        await rootBundle.loadString('$dummyJsonsAssetsPath/guest_list.json'),
      );
    } else {
      // final Response response = await _provider.use(
      //   url: '',
      //   action: DioAction.get,
      // );
      //   data = response.data;
    }
    return (data as List)
        .map(
          (e) => GuestModel.fromJson(e),
        )
        .toList();
    // }
  }

  Future<List<BookingModel>> getGuestBookings({
    required int guestId,
    bool useDummyJsonData = true,
  }) async {
    late final dynamic data;
    if (useDummyJsonData) {
      data = jsonDecode(
        await rootBundle.loadString('$dummyJsonsAssetsPath/guest_bookings/guest_${guestId}_bookings.json'),
      );
    } else {
      // final Response response = await _provider.use(
      //   url: '',
      //   action: DioAction.get,
      // );
      //   data = response.data;
    }
    return (data as List)
        .map(
          (e) => BookingModel.fromJson(e),
    )
        .toList();
    // }
  }
}
