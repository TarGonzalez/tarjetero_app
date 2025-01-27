import 'package:get/get.dart';

import '/routes/routes_names.dart';
import '/screens/gastos/nuevo_gasto_screen.dart';
import '/screens/login_screen.dart';
import '/screens/onboarding_screen.dart';
import '/screens/register_screen.dart';
import '/screens/tabs_screen.dart';
import '/screens/tarjetas/detalle_tarjeta_screen.dart';
import '/screens/tarjetas/editar_tarjeta_screen.dart';
import '/screens/tarjetas/nueva_tarjeta_screen.dart';

List<GetPage<dynamic>> rutas = <GetPage<dynamic>>[
  GetPage<dynamic>(
      name: nameOnboardingScreen, page: () => const OnboardingScreen()),
  GetPage<dynamic>(name: nameLoginScreen, page: () => const LoginScreen()),
  GetPage<dynamic>(
      name: nameRegisterScreen, page: () => const RegisterScreen()),
  GetPage<dynamic>(name: nameTabsScreen, page: () => const TabsScreen()),
  GetPage<dynamic>(
      name: nameNuevaTarjetaScreen, page: () => const NuevaTarjetaScreen()),
  GetPage<dynamic>(
    name: nameEditarTarjetaScreen,
    page: () => const EditarTarjetaScreen(),
  ),
  GetPage<dynamic>(
    name: nameDetalleTarjetaScreen,
    page: () => const DetalleTarjetaScreen(),
  ),
  GetPage<dynamic>(
      name: nameNuevoGastoScreen, page: () => const NuevoGastoScreen()),
];
