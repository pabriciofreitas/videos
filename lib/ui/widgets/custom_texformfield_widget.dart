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
    return TextFormField(
      autovalidateMode: widget.autovalidateMode,
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      style: AppTextStyle.epilogue400BodyMediumWhite,
      validator: widget.validator,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: AppTextStyle.epilogue400BodyMediumWhite45,
        filled: true,
        fillColor: Color(0xFF1E1E1E),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        // Borda quando está habilitado (sem foco)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.white45),
        ),

        // Borda quando está focado
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.white20),
        ),

        // Borda quando está com erro (sem foco)
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.7),
            width: 1.5,
          ),
        ),

        // Borda quando está com erro e focado
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),

        // Borda quando está desabilitado
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.grey, width: 1),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
