import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../../features/auth/view/login_page.dart';
import '../../features/auth/view/register_page.dart';
import '../../features/splash/view/splash_page.dart';
import '../../features/auth/view/pitch_page.dart';

abstract class AppPages {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.register: (_) => const RegisterPage(),
    AppRoutes.splash: (_) => const SplashPage(),
    AppRoutes.pitch: (_) => const PitchPage(),
  };
}
