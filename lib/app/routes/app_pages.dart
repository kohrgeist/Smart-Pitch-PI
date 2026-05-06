import 'package:flutter/material.dart';
import 'app_routes.dart';
import 'package:smart_pitch/ui/features/home/view/home_page.dart';
import 'package:smart_pitch/ui/features/pitch/view/pitch_loading_page.dart';
import 'package:smart_pitch/ui/features/pitch/view/pitch_page.dart';

import '../../ui/features/auth/view/login_page.dart';
import '../../ui/features/auth/view/register_page.dart';
import '../../ui/features/auth/view/forgot_password_page.dart';
import '../../ui/features/splash/view/splash_page.dart';
import '../../ui/features/perfil/view/perfil_page.dart';
import '../../ui/features/favorites/view/favorites_page.dart';
import '../../ui/features/historico/view/historico_page.dart';
import '../../ui/core/view/error_page.dart';

abstract class AppPages {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.register: (_) => const RegisterPage(),
    AppRoutes.splash: (_) => const SplashPage(),
    AppRoutes.home: (_) => const HomePage(),
    AppRoutes.perfil: (_) => const PerfilPage(),
    AppRoutes.pitchLoading: (_) => const PitchLoadingPage(),
    AppRoutes.pitch: (_) => const PitchPage(),
    AppRoutes.historico: (_) => const HistoricoPage(),
    AppRoutes.favoritos: (_) => const FavoritesPage(),
    AppRoutes.erro: (_) => const ErrorPage(),
    AppRoutes.esqueciSenha: (_) => const ForgotPasswordPage(),
  };
}
