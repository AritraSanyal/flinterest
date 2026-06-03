import 'package:flutter/material.dart';
import 'package:flinterest/core/const/app_spacing.dart' as sp;
//====================================
// shell for all the wizard screens
//====================================

class SignUpWizardShell extends StatelessWidget {
  final Widget child;
  final double usableScreen;
  final String title;
  final VoidCallback onNext;
  const SignUpWizardShell({
    super.key,
    required this.usableScreen,
    required this.title,
    required this.onNext,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: usableScreen,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: .center,
        children: [
          sp.AppSpacing.gapVsm,
          //====================================
          // PageViewShell
          //====================================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // --- Headline ---
                  Text(
                    title,
                    textAlign: .center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 20,
                      fontWeight: .w600,
                    ),
                  ),

                  sp.AppSpacing.gapVmd,

                  // --- child Widget Passed from screen---
                  child,

                  const Spacer(),

                  // --- Next Button ---
                  SizedBox(
                    height: 50,
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: onNext,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: .circular(17),
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.fontSize,
                          fontWeight: .w400,
                        ),
                      ),
                    ),
                  ),
                  sp.AppSpacing.gapVmd,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
