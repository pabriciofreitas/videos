// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

class VideoModel {
  final String image;
  final String title;
  final String subTitle;
  final String description;
  final String url;
  final int countComments;
  final bool isLike;
  final List<Color> gradientColors;
  VideoModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.url,
    required this.countComments,
    required this.isLike,
    required this.gradientColors,
  });
}
