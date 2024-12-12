import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_management/utils/constans/color_extention.dart';
import 'package:gym_management/utils/constans/image_constans.dart';
import 'package:gym_management/view/login/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Create a fade animation
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation
    _controller.forward();

    // Load the next screen after the animation
    loadAppScreen();
  }

  void loadAppScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    loadOnaBoardingScreen();
  }

  void loadOnaBoardingScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      ),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(
            ImageConstans.splashScreenLogo,
            width: context.width * 0.65,
          ),
        ),
      ),
    );
  }
}
