// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:videos/core/app_assets.dart';
import 'package:videos/core/app_color.dart';
import 'package:videos/core/app_spacements.dart';
import 'package:videos/core/app_text_style.dart';
import 'package:videos/main.dart';
import 'package:videos/ui/pages/home/home_view_model.dart';
import 'package:videos/ui/pages/home/widget/card_video_widget.dart';
import 'package:videos/ui/pages/user_auth_view_model.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel homeViewModel;
  const HomePage({Key? key, required this.homeViewModel}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final UserAuthViewModel authViewModel;

  @override
  void initState() {
    widget.homeViewModel.getVideos();
    super.initState();

    // authViewModel = getIt<UserAuthViewModel>();
    // if (!authViewModel.isLoggedIn) {
    //   Navigator.of(context).pushNamed('/');
    // }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final heightShimmerBase = height * 0.025;
    final width = MediaQuery.of(context).size.width - 16;
    final video = widget.homeViewModel.video;
    return Scaffold(
      // backgroundColor: AppColors.background,
      body: ListenableBuilder(
        listenable: widget.homeViewModel,
        builder: (context, _) {
          return Center(
            child: Container(
              // height: double.infinity,
              // width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.homeViewModel.isLoading
                      ? [Color(0xff000000), Color.fromARGB(255, 41, 40, 40)]
                      : video.gradientColors,
                  stops: [0, 1],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacements.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 52),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.shrink(),
                        Image.asset(
                          AppAssets.logo,
                          height: 40,
                          width: 40,
                          color: AppColors.white60,
                          alignment: Alignment.center,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          backgroundImage: NetworkImage(
                            'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacements.md),
                    AutoSizeText(
                      'Now Showing',
                      style: AppTextStyle.epilogue700BodyWhite,
                    ),
                    const SizedBox(height: AppSpacements.xxxs),
                    if (!widget.homeViewModel.isLoading)
                      Expanded(
                        child: PageView(
                          children: [
                            //aqui vvou usar builder
                            CardVideoWidget(video: video),
                            CardVideoWidget(video: video),
                          ],
                        ),
                      ),
                    if (!widget.homeViewModel.isLoading) SizedBox(height: 30),
                    if (widget.homeViewModel.isLoading)
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              colors: [Color(0xff4B2472), Color(0xff7C7C7C)],
                              stops: [0, 1],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          margin: EdgeInsets.only(bottom: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomShimmer(
                                      width: width * 0.2,
                                      height: heightShimmerBase,
                                    ),
                                    SizedBox(height: AppSpacements.xxxs),

                                    CustomShimmer(
                                      width: width * 0.4,
                                      height: heightShimmerBase * 2,
                                    ),
                                    SizedBox(height: AppSpacements.xs),

                                    CustomShimmer(
                                      width: width * 0.7,
                                      height: heightShimmerBase,
                                    ),
                                    CustomShimmer(
                                      width: width * 0.7,
                                      height: heightShimmerBase,
                                    ),
                                    CustomShimmer(
                                      width: width * 0.7,
                                      height: heightShimmerBase,
                                    ),
                                    CustomShimmer(
                                      width: width * 0.7,
                                      height: heightShimmerBase,
                                    ),
                                    CustomShimmer(
                                      width: width * 0.7,
                                      height: heightShimmerBase,
                                    ),
                                    SizedBox(height: AppSpacements.xlg),
                                    Row(
                                      children: [
                                        CustomShimmer(
                                          width: width * 0.3,
                                          height: heightShimmerBase,
                                        ),
                                        CustomShimmer(
                                          width: width * 0.2,
                                          height: heightShimmerBase,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        OvalShimmer(
                                          width: heightShimmerBase * 1.5,
                                          height: heightShimmerBase * 1.5,
                                        ),
                                        CustomShimmer(
                                          width: width * 0.6,
                                          height: heightShimmerBase,
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            AppAssets.decoration,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          top: 0,
                                          left: 24,
                                          child: Container(
                                            width: 300,
                                            height: 100,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                OvalShimmer(
                                                  width:
                                                      heightShimmerBase * 1.5,
                                                  height:
                                                      heightShimmerBase * 1.5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                      ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 3,
                                                            ),
                                                        child: Container(
                                                          height: 5,
                                                          width: 1,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 3,
                                                            ),
                                                        child: Container(
                                                          height: 5,
                                                          width: 1,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                      ),

                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 3,
                                                            ),
                                                        child: Container(
                                                          height: 5,
                                                          width: 1,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                      ),

                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 3,
                                                            ),
                                                        child: Container(
                                                          height: 5,
                                                          width: 1,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 3,
                                                            ),
                                                        child: Container(
                                                          height: 5,
                                                          width: 1,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Shimmer.fromColors(
                                                  baseColor: AppColors.white20,
                                                  highlightColor:
                                                      AppColors.white45,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height:
                                                              heightShimmerBase,
                                                          width: width * 0.55,
                                                          decoration: BoxDecoration(
                                                            color: AppColors
                                                                .white60,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  heightShimmerBase /
                                                                      2,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                // CustomShimmer(
                                                //   width: width * 0.6,
                                                //   height: heightShimmerBase,
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: AppColors.divider.withOpacity(0.5),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: width * 0.3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              OvalShimmer(
                                                width: heightShimmerBase * 1.5,
                                                height: heightShimmerBase * 1.5,
                                              ),
                                              OvalShimmer(
                                                width: heightShimmerBase * 1.5,
                                                height: heightShimmerBase * 1.5,
                                              ),
                                            ],
                                          ),
                                        ),
                                        CustomShimmer(
                                          width: width * 0.28,
                                          height: heightShimmerBase,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CustomShimmer(
                                          width: width * 0.28,
                                          height: heightShimmerBase,
                                        ),
                                        CustomShimmer(
                                          width: width * 0.28,
                                          height: heightShimmerBase,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomShimmer extends StatefulWidget {
  final double height;
  final double width;
  const CustomShimmer({
    super.key,
    this.height = 20,
    this.width = double.infinity,
  });

  @override
  State<CustomShimmer> createState() => _CustomShimmerState();
}

class _CustomShimmerState extends State<CustomShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.white20,
      highlightColor: AppColors.white45,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                color: AppColors.white60,
                borderRadius: BorderRadius.circular(widget.height / 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OvalShimmer extends StatelessWidget {
  final double height;
  final double width;
  const OvalShimmer({super.key, this.height = 50, this.width = 100});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.white20,
      highlightColor: AppColors.white45,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            color: AppColors.white60,
            shape: BoxShape.circle, // se height == width fica círculo
          ),
        ),
      ),
    );
  }
}

class InnerBorderContainer extends StatelessWidget {
  final Widget child;
  final double borderWidth;
  final Color borderColor;
  final double borderRadius;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;

  const InnerBorderContainer({
    Key? key,
    required this.child,
    this.borderWidth = 3.0,
    this.borderColor = Colors.black,
    this.borderRadius = 10.0,
    this.backgroundColor = Colors.white,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        color: borderColor, // cor da borda
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            borderRadius - borderWidth, // reduz para "encaixar" dentro da borda
          ),
        ),
        child: child,
      ),
    );
  }
}
