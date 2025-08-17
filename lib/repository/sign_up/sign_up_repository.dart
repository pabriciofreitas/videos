import 'package:firebase_auth/firebase_auth.dart';
import 'package:videos/core/app_print.dart';
import 'package:videos/repository/sign_up/i_sign_up_repository.dart';
import 'package:videos/service/api_service.dart';
import 'package:videos/service/firebase_auth_service.dart';

class SignUpRepository implements ISignUpRepository {
  final FirebaseAuthService _firebaseAuthService;
  final ApiService _apiService;
  SignUpRepository({
    required FirebaseAuthService firebaseAuthService,
    required ApiService apiService,
  }) : _firebaseAuthService = firebaseAuthService,
       _apiService = apiService;
  @override
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        await _registerUserInApi(
          email: email,
          password: password,
          username: user.displayName ?? email,
          firebaseUID: user.uid,
        );
      }
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _registerUserInApi({
    required String email,
    required String password,
    required String username,
    required String firebaseUID,
  }) async {
    // try {
    final response = await _apiService.post(
      'auth/local/register',
      data: {
        'email': email,
        'password': password,
        'username': username,
        'firebase_UID': firebaseUID,
      },
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      console('Failed to register user in API');
      throw Exception('Failed to register user. Please try again.');
    }
    // } catch (e) {
    //   rethrow;
    // }
  }

  @override
  Future<void> updateUser({
    required String username,
    required String firebaseUID,
    required bool finishedOnboarding,
  }) async {
    try {
      final response = await _apiService.patch(
        'users/updateMe',
        data: {
          'firebase_UID': firebaseUID,
          'username': username,
          'finished_onboarding': finishedOnboarding,
        },
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        console('Failed complete onboarding.');
        throw Exception('Failed complete onboarding. Please try again.');
      }
    } catch (e) {
      throw Exception('Failed complete onboarding. Please try again.');
    }
  }
}
