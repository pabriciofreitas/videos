import 'package:flutter/material.dart';
import 'package:videos/core/app_color.dart';

class SignUpOnboardingPage extends StatefulWidget {
  const SignUpOnboardingPage({super.key});

  @override
  State<SignUpOnboardingPage> createState() => _SignUpOnboardingPageState();
}

class _SignUpOnboardingPageState extends State<SignUpOnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text(
          'Welcome to the Sign Up Onboarding Page',
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
