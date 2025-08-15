import 'package:flutter/material.dart';
import 'package:videos/ui/pages/splash/splash_page.dart';
import 'package:videos/ui/pages/sign_up/sign_up_page.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashPage());
    case '/sign-up':
      return MaterialPageRoute(builder: (_) => SignUpPage());
    // case '/sign-up':
    //   final args = settings.arguments as DetailsArguments;
    //   return MaterialPageRoute(builder: (_) => DetailsPage(args: args));
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('Page Not found: ${settings.name}')),
        ),
      );
  }
}
