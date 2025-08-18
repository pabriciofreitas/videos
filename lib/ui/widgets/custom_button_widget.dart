import 'package:flutter/material.dart';
import 'package:videos/core/app_color.dart';
import 'package:videos/core/app_text_style.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final bool boxShadow;
  final bool isLoading;

  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.boxShadow = true,
    this.backgroundColor =
        AppColors.backgroundButton, // Exemplo similar ao fundo da imagem
    this.textColor = AppColors.primary, // Cor do texto da imagem
    this.borderColor = AppColors.primary, // Borda roxa da imagem
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor),
        boxShadow: boxShadow
            ? [
                BoxShadow(
                  color: const Color(0x33F1CC4C),
                  blurRadius: 18.33,
                  spreadRadius: 0,
                  offset: const Offset(0, 0),
                ),
              ]
            : null,
      ),

      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 260, minHeight: 60),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            backgroundColor: backgroundColor,
            foregroundColor: textColor,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: Colors.transparent),
            ),
            elevation: 0, // Sem sombra para manter o visual plano
          ),
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: const CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                )
              : Text(
                  text,
                  style: AppTextStyle.epilogue600BodyMediumPrimary.copyWith(
                    color: textColor,
                  ),
                ),
        ),
      ),
    );
  }
}
