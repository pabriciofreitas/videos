import 'package:flutter/material.dart';
import 'package:videos/core/app_assets.dart';
import 'package:videos/core/app_spacements.dart';

class ButtonGoogleAndAppleWidget extends StatelessWidget {
  final VoidCallback onAppleTap;
  final VoidCallback onGoogleTap;

  const ButtonGoogleAndAppleWidget({
    super.key,
    required this.onAppleTap,
    required this.onGoogleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onGoogleTap,
          child: Image.asset(AppAssets.iconGoogle),
        ),
        const SizedBox(width: AppSpacements.sm),
        GestureDetector(
          onTap: onAppleTap,
          child: Image.asset(AppAssets.iconApple),
        ),
      ],
    );
  }
}
