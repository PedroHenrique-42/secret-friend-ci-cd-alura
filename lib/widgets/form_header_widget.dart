import 'package:flutter/material.dart';

import '../layout/colors.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 273),
      width: double.maxFinite,
      alignment: Alignment.bottomCenter,
      decoration: const ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(48),
            topRight: Radius.circular(48),
          ),
        ),
      ),
      padding: const EdgeInsets.only(top: 15),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        children: children,
      ),
    );
  }
}
