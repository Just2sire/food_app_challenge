import 'package:flutter/material.dart';
import 'package:food_app/core/screens/introduction_screen.dart';
import 'package:food_app/core/screens/signup_or_login.dart';
import 'package:food_app/core/screens/splash_screen.dart';
import 'package:food_app/features/auth/screens/login_screen.dart';
import 'package:food_app/features/auth/screens/register_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'introduction_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const IntroScreen();
          },
        ),
        GoRoute(
          path: 'signup_or_login',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpOrLogin();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterScreen();
          },
        ),
      ],
    ),
  ],
);