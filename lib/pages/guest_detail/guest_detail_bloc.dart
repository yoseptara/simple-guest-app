import 'package:bukit_vista_flutter_assessment/models/booking/booking_model.dart';
import 'package:bukit_vista_flutter_assessment/repositories/guest_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'guest_detail_event.dart';

part 'guest_detail_state.dart';

class GuestDetailBloc extends Bloc<GuestDetailEvent, GuestDetailState> {
  final GuestRepository guestRepo;
  GuestDetailBloc(this.guestRepo)
      : super(
          GuestDetailState(),
        ) {
    on<GetGuestBookings>(_onGetGuestBookings);
  }

  Future<void> _onGetGuestBookings(
    GetGuestBookings event,
    Emitter<GuestDetailState> emit,
  ) async {
    try {
      emit(
        state.update(
          isLoading: true,
        ),
      );
      final bookings = await guestRepo.getGuestBookings(guestId: event.guestId);
      emit(
        state.update(bookings: bookings),
      );
    } catch (exception) {
      rethrow;
    } finally {
      // await Future.delayed(Duration(milliseconds: 100,),);
      emit(
        state.update(isLoading: false,),
      );
    }
  }
}
