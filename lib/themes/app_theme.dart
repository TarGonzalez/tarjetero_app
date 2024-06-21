import 'package:flutter/material.dart';
import 'color_palette.dart';

final ThemeData themeLight = ThemeData(
  useMaterial3: true,
  primaryColor: colorPrimario,
  primaryColorDark: colorSecundario,
  primaryColorLight: colorLight,
  scaffoldBackgroundColor: colorBackground,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: colorPrimario,
    onPrimary: colorPrimario,
    secondary: colorSecundario,
    onSecondary: colorSecundarioDark,
    error: Colors.red,
    onError: Colors.red,
    background: colorBackground,
    onBackground: colorBackground,
    surface: Colors.yellow,
    onSurface: Colors.yellow,
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: colorPrimario,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color?>(colorPrimario),
      side: MaterialStateProperty.all<BorderSide?>(
        const BorderSide(color: colorPrimario),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              6.0), // Cambia aquí el radio de las esquinas
        ),
      ),
      minimumSize: MaterialStateProperty.all<Size?>(
        const Size(130, 50),
      ),
      maximumSize: MaterialStateProperty.all<Size?>(
        const Size(double.infinity, 50),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color?>(
        colorPrimario,
      ),
      foregroundColor: MaterialStateProperty.all<Color?>(Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              6.0), // Cambia aquí el radio de las esquinas
        ),
      ),
      minimumSize: MaterialStateProperty.all<Size?>(
        const Size(130, 50),
      ),
      maximumSize: MaterialStateProperty.all<Size?>(
        const Size(double.infinity, 50),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    border: OutlineInputBorder(), // Define el borde de los inputs
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorSecundarioDarker),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    hintStyle: TextStyle(
      color: colorSecundarioDarker,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontSize: 18,
      color: colorTexto,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      color: colorTexto,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      fontSize: 24,
      color: colorTexto,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: colorTexto,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: colorTexto,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: colorTexto,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 12,
      color: colorSecundarioDarker,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontSize: 14,
      color: colorSecundarioDarker,
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      fontSize: 15,
      color: colorSecundarioDarker,
      fontWeight: FontWeight.w400,
    ),
  ),
);

final ThemeData themeDark = ThemeData(
  useMaterial3: true,
  primaryColor: darkColorPrimarioDark,
  primaryColorLight: darkColorLight,
  scaffoldBackgroundColor: darkColorBackground,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: darkColorPrimarioDark,
    onPrimary: darkColorPrimarioDark,
    secondary: darkColorSecundario,
    onSecondary: darkColorSecundarioDark,
    error: Colors.red,
    onError: Colors.red,
    background: darkColorBackground,
    onBackground: darkColorBackground,
    surface: Colors.yellow,
    onSurface: Colors.yellow,
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: darkColorPrimarioDark,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color?>(darkColorPrimarioDark),
      side: MaterialStateProperty.all<BorderSide?>(
        const BorderSide(color: darkColorPrimarioDark),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              6.0), // Cambia aquí el radio de las esquinas
        ),
      ),
      minimumSize: MaterialStateProperty.all<Size?>(
        const Size(130, 50),
      ),
      maximumSize: MaterialStateProperty.all<Size?>(
        const Size(double.infinity, 50),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color?>(
        darkColorPrimarioDark,
      ),
      foregroundColor: MaterialStateProperty.all<Color?>(Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              6.0), // Cambia aquí el radio de las esquinas
        ),
      ),
      minimumSize: MaterialStateProperty.all<Size?>(
        const Size(130, 50),
      ),
      maximumSize: MaterialStateProperty.all<Size?>(
        const Size(double.infinity, 50),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    border: OutlineInputBorder(), // Define el borde de los inputs
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: darkColorSecundarioDarker),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    hintStyle: TextStyle(
      color: darkColorSecundarioDarker,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontSize: 18,
      color: darkColorTexto,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      color: darkColorTexto,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      fontSize: 24,
      color: darkColorTexto,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: darkColorTexto,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: darkColorTexto,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: darkColorTexto,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 12,
      color: darkColorSecundarioDarker,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontSize: 14,
      color: darkColorSecundarioDarker,
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      fontSize: 15,
      color: darkColorSecundarioDarker,
      fontWeight: FontWeight.w400,
    ),
  ),
);
