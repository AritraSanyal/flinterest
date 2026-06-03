import 'package:flinterest/core/const/app_spacing.dart' as sp;
import 'package:flinterest/core/theme/app_color.dart' as ac;
import 'package:flinterest/feature/auth/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flinterest/feature/auth/presentation/widgets/picker_row.dart';
import 'package:flinterest/feature/auth/presentation/widgets/signup_wizard_screen_shell.dart';

class SignUpWizardScreen extends StatefulWidget {
  const SignUpWizardScreen({super.key});

  @override
  State<SignUpWizardScreen> createState() => _SignUpWizardScreenState();
}

class _SignUpWizardScreenState extends State<SignUpWizardScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final DateTime _dateOfBirth = DateTime.now();

  //====================================
  // page controller
  //====================================

  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  final int _totalPage = 7;

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
                    alignment: .centerLeft,

                    children: [
                      // --- back button ---
                      Transform.translate(
                        offset: const Offset(0, -3),
                        child: IconButton(
                          onPressed: _previousPage,
                          icon: Icon(
                            Symbols.arrow_back_ios_sharp,
                            weight: 300,
                            size: 20,
                            color: ac.AppColor.darkEnabledBorder,
                          ),
                        ),
                      ),

                      // --- dot indicator ---
                      Align(
                        alignment: .center,
                        child: Row(
                          mainAxisSize: .min,
                          children: List.generate(_totalPage, (index) {
                            return _buildDot(
                              index: index,
                              currentPageIndex: _currentPageIndex,
                            );
                          }),
                        ),
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
                      if (newIndex == 3) {
                        Future.delayed(const Duration(milliseconds: 300), () {
                          _showDateTimePicker();
                        });
                      }
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
                          controller: _emailController,
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
                        controller: _passwordController,
                        isPassword: true,
                        isPasswordCreation: true,
                      ),
                    ),

                    // --- step 3: Full name ---
                    SignUpWizardShell(
                      usableScreen: usableScreen,
                      title: 'What\'s your name?',
                      onNext: _nextPage,
                      child: InputField(
                        hintText: 'Full Name',
                        controller: _fullNameController,
                      ),
                    ),

                    // --- step 4: Dob ---
                    SignUpWizardShell(
                      usableScreen: usableScreen,
                      title:
                          'Hi ${_fullNameController.text.trim().split(' ').first}! Enter Your date of birth',
                      onNext: _nextPage,
                      child: Column(
                        children: [
                          // policy text?
                          Text(
                            'To help keep Flinterest safe, we now require your date of birth. Your date of birth also helps\nus provide more personalised\nrecommendations and relevant ads. We won\'t share this information without your permission and it won\'t be visible on your profile.',
                            textAlign: .center,
                            softWrap: true,
                            style: TextStyle(fontSize: 15),
                          ),

                          // Birthdate taker
                          sp.AppSpacing.gapVsm,
                          GestureDetector(
                            onTap: _showDateTimePicker,
                            child: Text(
                              'something',
                              style: Theme.of(context).textTheme.displayMedium
                                  ?.copyWith(fontWeight: .w600),
                            ),
                          ),

                          //footer thingie
                          sp.AppSpacing.gapVmd,
                          Text(
                            'Use you own age, even if this is a business account',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant
                                      .withValues(alpha: 0.6),
                                ),
                          ),
                        ],
                      ),
                    ),

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

  //====================================
  // dateTime picker for DOB
  //====================================
  void _showDateTimePicker() {
    final List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    final List<String> dates = List.generate(
      31,
      ((index) => (index + 1).toString()),
    );
    final List<String> years = List.generate(
      127,
      (((index) => (1900 + index).toString())),
    );

    showDialog(
      context: context,
      builder: (BuildContext sheetContext) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(),
          child: Container(
            padding: EdgeInsets.all(16),
            height: 300,
            width: double.maxFinite,
            child: Row(
              children: [
                // --- day picker ---
                PickerRow(lists: dates),

                // --- month picker ---
                PickerRow(lists: months),

                // --- year picker ---
                PickerRow(lists: years),
              ],
            ),
          ),
        );
      },
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
