import 'package:bukit_vista_flutter_assessment/components/custom_appbar.dart';
import 'package:bukit_vista_flutter_assessment/components/custom_list_tile.dart';
import 'package:bukit_vista_flutter_assessment/components/guest_item.dart';
import 'package:bukit_vista_flutter_assessment/components/shimmer_widget.dart';
import 'package:bukit_vista_flutter_assessment/models/booking/booking_model.dart';
import 'package:bukit_vista_flutter_assessment/models/guest/guest_model.dart';
import 'package:bukit_vista_flutter_assessment/pages/guest_detail/guest_detail_bloc.dart';
import 'package:bukit_vista_flutter_assessment/repositories/guest_repository.dart';
import 'package:bukit_vista_flutter_assessment/utils/assets_path.dart';
import 'package:bukit_vista_flutter_assessment/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GuestDetailPage extends StatelessWidget {
  static const route = '/guest_detail_page';

  final GuestModel guest;

  const GuestDetailPage({Key? key, required this.guest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 26,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: GuestItem.forDetail(guest: guest),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Color(0xffC4C4C4),
                        ),
                      ),
                    ),
                    child: TabBar(
                      unselectedLabelColor: const Color(0xffC4C4C4),
                      labelColor: const Color(0xff1076BC),
                      labelStyle: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      tabs: const [
                        Tab(
                          text: 'Overview',
                        ),
                        Tab(
                          text: 'Bookings',
                        ),
                        Tab(
                          text: 'Personas',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _OverviewTabView(
                          guest: guest,
                        ),
                        BlocProvider<GuestDetailBloc>(
                          create: (_) => GuestDetailBloc(
                            context.read<GuestRepository>(),
                          )..add(
                              GetGuestBookings(guest.id),
                            ),
                          child: const _BookingsTabView(),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingsTabView extends StatelessWidget {
  const _BookingsTabView({Key? key}) : super(key: key);

  Widget bookingsShimmer() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 32,
      ),
      itemBuilder: (context, i) => const ShimmerWidget(
        height: 104,
        width: double.maxFinite,
      ),
      separatorBuilder: (context, i) => const SizedBox(
        height: 10,
      ),
      itemCount: 5,
    );
  }

  void showBtmSheet(
    BuildContext context, {
    required BookingModel booking,
  }) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _BookingDetailBtmSheetContent(
          booking: booking,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuestDetailBloc, GuestDetailState>(builder: (context, state) {
      if (state.isLoading) {
        return bookingsShimmer();
      } else if (state.bookings.isEmpty) {
        return const Center(
          child: Text('Empty'),
        );
      } else {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 26,
            vertical: 32,
          ),
          itemBuilder: (context, i) => InkWell(
            onTap: () {
              showBtmSheet(
                context,
                booking: state.bookings[i],
              );
            },
            child: _BookingItem(
              booking: state.bookings[i],
            ),
          ),
          separatorBuilder: (context, i) => const SizedBox(
            height: 10,
          ),
          itemCount: state.bookings.length,
        );
      }
    });
  }
}

class _BookingDetailBtmSheetContent extends StatelessWidget {
  final BookingModel booking;

  const _BookingDetailBtmSheetContent({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 23),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 23,
          ),
          Center(
            child: Container(
              width: 31,
              height: 2,
              color: const Color(0xffA7ACB6),
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomListTile(
                    label: 'Check in',
                    value: DateFormat.jm().format(booking.checkin),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    DateFormat.yMMMd().format(booking.checkin),
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: const Color(0xff515C6F),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    '$svgAssetsPath/night.svg',
                    width: 19.24,
                    height: 21.02,
                  ),
                  const SizedBox(
                    height: 4.98,
                  ),
                  Text(
                    '${booking.checkout.difference(booking.checkin).inDays} Nights',
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: const Color(0xff1076BC),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomListTile(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    label: 'Check out',
                    valueTextAlign: TextAlign.right,
                    value: DateFormat.jm().format(booking.checkout),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    DateFormat.yMMMd().format(booking.checkout),
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: const Color(0xff515C6F),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 29,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomListTile(
                    label: 'Booking ID',
                    value: booking.id,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  CustomListTile(
                    label: 'Number of guest',
                    value: booking.numberOfGuests.toString(),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  CustomListTile(
                    label: 'Phone Number',
                    value: booking.phoneNumber,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomListTile(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    label: 'Booking status',
                    value: booking.bookingStatus.name.capitalize(),
                    valueTextAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  CustomListTile(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    label: 'Booking value',
                    value: '\$ ${booking.bookingValue}',
                    valueTextAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 37,
          ),
          Text(
            'Hosting details',
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xff515C6F),
            ),
          ),
          const SizedBox(
            height: 34,
          ),
          CustomListTile(
            label: 'Host',
            value: booking.host,
          ),
          const SizedBox(
            height: 18,
          ),
          CustomListTile(
            label: 'Profile name',
            value: booking.profileName,
          ),
          const SizedBox(
            height: 18,
          ),
          CustomListTile(
            label: 'Property Unit',
            value: booking.propertyUnit,
          ),
          const SizedBox(
            height: 18,
          ),
          CustomListTile(
            label: 'Listing name',
            value: booking.listingName,
            valueTextColor: const Color(0xffF69322),
          ),
          const SizedBox(height: 55,),
        ],
      ),
    );
  }
}

class _BookingItem extends StatelessWidget {
  final BookingModel booking;

  const _BookingItem({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(color: const Color(0xffE1E0E0).withOpacity(0.8), width: 1),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, spreadRadius: 0, color: Colors.black.withOpacity(0.08))
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(8.53, 8.92, 9.07, 9.47),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xffEFB83E).withOpacity(0.3),
                ),
                child: Center(
                  child: SvgPicture.asset('$svgAssetsPath/home_outline.svg'),
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    booking.id,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff1C1D1C),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Text(
                    booking.host,
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: const Color(0xff1C1D1C),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${DateFormat('dd MMM yyyy').format(booking.checkin)} - ${DateFormat('dd MMM yyyy').format(booking.checkout)}',
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: const Color(0xff9C9DA7),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 16,
          right: 0,
          child: Container(
            padding: const EdgeInsets.fromLTRB(17, 4, 13, 4),
            decoration: BoxDecoration(
              color: booking.bookingStatus == BookingStatus.confirmed
                  ? const Color(0xff2ECC2C).withOpacity(0.3)
                  : const Color(0xffFF0000).withOpacity(0.3),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Text(
              booking.bookingStatus.name.capitalize(),
              style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: booking.bookingStatus == BookingStatus.confirmed
                    ? const Color(0xff2ECC2C)
                    : const Color(0xffFF0000),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _OverviewTabView extends StatelessWidget {
  final GuestModel guest;

  const _OverviewTabView({
    Key? key,
    required this.guest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomListTile(
            label: 'Email',
            value: guest.email,
          ),
          const SizedBox(
            height: 18,
          ),
          CustomListTile(
            label: 'Phone Number',
            value: guest.phoneNumber,
          ),
          const SizedBox(
            height: 18,
          ),
          CustomListTile(
            label: 'Guest Origin',
            value: guest.origin,
          ),
        ],
      ),
    );
  }
}
