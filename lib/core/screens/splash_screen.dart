import 'package:flutter/material.dart';
import 'package:food_app/core/providers/first_use_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController splashScreenAnimationController;

  late bool wasConnected;

  @override
  void initState() {
    super.initState();
    const animationDuration = Duration(milliseconds: 1000);
    splashScreenAnimationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
    splashScreenAnimationController.forward();
    splashScreenAnimationController.repeat(reverse: true, min: 0.7);
    Future.delayed(const Duration(milliseconds: 2000), () {
      // wasConnected == true ? context.go("/login") :
      context.go("/introduction_screen");
    });
  }

  @override
  void dispose() {
    splashScreenAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    wasConnected = context.read<FirstUserProvider>().firstConnection;
    return Material(
      child: Center(
        child: AnimatedBuilder(
          animation: splashScreenAnimationController,
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: splashScreenAnimationController.value * 1.2,
              child: child,
            );
          },
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}
