import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';

class AuthServiceImpl implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> register({
    required String email,
    required String password,
  }) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() {
    return _firebaseAuth.signOut();
  }
}
