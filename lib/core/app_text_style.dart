import 'package:flutter/material.dart';
import 'package:videos/core/app_color.dart';
import 'package:videos/core/app_font_sizes.dart';

class AppTextStyle {
  static const String fontFamilyMontserrat = 'Montserrat';
  static const String fontFamilyEpilogue = 'Epilogue';
  static const String fontFamilyOutfit = 'Outfit';

  static const TextStyle montserrat400BodyMediumWhite45 = TextStyle(
    color: AppColors.white45,
    fontFamily: fontFamilyMontserrat,
    fontWeight: FontWeight.w400,
    fontSize: AppFontSizes.bodyMedium,
  );

  static const TextStyle montserrat600BodyMediumPurple = TextStyle(
    color: AppColors.primary,
    fontFamily: fontFamilyMontserrat,
    fontWeight: FontWeight.w600,
    fontSize: AppFontSizes.bodyMedium,
  );
  static const TextStyle epilogue600TitleWhite = TextStyle(
    color: AppColors.white,
    fontFamily: fontFamilyEpilogue,
    fontWeight: FontWeight.w600,
    fontSize: AppFontSizes.title,
  );

  static const TextStyle epilogue600BodyMediumWhite = TextStyle(
    color: AppColors.white,
    fontFamily: fontFamilyEpilogue,
    fontWeight: FontWeight.w700,
    fontSize: AppFontSizes.bodyMedium,
  );

  static const TextStyle epilogue600BodyMediumPrimary = TextStyle(
    color: AppColors.primary,
    fontFamily: fontFamilyEpilogue,
    fontWeight: FontWeight.w600,
    fontSize: AppFontSizes.bodyMedium,
  );
  static const TextStyle epilogue400BodyMediumWhite45 = TextStyle(
    color: AppColors.white45,
    fontFamily: fontFamilyEpilogue,
    fontWeight: FontWeight.w400,
    fontSize: AppFontSizes.bodyMedium,
  );
  static const TextStyle epilogue400BodyMediumWhite = TextStyle(
    color: AppColors.white,
    fontFamily: fontFamilyEpilogue,
    fontWeight: FontWeight.w400,
    fontSize: AppFontSizes.bodyMedium,
  );

  static const TextStyle outfit500BodyGrey = TextStyle(
    color: AppColors.grey,
    fontFamily: fontFamilyOutfit,
    fontWeight: FontWeight.w500,
    fontSize: AppFontSizes.body,
  );
}
