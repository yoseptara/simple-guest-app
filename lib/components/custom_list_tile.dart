import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTile extends StatelessWidget {
  final String label;
  final String value;
  final TextAlign? valueTextAlign;
  final CrossAxisAlignment? crossAxisAlignment;
  final Color? valueTextColor;

  const CustomListTile({
    Key? key,
    required this.label,
    required this.value, this.valueTextAlign, this.valueTextColor, this.crossAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: 12,
            color: const Color(0xff999A99),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value,
          textAlign: valueTextAlign,
          style: GoogleFonts.roboto(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: valueTextColor ?? const Color(0xff515C6F),
          ),
        ),
      ],
    );
  }
}