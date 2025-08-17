import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:videos/core/app_assets.dart';
import 'package:videos/core/app_color.dart';

class AppSnackBar {
  void showNoConnectionSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: AppColors.greyBlack,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Column(
        children: [
          Row(
            children: [
              Image.asset(AppAssets.logo, width: 24, height: 24),
              SizedBox(width: 16),
              Flexible(
                child: AutoSizeText(
                  message,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  softWrap: true, // permite quebrar linha
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ],
      ),
      duration: const Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
