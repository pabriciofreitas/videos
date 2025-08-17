// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:videos/core/app_assets.dart';
import 'package:videos/core/app_color.dart';
import 'package:videos/core/app_snack_bar.dart';
import 'package:videos/core/app_spacements.dart';
import 'package:videos/core/app_text_style.dart';
import 'package:videos/core/validator/email_validator.dart';
import 'package:videos/core/validator/password_confirm_validator.dart';
import 'package:videos/core/validator/password_validator.dart';
import 'package:videos/ui/pages/sign_up/sign_up_view_model.dart';
import 'package:videos/ui/widgets/button_google_and_apple_widget.dart';
import 'package:videos/ui/widgets/custom_button_widget.dart';
import 'package:videos/ui/widgets/custom_texformfield_widget.dart';
import 'package:videos/ui/widgets/divider_with_text_widget.dart';

class SignUpPage extends StatefulWidget {
  final SignUpViewModel signUpViewModel;
  const SignUpPage({super.key, required this.signUpViewModel});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListenableBuilder(
        listenable: widget.signUpViewModel,
        builder: (context, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacements.sm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: AppSpacements.sm),
                  Image.asset(
                    AppAssets.logoWithText,
                    width: width * 0.30,
                    height: width * 0.25,
                  ),
                  const SizedBox(height: AppSpacements.sm),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Already have an account? ',
                        style: AppTextStyle.montserrat400BodyMediumWhite45,
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          // ação de clique
                        },
                        child: AutoSizeText(
                          'Sign In!',
                          textAlign: TextAlign.center,

                          style: AppTextStyle.montserrat600BodyMediumPurple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 52),
                  AutoSizeText(
                    'Create an account',
                    style: AppTextStyle.epilogue600TitleWhite,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacements.xs),
                  AutoSizeText(
                    'To get started, please complete your account registration.',
                    style: AppTextStyle.montserrat400BodyMediumWhite45,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 41),
                  ButtonGoogleAndAppleWidget(
                    onAppleTap: () {
                      AppSnackBar().showNoConnectionSnackBar(
                        context,
                        'Coming soon',
                      );
                    },
                    onGoogleTap: () async {
                      try {
                        await widget.signUpViewModel.createUserWithGoogle();
                      } on Exception catch (e) {
                        AppSnackBar().showNoConnectionSnackBar(
                          context,
                          e.toString(), //           e.toString().replaceAll("Exception: ", ''),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 41),

                  DividerWithText(text: 'Or Sign up With'),

                  const SizedBox(height: 52),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextFormFieldWidget(
                          hintText: 'Email',
                          controller:
                              widget.signUpViewModel.emailTextEditController,
                          validator: EmailValidator.validate,
                        ),

                        const SizedBox(height: AppSpacements.md),

                        CustomTextFormFieldWidget(
                          controller:
                              widget.signUpViewModel.passwordTextEditController,
                          hintText: 'Password',
                          showShadow: true,
                          isPassword: true,
                          validator: PasswordValidator.validate,
                        ),
                        const SizedBox(height: AppSpacements.md),

                        CustomTextFormFieldWidget(
                          controller: widget
                              .signUpViewModel
                              .passwordConfirmTextEditController,
                          hintText: 'Confirm your Password',
                          showShadow: true,
                          isPassword: true,
                          validator: (v) => PasswordConfirmValidator.validate(
                            v,
                            widget
                                .signUpViewModel
                                .passwordTextEditController
                                .text
                                .trim(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacements.xlg),

                  CustomButtonWidget(
                    text: 'Create Account',
                    isLoading: widget.signUpViewModel.isLoading,
                    onPressed: () async {
                      Navigator.of(context).pushNamed(
                        '/sign-up-onboarding',
                        arguments: widget.signUpViewModel,
                      );
                      if (!formKey.currentState!.validate()) return;
                      try {
                        await widget.signUpViewModel
                            .createUserWithEmailAndPassword();

                        Navigator.of(context).pushNamed(
                          '/sign-up-onboarding',
                          arguments: widget.signUpViewModel,
                        );
                      } on Exception catch (e) {
                        AppSnackBar().showNoConnectionSnackBar(
                          context,
                          e.toString().replaceAll("Exception: ", ''),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 41),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
