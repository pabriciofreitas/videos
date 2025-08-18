import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:videos/core/app_color.dart';
import 'package:videos/core/app_text_style.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.white20, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AutoSizeText(text, style: AppTextStyle.outfit500BodyGrey),
        ),
        Expanded(child: Divider(color: AppColors.white20, thickness: 1)),
      ],
    );
  }
}
