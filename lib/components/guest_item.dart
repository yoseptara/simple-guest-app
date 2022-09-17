import 'package:bukit_vista_flutter_assessment/models/guest/guest_model.dart';
import 'package:bukit_vista_flutter_assessment/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

enum _Type {
  forList,
  forDetail,
}

class GuestItem extends StatelessWidget {
  final GuestModel guest;
  // ignore: library_private_types_in_public_api
  final _Type type;

  const GuestItem.forList({Key? key, required this.guest}) : type = _Type.forList, super(key: key);
  const GuestItem.forDetail({Key? key, required this.guest}) : type = _Type.forDetail, super(key: key);

  String _subtitleBuilder() {
    if(type == _Type.forList) {
      return guest.origin;
    } else {
      return 'Guest since ${DateFormat.yMMM().format(guest.joinedAt)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 11),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          border: Border.all(
            color: const Color(0xffE1E0E0).withOpacity(0.8),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(blurRadius: 10, spreadRadius: 0, color: Colors.black.withOpacity(0.08))
          ]),
      child: Row(
        children: [
          CircleAvatar(
            radius: 29.5,
            foregroundImage: AssetImage('$pngAssetsPath/${guest.pngImgAssetName}'),
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                guest.name,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1C1D1C),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                _subtitleBuilder(),
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: const Color(0xff9C9DA7),
                ),
              ),
            ],
          ),
          const Spacer(),
          if(type == _Type.forList)
            const Icon(
              Icons.chevron_right,
              size: 24,
              color: Color(0xff359BE5),
            ),
        ],
      ),
    );
  }
}
