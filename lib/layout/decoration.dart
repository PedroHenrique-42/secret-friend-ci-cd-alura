import 'package:flutter/material.dart';
import 'package:secrete_friend_drawer/layout/colors.dart';

class AppDecoration {
  static final boldShape = ShapeDecoration(
    color: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    shadows: const [
      BoxShadow(
        color: AppColors.black,
        blurRadius: 0,
        offset: Offset(4, 4),
        spreadRadius: 0,
      )
    ],
  );

  static final normalShape = ShapeDecoration(
    color: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    shadows: const [
      BoxShadow(
        color: AppColors.black,
        blurRadius: 0,
        offset: Offset(2, 2),
        spreadRadius: 0,
      )
    ],
  );
}
