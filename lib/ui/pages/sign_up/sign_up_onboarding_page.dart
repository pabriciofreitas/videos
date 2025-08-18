import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:videos/core/app_assets.dart';
import 'package:videos/core/app_color.dart';
import 'package:videos/core/app_spacements.dart';
import 'package:videos/core/app_text_style.dart';
import 'package:videos/core/validator/email_validator.dart';
import 'package:videos/core/validator/name_validator.dart';
import 'package:videos/ui/pages/sign_up/sign_up_view_model.dart';
import 'package:videos/ui/pages/sign_up/widgets/choose_image_widget.dart';
import 'package:videos/ui/widgets/custom_button_widget.dart';
import 'package:videos/ui/widgets/custom_texformfield_widget.dart';

class SignUpOnboardingPage extends StatefulWidget {
  final SignUpViewModel signUpViewModel;
  const SignUpOnboardingPage({super.key, required this.signUpViewModel});

  @override
  State<SignUpOnboardingPage> createState() => _SignUpOnboardingPageState();
}

class _SignUpOnboardingPageState extends State<SignUpOnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacements.md),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 52),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.logo,
                    height: 40,
                    width: 40,
                    color: AppColors.white60,
                    alignment: Alignment.center,
                  ),
                ],
              ),
              const SizedBox(height: 52),

              AutoSizeText(
                'Tell us more!',
                style: AppTextStyle.epilogue600TitleWhite,
              ),
              const SizedBox(height: AppSpacements.xs),
              AutoSizeText(
                'Complete your profile',
                style: AppTextStyle.montserrat400BodyMediumWhite45,
              ),
              const SizedBox(height: 52),

              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => ChooseImageBottomSheet(
                      onChanged: (e) {
                        widget.signUpViewModel.setProfileImage(e);
                        Navigator.pop(context);
                        setState(() {});
                      },
                    ),
                  );
                },

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: _width * 0.3,
                      height: _width * 0.3,
                      decoration: BoxDecoration(
                        color: const Color(
                          0x33BC4CF1,
                        ), // 20% opacidade (#BC4CF1)
                        borderRadius: BorderRadius.circular(
                          _width * 0.3 / 4,
                        ), // bordas arredondadas
                      ),
                      child: widget.signUpViewModel.profileImage == null
                          ? Center(
                              child: Image.asset(
                                AppAssets.iconCam,
                                width: 40,
                                height: 40,
                              ),
                            )
                          : Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  _width * 0.3 / 4,
                                ),
                              ),
                              child: Image.file(
                                widget.signUpViewModel.profileImage!,
                                width: _width * 0.3,
                                height: _width * 0.3,

                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppSpacements.md),
                      width: _width * 0.3,
                      child: Column(
                        children: [
                          AutoSizeText(
                            'CHOOSE IMAGE',
                            style: AppTextStyle.epilogue700BodyWhite,
                          ),
                          const SizedBox(height: AppSpacements.xs),
                          AutoSizeText(
                            'A square .jpg, .gif, or .png image 200x200 or larger',
                            style: AppTextStyle.epilogue400SmallWhite,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 52),
              CustomTextFormFieldWidget(
                hintText: 'Your name',
                controller: widget.signUpViewModel.nameTextEditController,
                validator: NameValidator.validate,
              ),
              const SizedBox(height: 52),
              CustomButtonWidget(
                text: 'Continue',
                isLoading: widget.signUpViewModel.isLoading,
                onPressed: () async {
                  Navigator.of(
                    context,
                  ).pushNamedAndRemoveUntil('/home', (route) => false);
                  // if (!formKey.currentState!.validate()) return;
                  // try {
                  //   await widget.signUpViewModel
                  //       .createUserWithEmailAndPassword();

                  //   Navigator.of(context).pushNamed(
                  //     '/sign-up-onboarding',
                  //     arguments: widget.signUpViewModel,
                  //   );
                  // } on Exception catch (e) {
                  //   AppSnackBar().showNoConnectionSnackBar(
                  //     // ignore: use_build_context_synchronously
                  //     context,
                  //     e.toString().replaceAll("Exception: ", ''),
                  //   );
                  // }
                },
              ),
              const SizedBox(height: AppSpacements.xxxs),

              Container(
                height: 60,
                width: 260,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Back",
                    style: AppTextStyle.epilogue600BodyMediumPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 52),
            ],
          ),
        ),
      ),
    );
  }
}
