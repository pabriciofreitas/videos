import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:videos/model/video_model.dart';

class HomeViewModel extends ChangeNotifier {
  final List<VideoModel> videos = [];
  bool isLoading = false;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  final video = VideoModel(
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
    title: 'Barbie',
    subTitle: 'Musical',
    image:
        'https://moviepostermexico.com/cdn/shop/files/barbie_xxlg_1024x1024@2x.jpg',
    url:
        'https://github.com/pabriciofreitas/videos/raw/refs/heads/home/videos/barbie.mp4',
    countComments: 1000,
    isLike: false,
    gradientColors: [Color(0xfffc466b), Color(0xff3f5efb)],
  );
  Future<void> getVideos() async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 2));

    videos.addAll([
      VideoModel(
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
        title: 'Barbie',
        subTitle: 'Musical',
        image:
            'https://moviepostermexico.com/cdn/shop/files/barbie_xxlg_1024x1024@2x.jpg',
        url:
            'https://github.com/pabriciofreitas/videos/raw/refs/heads/home/videos/barbie.mp4',
        countComments: 1000,
        isLike: true,
        gradientColors: [Color(0xfffc466b), Color(0xff3f5efb)],
      ),
    ]);
    setLoading(false);
  }
}
