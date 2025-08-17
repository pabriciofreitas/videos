import 'package:flutter/material.dart';
import 'package:videos/repository/sign_up/sign_up_repository.dart';
import 'package:videos/service/api_service.dart';
import 'package:videos/service/firebase_auth_service.dart';
import 'package:videos/ui/pages/sign_up/sign_up_onboarding_page.dart';
import 'package:videos/ui/pages/sign_up/sign_up_view_model.dart';
import 'package:videos/ui/pages/splash/splash_page.dart';
import 'package:videos/ui/pages/sign_up/sign_up_page.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashPage());
    case '/sign-up':
      return MaterialPageRoute(
        builder: (_) => SignUpPage(
          signUpViewModel: SignUpViewModel(
            SignUpRepository(
              apiService: ApiService.instance,
              firebaseAuthService: FirebaseAuthService.instance,
            ),
          ),
        ),
      );
    case '/sign-up-onboarding':
      final args = settings.arguments as SignUpViewModel;
      return MaterialPageRoute(
        builder: (_) => SignUpOnboardingPage(signUpViewModel: args),
      );
    // case '/sign-up':
    //
    //   return MaterialPageRoute(builder: (_) => DetailsPage(args: args));
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('Page Not found: ${settings.name}')),
        ),
      );
  }
}
