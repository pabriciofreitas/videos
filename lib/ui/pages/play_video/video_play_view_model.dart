// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayViewModel extends ChangeNotifier {
  final String url;
  late VideoPlayerController controller;

  VideoPlayViewModel({required this.url}) {
    controller = VideoPlayerController.networkUrl(Uri.parse(url))
      ..initialize().then((_) {
        notifyListeners();

        controller.addListener(() {
          notifyListeners();
        });
      });
  }
  void play() {
    controller.play();
    notifyListeners();
  }

  void pause() {
    controller.pause();
    notifyListeners();
  }

  void back15s() {
    final currentPosition = controller.value.position;
    final newPosition = currentPosition - const Duration(seconds: 1);

    controller.seekTo(
      newPosition >= Duration.zero ? newPosition : Duration.zero,
    );
  }

  void next15s() {
    final currentPosition = controller.value.position;
    final duration = controller.value.duration;
    final newPosition = currentPosition + const Duration(seconds: 1);

    controller.seekTo(newPosition <= duration ? newPosition : duration);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
