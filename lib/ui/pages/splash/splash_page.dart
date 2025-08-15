import 'package:flutter/material.dart';
import 'package:videos/core/app_assets.dart';
import 'package:videos/ui/app_color.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacementNamed('/sign-up');
    });
    return Container(
      color: AppColors.background,
      child: Center(
        child: Image.asset(
          AppAssets.logo,
          width: width * 0.25,
          height: width * 0.25,
        ),
      ),
    );
  }
}
