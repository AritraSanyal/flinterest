import 'package:flinterest/core/theme/app_color.dart';
import 'package:flinterest/core/theme/app_spacing.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),

                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .stretch,

                      children: [
                        // CRATE A LIFE YOU LOVE
                        Text(
                          "Create a life\nyou love",
                          textAlign: .center,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(fontWeight: .w700),
                        ),

                        // SPACING
                        AppSpacing.gapVlg,

                        // EMAIL CHECK
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: AppColor.darkSecondaryBase,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.white),
                            ),

                            hintText: 'Email address',
                            hintStyle: const TextStyle(
                              color: AppColor.darkTextSubtle,
                            ),
                          ),
                        ),

                        // SPACING
                        AppSpacing.gapVlg,

                        // CONTINUE BUTTON
                        ElevatedButton(
                          onPressed: () {
                            print('continue');
                          },
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontWeight: .w600,
                              color: AppColor.darkTextDefault,
                            ),
                          ),
                        ),

                        // SPACING
                        AppSpacing.gapVlg,

                        // CONTINUE WITH GOOGLE
                        OutlinedButton(
                          onPressed: () {
                            print('continue with google');
                          },
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                'assets/google.svg',
                                height: 25,
                                width: 25,
                              ),
                              Align(
                                alignment: .center,
                                child: Text(
                                  'Continue with Google',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        fontSize: 15,
                                        fontWeight: .w700,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        AppSpacing.gapVmd,

                        // FACEBOOK LOGIN IS NO LONGER AVAILABLE
                        Text.rich(
                          textAlign: .center,

                          TextSpan(
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(height: 0.9, fontSize: 14),

                            children: [
                              TextSpan(
                                text: 'Facebook login is no longer available. ',
                              ),

                              TextSpan(
                                text: 'Recover your account',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: .w600),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('recover');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 50, right: 50),

              child: Text.rich(
                textAlign: .center,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontSize: 11),

                TextSpan(
                  children: [
                    TextSpan(text: 'By continuing, you agree to Pinterest\'s '),
                    TextSpan(
                      text: 'Terms of Service',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Terms of Service');
                        },
                    ),

                    TextSpan(text: ' and acknowledge that you\'ve read our '),

                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Privacy Policy');
                        },
                    ),

                    TextSpan(text: '. '),

                    TextSpan(
                      text: 'Notice at collection.',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Notice at collection.');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
