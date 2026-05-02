import '../service/auth_service.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  bool get isLoggedIn => _authService.currentUser != null;

  @override
  Future<void> login({required String email, required String password}) async {
    await _authService.login(email: email, password: password);
  }

  @override
  Future<void> register({
    required String email,
    required String password,
  }) async {
    await _authService.register(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    await _authService.logout();
  }
}
