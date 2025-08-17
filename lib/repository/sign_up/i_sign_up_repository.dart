import 'package:firebase_auth/firebase_auth.dart';

abstract class ISignUpRepository {
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> updateUser({
    required String username,
    required String firebaseUID,
    required bool finishedOnboarding,
  });
}
