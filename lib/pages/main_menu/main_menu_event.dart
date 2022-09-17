part of 'main_menu_bloc.dart';

abstract class MainMenuEvent {}

class GetGuests extends MainMenuEvent {}

class FilterGuestsByQuery extends MainMenuEvent {
  final String query;

  FilterGuestsByQuery(this.query);
}

class UpdateMainMenuState extends MainMenuEvent {
  final int? index;

  UpdateMainMenuState({
    this.index,
  });
}
