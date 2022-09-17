import 'package:bukit_vista_flutter_assessment/models/guest/guest_model.dart';
import 'package:bukit_vista_flutter_assessment/repositories/guest_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_menu_event.dart';

part 'main_menu_state.dart';

class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  final GuestRepository guestRepo;

  MainMenuBloc(this.guestRepo)
      : super(
          MainMenuState(),
        ) {
    on<GetGuests>(_onGetGuests);
    on<FilterGuestsByQuery>(_onFilterGuestsByQuery);
    on<UpdateMainMenuState>(_onUpdateMainMenuState);
  }

  Future<void> _onUpdateMainMenuState(
    UpdateMainMenuState event,
    Emitter<MainMenuState> emit,
  ) async {
    emit(
      state.update(index: event.index),
    );
  }

  Future<void> _onFilterGuestsByQuery(
    FilterGuestsByQuery event,
    Emitter<MainMenuState> emit,
  ) async {
    final query = event.query.toLowerCase().trim();
    emit(
      state.update(
        guests: query.isEmpty
            ? state.completeGuests
            : state.completeGuests.where(
                (element) {
                  final name = element.name.toLowerCase().trim();
                  final origin = element.origin.toLowerCase().trim();

                  return name.contains(query) || origin.contains(query);
                },
              ).toList(),
      ),
    );
  }

  Future<void> _onGetGuests(
    GetGuests event,
    Emitter<MainMenuState> emit,
  ) async {
    try {
      emit(
        state.update(
          isLoading: true,
        ),
      );
      final guests = await guestRepo.getGuests();
      emit(
        state.update(completeGuests: guests, guests: guests),
      );
    } catch (exception) {
      // print(exception);
      rethrow;
    } finally {
      // await Future.delayed(Duration(milliseconds: 100,),);
      emit(
        state.update(isLoading: false),
      );
    }
  }
}
