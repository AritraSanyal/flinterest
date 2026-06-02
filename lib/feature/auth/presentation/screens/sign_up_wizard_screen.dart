import 'package:flinterest/core/const/app_spacing.dart' as sp;
import 'package:flinterest/core/theme/app_color.dart' as ac;
import 'package:flinterest/feature/auth/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class SignUpWizardScreen extends StatefulWidget {
  const SignUpWizardScreen({super.key});

  @override
  State<SignUpWizardScreen> createState() => _SignUpWizardScreenState();
}

class _SignUpWizardScreenState extends State<SignUpWizardScreen> {
  final TextEditingController _controller = TextEditingController();
  //====================================
  // page controller
  //====================================
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  final int _totalPage = 7;

  // --- dot build widget ---
  Widget _buildDot({required int index, required int currentPageIndex}) {
    bool isActive = (index == currentPageIndex);
    bool isPageVisited = (index < currentPageIndex);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: isActive ? 8 : 6,
      width: isActive ? 8 : 6,

      decoration: BoxDecoration(
        // shape of dots
        shape: BoxShape.circle,

        //color of dots -- white if done or present else grey
        color: isActive
            ? Theme.of(context).colorScheme.surface
            : isPageVisited
            ? Theme.of(context).colorScheme.onSecondary
            : Theme.of(context).colorScheme.secondary,

        //border of dots -- only active
        border: isActive
            ? BoxBorder.all(
                color: Theme.of(context).colorScheme.onSecondary,
                width: 2.0,
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final padding = MediaQuery.paddingOf(context);
    final usableScreen = screenHeight - padding.top - padding.bottom;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: usableScreen,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: .center,
            children: [
              sp.AppSpacing.gapVsm,

              //====================================
              // top bar
              //====================================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),

                child: SizedBox(
                  height: usableScreen * 0.035,
                  width: double.infinity,

                  child: Stack(
                    alignment: .center,

                    children: [
                      // --- back button ---
                      Align(
                        alignment: .centerLeft,
                        child: IconButton(
                          onPressed: _previousPage,
                          icon: Icon(
                            Symbols.arrow_back_ios_sharp,
                            weight: 300,
                            color: ac.AppColor.darkEnabledBorder,
                          ),
                        ),
                      ),

                      // --- dot indicator ---
                      Row(
                        mainAxisSize: .min,
                        children: List.generate(_totalPage, (index) {
                          return _buildDot(
                            index: index,
                            currentPageIndex: _currentPageIndex,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              //====================================
              // PageView
              //====================================
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (int newIndex) {
                    setState(() {
                      _currentPageIndex = newIndex;
                    });
                  },

                  children: [
                    // --- step 1: Email ---
                    SignUpWizardShell(
                      usableScreen: usableScreen,
                      title: 'What is your email address?',
                      onNext: _nextPage,
                      child: SizedBox(
                        height: 50,
                        child: InputField(
                          hintText: 'Enter your email address',
                          controller: _controller,
                        ),
                      ),
                    ),

                    // --- step 2: Password ---
                    SignUpWizardShell(
                      usableScreen: usableScreen,
                      title: 'Create a password',
                      onNext: _nextPage,
                      child: InputField(
                        hintText: 'Create a strong password',
                        controller: _controller,
                        isPassword: true,
                        isPasswordCreation: true,
                      ),
                    ),

                    // --- step 3: Full name ---

                    // --- step 4: Dob ---

                    // --- step 5: Gender ---

                    // --- step 6: country ---

                    // --- step 7: Mood ---
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //====================================
  // next and previous screen logic
  //====================================
  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}

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
                  sp.AppSpacing.gapVsm,

                  // --- Headline ---
                  Text(
                    title,
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
