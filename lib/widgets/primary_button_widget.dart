import 'package:flutter/material.dart';
import 'package:secrete_friend_drawer/layout/colors.dart';
import 'package:secrete_friend_drawer/layout/font_styles.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    required this.prefixIcon,
  });

  final Function() onPressed;
  final String title;
  final Widget prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: ShapeDecoration(
        shadows: const [
          BoxShadow(
            color: AppColors.black,
            blurRadius: 0,
            offset: Offset(4, 4),
            spreadRadius: 0,
          )
        ],
        color: AppColors.grey,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: prefixIcon,
            ),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style:
                    AppFontStyles.h3SemiBold.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
