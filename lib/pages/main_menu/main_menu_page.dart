import 'package:bukit_vista_flutter_assessment/components/custom_appbar.dart';
import 'package:bukit_vista_flutter_assessment/components/guest_item.dart';
import 'package:bukit_vista_flutter_assessment/components/shimmer_widget.dart';
import 'package:bukit_vista_flutter_assessment/pages/guest_detail/guest_detail_page.dart';
import 'package:bukit_vista_flutter_assessment/pages/main_menu/main_menu_bloc.dart';
import 'package:bukit_vista_flutter_assessment/repositories/guest_repository.dart';
import 'package:bukit_vista_flutter_assessment/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenuPage extends StatelessWidget {
  static const route = '/main_menu_page';

  const MainMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<MainMenuBloc>(
        create: (_) => MainMenuBloc(
          context.read<GuestRepository>(),
        )..add(
            GetGuests(),
          ),
        child: const _MainMenuView(),
      ),
    );
  }
}

class _MainMenuView extends StatelessWidget {
  const _MainMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      const _HomeBtmNavBarItem(),
      Container(),
      Container(),
      Container(),
    ];
    return BlocBuilder<MainMenuBloc, MainMenuState>(
      buildWhen: (previous, current) => previous.index != current.index,
      builder: (context, state) => Scaffold(
        appBar: CustomAppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(106),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(29, 33, 23, 33),
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (val) {
                          context.read<MainMenuBloc>().add(
                                FilterGuestsByQuery(val),
                              );
                        },
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(11.33, 11.33, 11.25, 10.25),
                            child: SvgPicture.asset(
                              '$svgAssetsPath/search.svg',
                            ),
                          ),
                          hintText: 'Search your guest name',
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 12,
                            // height: 14.06,
                            color: const Color(0xff9C9DA7),
                          ),
                          contentPadding: EdgeInsets.zero,
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide(
                              color: const Color(0xffE1E0E0).withOpacity(0.8),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide(
                              color: const Color(0xffE1E0E0).withOpacity(0.8),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.fromLTRB(8.88, 12.75, 7.87, 13.69),
                      decoration: BoxDecoration(
                        color: const Color(0xffEFB83E),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 0,
                              color: Colors.black.withOpacity(0.2)),
                        ],
                      ),
                      child: SvgPicture.asset('$svgAssetsPath/vector.svg'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // unselectedItemColor: const Color(0xffDEDEDE),
          // selectedItemColor: const Color(0xff3B9DF6),
          currentIndex: state.index,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            context.read<MainMenuBloc>().add(
                  UpdateMainMenuState(index: index),
                );
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '$svgAssetsPath/home.svg',
                color: const Color(0xffDEDEDE),
              ),
              activeIcon: SvgPicture.asset(
                '$svgAssetsPath/home.svg',
                color: const Color(0xff3B9DF6),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '$svgAssetsPath/wallet.svg',
                color: const Color(0xffDEDEDE),
              ),
              activeIcon: SvgPicture.asset(
                '$svgAssetsPath/wallet.svg',
                color: const Color(0xff3B9DF6),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '$svgAssetsPath/bell.svg',
                color: const Color(0xffDEDEDE),
              ),
              activeIcon: SvgPicture.asset(
                '$svgAssetsPath/bell.svg',
                color: const Color(0xff3B9DF6),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '$svgAssetsPath/person.svg',
                color: const Color(0xffDEDEDE),
              ),
              activeIcon: SvgPicture.asset(
                '$svgAssetsPath/person.svg',
                color: const Color(0xff3B9DF6),
              ),
              label: '',
            ),
          ],
        ),
        body: items[state.index],
      ),
    );
  }
}

class _HomeBtmNavBarItem extends StatelessWidget {
  const _HomeBtmNavBarItem({Key? key}) : super(key: key);

  Widget _guestsShimmer(bool isLoading) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(29, 32, 23, 32),
      itemBuilder: (context, i) => ShimmerWidget(
        enabled: isLoading,
        height: 82,
        width: double.maxFinite,
      ),
      separatorBuilder: (context, i) => const SizedBox(
        height: 9,
      ),
      itemCount: 7,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainMenuBloc, MainMenuState>(
      buildWhen: (previous, current) =>
          previous.isLoading != current.isLoading || previous.guests != current.guests,
      builder: (context, state) {
        if (state.isLoading) {
          return _guestsShimmer(state.isLoading);
        } else if (state.guests.isEmpty) {
          return const Center(
            child: Text('Empty'),
          );
        } else {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(29, 32, 23, 32),
            itemBuilder: (context, i) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GuestDetailPage(
                      guest: state.guests[i],
                    ),
                  ),
                );
              },
              child: GuestItem.forList(
                guest: state.guests[i],
              ),
            ),
            separatorBuilder: (context, i) => const SizedBox(
              height: 9,
            ),
            itemCount: state.guests.length,
          );
        }
      },
    );
  }
}
