import 'package:athlas/src/data/auth/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepository {
  Stream<AppUser?> authStateChanges();
  AppUser? get currentUser;
  Future<void> emailSignIn(String email, String password);
  Future<void> emailSignUp(String email, String password);
  Future<void> signOut();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authInstance = FirebaseAuth.instance;
  return FirebaseAuthRepository(auth: authInstance);
});

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({
    required this.auth,
  });

  final FirebaseAuth auth;

  @override
  Stream<AppUser?> authStateChanges() {
    return auth.authStateChanges().map((fbUser) => fbUser?.toAppUser());
  }

  @override
  AppUser? get currentUser => auth.currentUser?.toAppUser();

  @override
  Future<void> emailSignIn(String email, String password) async {
    auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> emailSignUp(String email, String password) async {
    auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    auth.signOut();
  }
}
