import 'package:flutter/material.dart';
import 'package:secrete_friend_drawer/layout/font_styles.dart';

import '../layout/colors.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final Widget? prefix;

  final String? hintText;
  final String? labelText;
  final FocusNode? focusNode;

  const InputWidget({
    required this.controller,
    this.prefix,
    this.hintText,
    this.labelText,
    this.focusNode,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2),
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
      ),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        focusNode: focusNode,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        autofocus: false,
        style: const TextStyle(
          color: AppColors.black,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: border,
          enabledBorder: border,
          disabledBorder: border,
          focusedBorder: border,
          errorBorder: border,
          focusedErrorBorder: border,
          labelStyle: AppFontStyles.body.copyWith(color: AppColors.black),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: prefix != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 32, right: 16),
                  child: prefix,
                )
              : null,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
          hintStyle: AppFontStyles.bodySmall.copyWith(color: AppColors.grey),
          hintText: hintText,
        ),
      ),
    );
  }

  static InputBorder get border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    );
  }
}
