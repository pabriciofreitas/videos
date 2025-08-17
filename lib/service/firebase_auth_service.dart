import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:videos/core/app_print.dart';

class FirebaseAuthService {
  FirebaseAuthService([FirebaseAuth? auth, GoogleSignIn? googleSignIn])
    : _auth = auth ?? FirebaseAuth.instance,
      _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  FirebaseAuthService._internal()
    : _auth = FirebaseAuth.instance,
      _googleSignIn = GoogleSignIn.instance;

  static final FirebaseAuthService instance = FirebaseAuthService._internal();
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

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

  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    final v = await FirebaseAuth.instance.signInWithCredential(credential);
    return v.user;
  }
}
