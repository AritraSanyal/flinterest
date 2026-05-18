import 'package:flinterest/core/theme/app_color.dart';
import 'package:flinterest/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .stretch,
              children: [
                // CRATE A LIFE YOU LOVE
                Text(
                  "Create a life\nyou love",
                  textAlign: .center,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium?.copyWith(fontWeight: .w700),
                ),

                // SPACING
                AppSpacing.gapVlg,

                // EMAIL CHECK
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white),
                    ),

                    hintText: 'Email address',
                    hintStyle: const TextStyle(color: AppColor.darkTextSubtle),
                  ),
                ),

                // SPACING
                AppSpacing.gapVlg,

                // CONTINUE BUTTON
                ElevatedButton(
                  onPressed: () {
                    //TODO ADD WHAT HAPPENS WHEN CONTINUE
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(color: AppColor.darkTextDefault),
                  ),
                ),

                // SPACING
                AppSpacing.gapVlg,

                // CONTINUE WITH GOOGLE
                OutlinedButton(
                  onPressed: () {},
                  child: Row(mainAxisAlignment: .spaceEvenly, children: [
                    

                  ],
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
