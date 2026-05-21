import 'package:flinterest/core/theme/app_spacing.dart' as sp;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final padding = MediaQuery.viewPaddingOf(context);
    final availableHeight = screenHeight - padding.top - padding.bottom;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: availableHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),

                child: Column(
                  crossAxisAlignment: .center,
                  children: [
                    // ===============================
                    // COLLAGE and logo
                    // ===============================

                    // placeholder for the collage
                    Stack(
                      clipBehavior: .none,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.40,
                          width: double.infinity,
                          child: const Placeholder(
                            color: Colors.grey,
                            strokeWidth: 2,
                          ),
                        ),

                        Positioned(
                          bottom: 5,
                          left: 0,
                          right: 0,
                          child: SvgPicture.asset(
                            'assets/flinterest_logo.svg',
                            height: 38,
                            width: 38,
                          ),
                        ),
                      ],
                    ),

                    // ===============================
                    // FORM AND INTERACTIVE BUTTONS
                    // ===============================
                    sp.AppSpacing.gapVsm,

                    // HEADER
                    Text(
                      'Create a life\nyou love',
                      textAlign: .center,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(fontWeight: .w700),
                    ),

                    sp.AppSpacing.gapVlg,

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        children: [
                          // ======================
                          // email
                          // ======================
                          TextField(
                            scrollPadding: EdgeInsets.only(bottom: 300),
                            decoration: InputDecoration(
                              hintText: 'Email address',
                            ),
                          ),

                          sp.AppSpacing.gapVlg,

                          // ======================
                          // continue button
                          // ======================
                          SizedBox(
                            width: double.infinity,
                            height: 35,
                            child: ElevatedButton(
                              onPressed: () {
                                print('continue');
                              },
                              child: Text(
                                'Continue',
                                style: TextStyle(fontWeight: .w600),
                              ),
                            ),
                          ),

                          sp.AppSpacing.gapVlg,

                          // ======================
                          // Continue with google
                          // ======================
                          SizedBox(
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
                                  SvgPicture.asset(
                                    'assets/google.svg',
                                    height: 25,
                                    width: 25,
                                  ),
                                  // text
                                  Align(
                                    alignment: .center,
                                    child: Text(
                                      'Continue with Google',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontSize: 15,
                                            fontWeight: .w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sp.AppSpacing.gapVmd,

                    // ======================
                    // recover facebook login
                    // ======================
                    Text.rich(
                      textAlign: .center,
                      TextSpan(
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.1,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'Facebook login is no longer available. ',
                          ),
                          TextSpan(
                            text: 'Recover your account',
                            style: const TextStyle(fontWeight: .w600),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Recover your accout');
                              },
                          ),
                        ],
                      ),
                    ),

                    // ===============================
                    // LEGAL TERMS
                    // ===============================
                    const SizedBox(height: 40),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Text.rich(
                        textAlign: .center,
                        style: Theme.of(context).textTheme.bodySmall,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'By continuing, you agree to Pinterest\'s ',
                            ),
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
                            TextSpan(
                              text: ' and acknowledge that you\'ve read our ',
                            ),
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
                              text: 'Notice at collection',
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(text: '.'),
                          ],
                        ),
                      ),
                    ),
                    sp.AppSpacing.gapVmd,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
