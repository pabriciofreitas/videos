// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:videos/core/app_color.dart';
import 'package:videos/core/app_text_style.dart';

import 'package:videos/model/video_model.dart';
import 'package:videos/ui/widgets/custom_button_widget.dart';

class CardVideoWidget extends StatelessWidget {
  final VideoModel video;
  const CardVideoWidget({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.network(
            video.image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        Positioned(
          height: MediaQuery.of(context).size.height - (52 + 40 + 40 + 32),
          width: MediaQuery.of(context).size.width - (16 + 16),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Container(
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        AutoSizeText(
                          video.subTitle,
                          style: AppTextStyle.epilogue600BodyMediumWhite,
                        ),
                        AutoSizeText(
                          video.title,
                          style: AppTextStyle.epilogue600TitleLargeWhite,
                        ),
                        AutoSizeText(
                          video.description,
                          style: AppTextStyle.epilogue400BodyMediumWhite,
                        ),
                        SizedBox(height: 41),

                        AutoSizeText(
                          'Comments: ' + video.countComments.toString(),
                          style: AppTextStyle.epilogue600BodyWhite,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.white,
                              maxRadius: 10,
                            ),
                            SizedBox(width: 8),
                            Flexible(
                              child: AutoSizeText(
                                'Lorem ipsum dolor sit amet, consect adsdasdsad dqwq',
                                style: AppTextStyle.epilogue400BodyWhite,

                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 41),

                        Center(
                          child: SizedBox(
                            height: 50,
                            child: CustomButtonWidget(
                              // textColor: Colors.red,
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/video',
                                  arguments: video.url,
                                );
                              },
                              text: 'Watch',
                              backgroundColor: Color(
                                0xFFBC4CF1,
                              ).withOpacity(0.2),
                            ),
                          ),
                        ),
                        SizedBox(height: 41),
                      ],
                    ),
                  ),
                  Divider(color: AppColors.divider.withOpacity(0.5)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    video.isLike
                                        ? Icons.thumb_up
                                        : Icons.thumb_up_outlined,
                                    color: AppColors.white,
                                  ),
                                ),
                                AutoSizeText(
                                  'Rate',
                                  style: AppTextStyle.epilogue400SmallWhite
                                      .copyWith(
                                        color: AppColors.white.withOpacity(0.5),
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Transform.rotate(
                                  angle: 0.600,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.navigation_outlined,
                                      color: AppColors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                AutoSizeText(
                                  'Gift to someone?',
                                  style: AppTextStyle.epilogue400SmallWhite
                                      .copyWith(
                                        color: AppColors.white.withOpacity(0.5),
                                      ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                AutoSizeText(
                                  'Available until',
                                  style: AppTextStyle.epilogue500BodyWhite
                                      .copyWith(
                                        color: AppColors.white.withOpacity(0.5),
                                      ),
                                ),
                                AutoSizeText(
                                  'Available until',
                                  style:
                                      AppTextStyle.epilogue600BodyMediumPrimary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
