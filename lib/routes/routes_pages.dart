import 'package:get/get.dart';
import '/routes/routes_names.dart';
import '/screens/onboarding_screen.dart';
import '/screens/login_screen.dart';

List<GetPage> rutas = [
  GetPage(name: nameOnboardingScreen, page: () => const OnboardingScreen()),
  GetPage(name: nameLoginScreen, page: () => const LoginScreen()),
];
