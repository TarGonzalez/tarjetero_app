import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '/routes/routes_names.dart';
import '/routes/routes_pages.dart';
import '/themes/app_theme.dart';
import 'controllers/login_controller.dart';
import 'controllers/main_controller.dart';
import 'helpers/env_reader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  EnvReader.initialize();
  await initializeDateFormatting();
  Intl.defaultLocale = 'es_MX';
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inicializamos los controllers
    Get.put(MainController());
    return FutureBuilder<bool>(
      future: Get.find<LoginController>().sesionObtenerDatos(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Muestra una pantalla de carga mientras se verifica la sesión.
          return const Center(child: CircularProgressIndicator());
        } else {
          // Si la sesión es válida, navega a la pantalla principal.
          final String initialRoute = snapshot.data == false ? nameLoginScreen : nameTabsScreen;
          return GetMaterialApp(
            initialRoute: initialRoute,
            getPages: rutas,
            theme: themeLight,
            darkTheme: themeDark,
            defaultTransition: Transition.rightToLeftWithFade,
          );
        }
      },
    );
  }
}
