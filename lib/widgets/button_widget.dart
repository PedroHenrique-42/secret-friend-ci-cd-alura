import 'package:flutter/material.dart';
import 'package:secrete_friend_drawer/layout/colors.dart';
import 'package:secrete_friend_drawer/layout/font_styles.dart';

class SecondaryButtonWidget extends StatelessWidget {
  const SecondaryButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: ShapeDecoration(
        shadows: const [
          BoxShadow(
            color: AppColors.black,
            blurRadius: 0,
            offset: Offset(2, 2),
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
          backgroundColor: AppColors.grey,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppFontStyles.bodyBold,
        ),
      ),
    );
  }
}
