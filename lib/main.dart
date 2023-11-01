import 'package:flutter/material.dart';
import 'package:secrete_friend_drawer/layout/colors.dart';
import 'package:secrete_friend_drawer/pages/draw_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorteador de amigo secreto',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/draw': (context) => DrawPage(
              names: ModalRoute.of(context)?.settings.arguments as List<String>,
            ),
      },
      initialRoute: '/',
    );
  }
}
