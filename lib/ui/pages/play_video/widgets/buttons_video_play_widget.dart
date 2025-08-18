import 'package:flutter/material.dart';
import 'package:videos/core/app_assets.dart';
import 'package:videos/ui/pages/play_video/video_play_view_model.dart';

class ButtonsVideoPlayWidget extends StatelessWidget {
  final VideoPlayViewModel viewModel;
  const ButtonsVideoPlayWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size.width * 0.10)
        .clamp(30.0, 80)
        .toDouble();
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Image.asset(
                  AppAssets.iconBack15S,
                  height: size * 0.5,
                  width: size * 0.5,
                ),
                onPressed: () {
                  viewModel.back15s();
                },
              ),
              IconButton(
                icon: Image.asset(
                  viewModel.controller.value.isPlaying
                      ? AppAssets.iconPause
                      : AppAssets.iconPlay,
                  height: size,
                  width: size,
                ),
                onPressed: () {
                  viewModel.controller.value.isPlaying
                      ? viewModel.pause()
                      : viewModel.play();
                },
              ),
              IconButton(
                icon: Image.asset(
                  AppAssets.iconNext15S,
                  height: size * 0.5,
                  width: size * 0.5,
                ),
                onPressed: () {
                  viewModel.next15s();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
