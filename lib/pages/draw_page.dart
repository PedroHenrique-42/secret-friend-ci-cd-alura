import 'package:flutter/material.dart';
import 'package:secrete_friend_drawer/layout/colors.dart';

import '../widgets/draw/draw_form_widget.dart';
import '../widgets/header_widget.dart';

class DrawPage extends StatefulWidget {
  const DrawPage({
    super.key,
    required this.names,
  });

  final List<String> names;

  @override
  State<DrawPage> createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: DrawFormWidget(names: widget.names),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: HeaderWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
