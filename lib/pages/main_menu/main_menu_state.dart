part of 'main_menu_bloc.dart';

class MainMenuState {
  final bool isLoading;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final List<GuestModel> completeGuests;
  final List<GuestModel> guests;
  final int index;


  MainMenuState({
    this.isLoading = false,
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.completeGuests = const [],
    this.guests = const [],
    this.index = 0,
  });

  // factory MainMenuState.initial() {
  //   return MainMenuState(
  //   );
  // }

  MainMenuState update({
    bool? isLoading,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    List<GuestModel>? completeGuests,
    List<GuestModel>? guests,
    int? index,

  }) {
    return MainMenuState(
      isLoading: isLoading ?? this.isLoading,
      showProgressLoader: showProgressLoader ?? false,
      dismissProgressLoader: dismissProgressLoader ?? false,
      completeGuests: completeGuests ?? this.completeGuests,
      guests: guests ?? this.guests,
      index: index ?? this.index,

    );
  }
}