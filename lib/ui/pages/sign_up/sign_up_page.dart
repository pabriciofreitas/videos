import 'package:flutter/material.dart';
import 'package:videos/ui/app_color.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text('Splash Screen', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
