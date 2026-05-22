import 'package:flutter/material.dart';
import 'package:flinterest/feature/auth/presentation/widgets/image_clip.dart';

class WelcomeCollage extends StatelessWidget {
  const WelcomeCollage({super.key, required this.screenHeight});

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.40,
      width: double.infinity,
      child: Stack(
        children: [
          // Image 5
          Positioned(
            top: 105,
            right: 65,
            height: 100,
            width: 100,
            child: ImageClip(passedColor: Colors.indigoAccent),
          ),

          // Image 1
          Align(
            alignment: .center,
            child: SizedBox(
              height: 210,
              width: 150,
              child: ImageClip(passedColor: Colors.red),
            ),
          ),

          // Image 2
          Positioned(
            bottom: 0,
            left: -10,
            height: 150,
            width: 80,

            child: ImageClip(passedColor: Colors.white),
          ),

          // Image 3
          Positioned(
            bottom: 20,
            right: -10,
            height: 100,
            width: 80,
            child: ImageClip(passedColor: Colors.greenAccent),
          ),

          // Image 4
          Positioned(
            top: -20,
            left: -20,
            height: 120,
            width: 137,
            child: ImageClip(passedColor: Colors.cyan),
          ),

          // Image 6
          Positioned(
            right: -10,
            top: -89,
            height: 100,
            width: 120,
            child: ImageClip(passedColor: Colors.limeAccent),
          ),
        ],
      ),
    );
  }
}
