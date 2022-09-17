part of 'guest_detail_bloc.dart';

abstract class GuestDetailEvent {}

class GetGuestBookings extends GuestDetailEvent {
  final int guestId;

  GetGuestBookings(this.guestId);
}