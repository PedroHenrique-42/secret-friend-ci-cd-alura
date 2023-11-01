import 'package:flutter/material.dart';
import 'package:secrete_friend_drawer/layout/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFontStyles {
  static final h1 = GoogleFonts.poppins(
    color: AppColors.textColor,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static final h2 = GoogleFonts.poppins(
    color: AppColors.textColor,
    fontSize: 25,
    fontWeight: FontWeight.w400,
  );

  static final h3 = GoogleFonts.poppins(
    color: AppColors.textColor,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final h3SemiBold = GoogleFonts.poppins(
    color: AppColors.textColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final body = GoogleFonts.poppins(
    color: AppColors.textColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final bodyBold = GoogleFonts.poppins(
    color: AppColors.textColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final bodySmall = GoogleFonts.poppins(
    color: AppColors.textColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
