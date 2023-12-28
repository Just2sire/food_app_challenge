import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xffFAFFF7),
  colorScheme: ColorScheme.fromSeed(
    primary: const Color(0xff15B273),
    secondary: const Color(0xffE9BA57),
    tertiary: const Color(0xffEE3736),
    surface: const Color(0xffEFFEE7),
    seedColor: const Color(0xff15B273),
  ),
  iconTheme: const IconThemeData(
    size: 24.0,
    color: Colors.black87,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontSize: 34,
      color: Color(0xff363C32),
    ),
    headlineSmall: TextStyle(
      fontSize: 30,
      color: Color(0xff363C32),
    ),
    titleLarge: TextStyle(
      fontSize: 26,
      color: Color(0xff363C32),
    ),
    titleMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: Color(0xff363C32),
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: Color(0xff363C32),
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Color(0xff363C32),
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      color: Color(0xff363C32),
    ),
  ),
);
