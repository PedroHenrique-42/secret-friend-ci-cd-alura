import 'package:flutter/material.dart';

import '../layout/colors.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: HomeFormWidget(),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: HeaderWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
