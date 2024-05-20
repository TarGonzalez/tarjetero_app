import 'package:get/get.dart';

import '/routes/routes_names.dart';
import '/screens/login_screen.dart';
import '/screens/onboarding_screen.dart';
import '/screens/tabs_screen.dart';

List<GetPage<dynamic>> rutas = <GetPage<dynamic>>[
  GetPage<dynamic>(
      name: nameOnboardingScreen, page: () => const OnboardingScreen()),
  GetPage<dynamic>(name: nameLoginScreen, page: () => const LoginScreen()),
  GetPage<dynamic>(name: nameTabsScreen, page: () => const TabsScreen()),
];
