import 'package:flutter/material.dart';
import 'package:secrete_friend_drawer/layout/font_styles.dart';

import '../layout/colors.dart';

class DropdownInputWidget extends StatelessWidget {
  final String? selectedOption;
  final ValueChanged<String?> onChanged;
  final List<String> options;

  const DropdownInputWidget({
    required this.selectedOption,
    required this.onChanged,
    required this.options,
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
            color: Color(0xFF000000),
            blurRadius: 0,
            offset: Offset(4, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: selectedOption, // Valor selecionado.
        items: options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: onChanged,
        style: AppFontStyles.body,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Selecione seu nome',
          border: border,
          enabledBorder: border,
          disabledBorder: border,
          focusedBorder: border,
          errorBorder: border,
          focusedErrorBorder: border,
          labelStyle: AppFontStyles.body.copyWith(color: AppColors.black),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
          hintStyle: AppFontStyles.bodySmall.copyWith(color: AppColors.grey),
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
