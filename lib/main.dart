import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/routes/routes_names.dart';
import '/routes/routes_pages.dart';
import '/themes/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: nameOnboardingScreen,
      getPages: rutas,
      theme: themeLight,
      darkTheme: themeDark,
    );
  }
}
