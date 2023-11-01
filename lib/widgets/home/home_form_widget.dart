import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../layout/layout.dart';
import '../../logic/logic.dart';
import '../button_widget.dart';
import '../form_header_widget.dart';
import '../input_widget.dart';
import '../primary_button_widget.dart';

class HomeFormWidget extends StatefulWidget {
  const HomeFormWidget({super.key});

  @override
  State<HomeFormWidget> createState() => _HomeFormWidgetState();
}

class _HomeFormWidgetState extends State<HomeFormWidget> {
  final nameController = TextEditingController();

  final _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('home-detector'),
      onTap: () {
        _focus.unfocus();
      },
      child: BlocProvider(
        create: (context) => NamesToDrawCubit(),
        child: BlocBuilder<NamesToDrawCubit, List<String>>(
          builder: (context, state) => FormHeaderWidget(
            children: [
              Center(
                child: Text(
                  'Vamos começar!',
                  style: AppFontStyles.h3SemiBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              InputWidget(
                controller: nameController,
                focusNode: _focus,
                hintText: 'Insira os nomes dos participantes',
                prefix: const Icon(
                  Icons.person_add_rounded,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: SecondaryButtonWidget(
                  key: const Key('add-button'),
                  title: 'Adicionar',
                  onPressed: () {
                    final cubit = BlocProvider.of<NamesToDrawCubit>(context);
                    final error = cubit.add(nameController.text);

                    if (error != null) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Ops!'),
                          content: Text(error),
                        ),
                      );
                    } else {
                      nameController.clear();
                      _focus.unfocus();
                    }
                  },
                ),
              ),
              _buildItems(state),
              const SizedBox(height: 24),
              if (state.isNotEmpty)
                Center(
                  child: PrimaryButtonWidget(
                    key: const Key('start-button'),
                    title: 'Iniciar brincadeira!',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/draw',
                        arguments: state,
                      );
                    },
                    prefixIcon:
                        SvgPicture.asset(ImageConstants.playCircleOutline),
                  ),
                ),
              Image.asset(
                ImageConstants.shoppingBags,
                height: 140,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItems(List<String> names) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          final cubit = BlocProvider.of<NamesToDrawCubit>(context);
          cubit.remove(names[index]);
        },
        child: Text(
          names[index],
          textAlign: TextAlign.center,
          style: AppFontStyles.body,
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: names.length,
    );
  }
}
