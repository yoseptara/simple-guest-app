part of 'guest_detail_bloc.dart';

class GuestDetailState {
  final bool isLoading;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final List<BookingModel> bookings;

  GuestDetailState({
    this.isLoading = false,
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.bookings = const [],
  });

  // factory GuestDetailState.initial() {
  //   return GuestDetailState(
  //   );
  // }

  GuestDetailState update({
    bool? isLoading,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    List<BookingModel>? bookings,
  }) {
    return GuestDetailState(
      isLoading: isLoading ?? this.isLoading,
      showProgressLoader: showProgressLoader ?? false,
      dismissProgressLoader: dismissProgressLoader ?? false,
      bookings: bookings ?? this.bookings,
    );
  }
}
