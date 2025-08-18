// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:videos/core/app_color.dart';

import 'package:videos/ui/pages/play_video/video_play_view_model.dart';
import 'package:videos/ui/pages/play_video/widgets/play_video_widget.dart';

class VideoPlayPage extends StatefulWidget {
  final String url;
  const VideoPlayPage({super.key, required this.url});

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  late final VideoPlayViewModel videoPlayViewModel;
  @override
  void initState() {
    videoPlayViewModel = VideoPlayViewModel(url: widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListenableBuilder(
        listenable: videoPlayViewModel,
        builder: (context, _) {
          return PlayVideoWidget(viewModel: videoPlayViewModel);
        },
      ),
    );
  }
}
