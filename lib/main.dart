import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/routes/routes_names.dart';
import '/routes/routes_pages.dart';
import '/themes/app_theme.dart';
import 'controllers/main_controller.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inicializamos los controllers
    Get.put(MainController());
    return GetMaterialApp(
      initialRoute: nameOnboardingScreen,
      getPages: rutas,
      theme: themeLight,
      darkTheme: themeDark,
      defaultTransition: Transition.leftToRightWithFade,
    );
  }
}
