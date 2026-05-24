import 'package:flutter/material.dart';
// import 'package:flutter/widget_previews.dart';

class ImageClip extends StatefulWidget {
  final String imagePath;
  final bool animate;
  const ImageClip({super.key, required this.imagePath, this.animate = false});

  @override
  State<ImageClip> createState() => _ImageClipState();
}

class _ImageClipState extends State<ImageClip>
    with SingleTickerProviderStateMixin {
  // Declareing Animation Controller
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = ClipRRect(
      borderRadius: .circular(16),
      child: Image.asset(widget.imagePath, fit: BoxFit.cover),
    );
    if (widget.animate) {
      return SlideTransition(position: _slideAnimation, child: imageWidget);
    }
    return imageWidget;
  }

  @override
  void initState() {
    super.initState();

    // initialize the controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // how much should it would scale
    _slideAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(0, -0.5))
        .animate(
          CurvedAnimation(parent: _animationController, curve: Curves.linear),
        );

    // starting the loop
    _animationController.repeat(reverse: true);
  }
}
