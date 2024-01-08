import 'package:flutter/material.dart';
import 'package:food_app/core/screens/home_screen.dart';
import 'package:food_app/core/screens/introduction_screen.dart';
import 'package:food_app/core/screens/signup_or_login.dart';
import 'package:food_app/core/screens/splash_screen.dart';
import 'package:food_app/core/widgets/bottom_nav_bar.dart';
import 'package:food_app/features/auth/screens/forget_password/get_email.dart';
import 'package:food_app/features/auth/screens/forget_password/reset_password.dart';
import 'package:food_app/features/auth/screens/forget_password/verify_email.dart';
import 'package:food_app/features/auth/screens/login_screen.dart';
import 'package:food_app/features/auth/screens/register_screen.dart';
import 'package:food_app/features/chat/screens/chat_principal_page.dart';
import 'package:food_app/features/search/screens/principal_research_screen.dart';
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
        GoRoute(
          path: 'forgot_password_get_email',
          builder: (BuildContext context, GoRouterState state) {
            return const GetEmailScreen();
          },
        ),
        GoRoute(
          path: 'verify_email',
          builder: (BuildContext context, GoRouterState state) {
            return const VerifyEmailScreen();
          },
        ),
        GoRoute(
          path: 'reset_password',
          builder: (BuildContext context, GoRouterState state) {
            return const ResetPasswordScreen();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: 'chat',
          builder: (BuildContext context, GoRouterState state) {
            return const ChatPage();
          },
        ),
        GoRoute(
          path: 'add',
          builder: (BuildContext context, GoRouterState state) {
            return const Scaffold(
              extendBody: true,
              body: Center(
                child: Text("Add"),
              ),
              bottomNavigationBar: BottomNavBar(
                index: 2,
              ),
            );
          },
        ),
        GoRoute(
          path: 'search',
          builder: (BuildContext context, GoRouterState state) {
            return const SearchPrincipalScreen();
          },
        ),
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const Scaffold(
              extendBody: true,
              body: Center(
                child: Text("Profile"),
              ),
              bottomNavigationBar: BottomNavBar(
                index: 4,
              ),
            );
          },
        ),
      ],
    ),
  ],
);
