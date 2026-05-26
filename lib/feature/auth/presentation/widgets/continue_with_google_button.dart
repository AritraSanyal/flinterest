import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinueWithGoogleButton extends StatelessWidget {
  const ContinueWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: ,
      child: OutlinedButton(
        onPressed: () {
          print('Continue with google');
        },
        child: Stack(
          alignment: .centerLeft,
          children: [
            // google svg
            SvgPicture.asset('assets/logo/google.svg', height: 25, width: 25),
            // text
            Align(
              alignment: .center,
              child: Text(
                'Continue with Google',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 15,
                  fontWeight: .w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
