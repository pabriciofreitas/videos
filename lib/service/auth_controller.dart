// // ignore_for_file: use_build_context_synchronously

// import 'package:chat_ifba/controller/home_controller.dart';
// import 'package:chat_ifba/screens/home_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthController {
//   User? user;
//   final GoogleSignIn googleSignIn = GoogleSignIn(
//     scopes: [
//       'email',
//       'https://www.googleapis.com/auth/contacts.readonly',
//     ],
//   );

//   Future<void> loginWichGoogle(BuildContext context) async {
//     final firebaseAuth = FirebaseAuth.instance;

//     if (firebaseAuth.currentUser == null) {
//       if (kIsWeb) {
//         final authProvider = GoogleAuthProvider();
//         try {
//           final UserCredential userCredential =
//               await firebaseAuth.signInWithPopup(authProvider);

//           user = userCredential.user;
//         } catch (e) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Theme.of(context).colorScheme.error,
//               content: const Text('Tente novamente...'),
//             ),
//           );
//           print(e);
//         }
//       }
//     } else {
//       user = firebaseAuth.currentUser;
//     }

//     if (user != null) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute<void>(
//           builder: (BuildContext context) => HomeScreen(
//             homeController: HomeController(user: user!),
//           ),
//         ),
//       );
//     }
//   }

//   // Future<void> isLoggedIn(BuildContext context) async {
//   //   user = firebaseAuth.currentUser;
//   //   if (user != null) {
//   //     Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute<void>(
//   //         builder: (BuildContext context) => HomeScreen(
//   //           homeController: HomeController(user: user!),
//   //         ),
//   //       ),
//   //     );
//   //   }
//   // }
// }
