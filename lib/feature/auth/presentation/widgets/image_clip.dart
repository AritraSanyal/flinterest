import 'package:flutter/material.dart';
// import 'package:flutter/widget_previews.dart';

class ImageClip extends StatelessWidget {
  final Color passedColor;
  const ImageClip({super.key, required this.passedColor});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(16),
      child: ColoredBox(color: passedColor),
    );
  }
}
