import 'package:flutter/material.dart';
import 'package:videos/core/app_assets.dart';
import 'package:videos/core/app_color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        Navigator.of(context).pushReplacementNamed('/sign-up');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
