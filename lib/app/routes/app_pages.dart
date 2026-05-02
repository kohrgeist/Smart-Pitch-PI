import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../../ui/features/auth/view/login_page.dart';
import '../../ui/features/auth/view/register_page.dart';
import '../../ui/features/splash/view/splash_page.dart';
import '../../ui/features/auth/view/home_page.dart';
import '../../ui/features/auth/view/pitch_loading_page.dart';
import '../../ui/features/auth/view/favorites_page.dart';
import '../../ui/features/auth/view/pitch_page.dart';
import '../../ui/features/auth/view/historico_page.dart';
import '../../ui/features/auth/view/error_page.dart';
import '../../ui/features/auth/view/forgot_password_page.dart';

abstract class AppPages {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.register: (_) => const RegisterPage(),
    AppRoutes.splash: (_) => const SplashPage(),
    AppRoutes.home: (_) => const HomePage(),
    AppRoutes.pitchLoading: (_) => const PitchLoadingPage(),
    AppRoutes.pitch: (_) => const PitchPage(),
    AppRoutes.historico: (_) => const HistoricoPage(),
    AppRoutes.favoritos: (_) => const FavoritesPage(),
    AppRoutes.erro: (_) => const ErrorPage(),
    AppRoutes.esqueciSenha: (_) => const ForgotPasswordPage(),
  };
}
