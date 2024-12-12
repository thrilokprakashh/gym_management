import 'package:flutter/material.dart';
import 'package:gym_management/utils/constans/color_extention.dart';

import 'package:gym_management/view/login/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healtho Gym',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Poppins",
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              elevation: 0, backgroundColor: Colors.transparent),
          colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
          useMaterial3: false),
      home: const SplashScreen(),
    );
  }
}
