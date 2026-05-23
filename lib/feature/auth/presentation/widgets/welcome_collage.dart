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
            right: 60,
            height: 100,
            width: 100,
            child: ImageClip(imagePath: 'assets/images/collage_image_5.jpg'),
          ),

          // Image 1
          Align(
            alignment: .center,
            child: SizedBox(
              height: 210,
              width: 150,
              child: ImageClip(imagePath: 'assets/images/collage_image_1.jpg'),
            ),
          ),

          // Image 2
          Positioned(
            bottom: 0,
            left: -10,
            height: 150,
            width: 80,

            child: ImageClip(imagePath: 'assets/images/collage_image_2.jpg'),
          ),

          // Image 3
          Positioned(
            bottom: 20,
            right: -10,
            height: 100,
            width: 80,
            child: ImageClip(imagePath: 'assets/images/collage_image_3.jpg'),
          ),

          // Image 4
          Positioned(
            top: -20,
            left: -20,
            height: 120,
            width: 137,
            child: ImageClip(imagePath: 'assets/images/collage_image_4.jpg'),
          ),

          // Image 6
          Positioned(
            right: -5,
            top: -89,
            height: 100,
            width: 110,
            child: ImageClip(imagePath: 'assets/images/collage_image_6.jpg'),
          ),
        ],
      ),
    );
  }
}
