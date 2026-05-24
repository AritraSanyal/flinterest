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
          // Image 5: woman with brush
          Positioned(
            top: 105,
            right: 70,
            height: 80,
            width: 70,
            child: ImageClip(imagePath: 'assets/images/collage_image_5.jpg'),
          ),

          // Image 4: baige sofa
          Positioned(
            top: -30,
            left: -20,
            height: 120,
            width: 137,
            child: ImageClip(imagePath: 'assets/images/collage_image_4.jpg'),
          ),

          // Image 1: lady with skirt
          Align(
            alignment: .center,
            child: SizedBox(
              height: 210,
              width: 150,
              child: ImageClip(imagePath: 'assets/images/collage_image_1.jpg'),
            ),
          ),

          // Image 2: cookie and plate
          Positioned(
            bottom: 0,
            left: -10,
            height: 150,
            width: 80,

            child: ImageClip(imagePath: 'assets/images/collage_image_2.jpg'),
          ),

          // Image 3: vase and all
          Positioned(
            bottom: 20,
            right: -25,
            height: 100,
            width: 100,
            child: ImageClip(imagePath: 'assets/images/collage_image_3.jpg'),
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
