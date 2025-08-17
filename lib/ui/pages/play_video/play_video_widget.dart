import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videos/ui/pages/play_video/buttons_video_play_widget.dart';
import 'package:videos/ui/pages/play_video/video_play_view_model.dart';

/// Como chamar
///PlayVideoWidget(
///  viewModel: VideoPlayViewModel(
///    url:
///      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
///    ),
///  )
class PlayVideoWidget extends StatefulWidget {
  final VideoPlayViewModel viewModel;
  const PlayVideoWidget({super.key, required this.viewModel});

  @override
  _PlayVideoWidgetState createState() => _PlayVideoWidgetState();
}

class _PlayVideoWidgetState extends State<PlayVideoWidget> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return Center(
          child: widget.viewModel.controller.value.isInitialized
              ? Stack(
                  children: [
                    AspectRatio(
                      aspectRatio:
                          widget.viewModel.controller.value.aspectRatio,
                      child: VideoPlayer(widget.viewModel.controller),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: ButtonsVideoPlayWidget(
                          viewModel: widget.viewModel,
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        );
      },
    );
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }
}
