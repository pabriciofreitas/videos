import 'package:firebase_auth/firebase_auth.dart';
import 'package:videos/core/app_print.dart';

class FirebaseAuthService {
  // Construtor privado padrão
  FirebaseAuthService([FirebaseAuth? auth])
    : _auth = auth ?? FirebaseAuth.instance;

  // Construtor privado interno para singleton
  FirebaseAuthService._internal() : _auth = FirebaseAuth.instance;

  // Instância singleton (uso padrão no app)
  static final FirebaseAuthService instance = FirebaseAuthService._internal();
  final FirebaseAuth _auth;

  // Método para criar usuário com email e senha
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw Exception('This email is already in use.');
        case 'invalid-email':
          throw Exception('Invalid email address.');
        case 'weak-password':
          throw Exception('The password is too weak.');
        default:
          console(e.message);
          throw Exception('Error creating account, please try again.');
      }
    } catch (e) {
      throw Exception('Error creating account, please try again.');
    }
  }
}
