import 'package:flinterest/core/theme/app_color.dart';
import 'package:flinterest/feature/auth/presentation/widgets/continue_with_google_button.dart';
import 'package:flinterest/feature/auth/presentation/widgets/input_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flinterest/core/const/app_spacing.dart' as sp;

class LoginScreen extends StatefulWidget {
  // final TextEditingController emailController;
  const LoginScreen({
    super.key,
    // required this.emailController
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final padding = MediaQuery.viewPaddingOf(context);
    final availableHeight = screenHeight - padding.top - padding.bottom;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .center,
          children: [
            sp.AppSpacing.gapVsm,
            //=========================================
            // CROSS ICON AND LOGIN TEXT WITH DIVIDER
            //=========================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: availableHeight * 0.06,
                width: double.infinity,
                child: Stack(
                  alignment: .centerLeft,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.xmark, size: 30),
                    ),
                    Align(
                      alignment: .center,
                      child: Text(
                        'Log in',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(fontWeight: .w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            sp.AppSpacing.gapVsm,

            // divider
            Divider(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46),
              child: Column(
                children: [
                  //=========================================
                  // CONTINUE WITH GOOGLE
                  //=========================================
                  sp.AppSpacing.gapVsm,
                  SizedBox(height: 50, child: ContinueWithGoogleButton()),
                  sp.AppSpacing.gapVmd,
                  // or
                  Transform.translate(
                    offset: const Offset(0, 6),
                    child: Text(
                      'Or',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(fontWeight: .w600),
                    ),
                  ),
                  sp.AppSpacing.gapVlg,

                  //=========================================
                  // EMAIL AND PASSWORD
                  //=========================================
                  InputField(
                    hintText: 'Enter your email address',
                    controller: _emailController,
                  ),

                  sp.AppSpacing.gapVsm,

                  InputField(
                    hintText: 'Enter your password',
                    controller: _passwordController,
                    isPassword: true,
                  ),

                  //=========================================
                  // LOGIN BUTTON & FORGOTTEN PASSWORD
                  //=========================================
                  sp.AppSpacing.gapVxl,
                  // login button
                  SizedBox(
                    height: 35,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Log in',
                        style: TextStyle(fontWeight: .w600),
                      ),
                    ),
                  ),

                  sp.AppSpacing.gapVmd,

                  Text.rich(
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: .w800,
                      color: AppColor.darkTextSubtle,
                    ),
                    TextSpan(
                      text: 'Forgotten password?',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Pressed forgotten password');
                        },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
