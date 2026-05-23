import 'package:flutter/material.dart';
// import 'package:flutter/widget_previews.dart';

class ImageClip extends StatelessWidget {
  const ImageClip({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(16),
      child: Image.asset(imagePath),
    );
  }
}
