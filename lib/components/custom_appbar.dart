import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    Key? key,
    this.bottom,
  }) : super(key: key);

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff3B9DF6),
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Guest List',
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      bottom: bottom,
    );
  }
}
