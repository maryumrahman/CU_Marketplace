
import 'package:connect_ummah/configs/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../configs/constants/colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? colorOpacity;
  final TextAlign? textAlign;
  final double fontSize;
  final int? maxLines;
  final FontWeight? fontWeight;

  const AppText(
      {super.key,
        required this.text,
        this.color,
        this.textAlign,
        required this.fontSize,
        this.maxLines,
        this.fontWeight,
        this.colorOpacity});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: maxLines,
      style: GoogleFonts.roboto(
        fontWeight: fontWeight,
        color: (color ?? AppColors.textfieldClrDark).op(colorOpacity ?? 1),
        fontSize: fontSize,
      ),
    );
  }
}