import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../layout/images.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        SvgPicture.asset(
          ImageConstants.logo,
          height: 120,
        ),
        const SizedBox(height: 8),
        Image.asset(
          ImageConstants.ilustration,
          height: 120,
        ),
      ],
    );
  }
}
