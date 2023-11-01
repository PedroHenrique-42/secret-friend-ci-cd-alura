import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secrete_friend_drawer/widgets/dropdown_input_widget.dart';

import '../../layout/layout.dart';
import '../../logic/logic.dart';
import '../form_header_widget.dart';
import '../primary_button_widget.dart';

class DrawFormWidget extends StatefulWidget {
  const DrawFormWidget({
    super.key,
    required this.names,
  });

  final List<String> names;

  @override
  State<DrawFormWidget> createState() => _DrawFormWidgetState();
}

class _DrawFormWidgetState extends State<DrawFormWidget> {
  final nameController = TextEditingController();

  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NameDrawCubit(widget.names),
      child: BlocConsumer<NameDrawCubit, NameDrawState>(
        listener: (context, state) {
          if (state is NameDrawErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Ops!'),
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) => FormHeaderWidget(
          children: [
            Center(
              child: Text(
                'Quem vai tirar o papelzinho?',
                style: AppFontStyles.h3SemiBold.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 24),
            DropdownInputWidget(
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
              options: widget.names,
              selectedOption: selectedOption,
            ),
            const SizedBox(height: 24),
            Text(
              'Clique em em sortear para ver quem é seu amigo secreto!',
              style: AppFontStyles.body,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            if (selectedOption != null)
              Center(
                child: PrimaryButtonWidget(
                  title: 'Sortear!',
                  onPressed: () {
                    final cubit = BlocProvider.of<NameDrawCubit>(context);
                    cubit.drawNameForPerson(selectedOption!);
                  },
                  prefixIcon: SvgPicture.asset(ImageConstants.casino),
                ),
              ),
            const SizedBox(height: 24),
            if (state is NameDrawSuccessState)
              Center(
                child: Text(
                  state.name,
                  style: AppFontStyles.h3.copyWith(color: AppColors.secondary),
                ),
              ),
            const SizedBox(height: 24),
            Image.asset(
              ImageConstants.plane,
              height: 140,
            ),
          ],
        ),
      ),
    );
  }
}
