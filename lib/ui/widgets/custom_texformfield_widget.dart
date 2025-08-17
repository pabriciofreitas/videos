import 'package:flutter/material.dart';
import 'package:videos/core/app_color.dart';
import 'package:videos/core/app_text_style.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final bool showShadow;
  final TextEditingController? controller;
  final AutovalidateMode autovalidateMode;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;

  const CustomTextFormFieldWidget({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.showShadow = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: widget.showShadow
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 6,
                  offset: Offset(0, -8), // sombra vai para cima
                ),
              ],
            )
          : null,
      child: TextFormField(
        autovalidateMode: widget.autovalidateMode,
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        keyboardType: widget.keyboardType,
        style: AppTextStyle.epilogue400BodyMediumWhite,
        validator: widget.validator,
        decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle: AppTextStyle.epilogue400BodyMediumWhite45,
          filled: true,
          fillColor: Color(0xFF1E1E1E),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[700]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[500]!),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey[400],
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
