import 'package:flinterest/core/const/app_spacing.dart' as sp;
import 'package:flinterest/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

class InputField extends StatefulWidget {
  // --- class properties & constructors ---
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isPasswordCreation;
  const InputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.isPasswordCreation = false,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // --- class properties & constructors ---
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  late bool _isObscured;

  @override
  Widget build(BuildContext context) {
    // ===================================
    // Password Creation Widget
    // ===================================
    if (widget.isPasswordCreation) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 8,
              top: 8,
              bottom: 8,
            ),
            decoration: BoxDecoration(
              border: BoxBorder.all(
                color: _isFocused
                    ? Theme.of(context).colorScheme.onSecondary
                    : Theme.of(context).colorScheme.secondary,
                width: _isFocused ? 2.0 : 1.2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),

            child: Stack(
              alignment: .centerRight,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,

                  children: [
                    Text(
                      "Password",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(fontWeight: .w600),
                    ),

                    TextField(
                      controller: widget.controller,
                      focusNode: _focusNode,
                      obscureText: _isObscured,

                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        border: .none,
                        enabledBorder: .none,
                        focusedBorder: .none,
                        errorBorder: .none,
                        isDense: true,
                        contentPadding: const EdgeInsets.only(top: 4),
                      ),
                    ),
                  ],
                ),
                if (_buildSuffixIcon() != null) _buildSuffixIcon()!,
              ],
            ),
          ),

          // --- Strength Slider ---

          // --- helper text ---
          sp.AppSpacing.gapVmd,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
              alignment: .centerLeft,
              child: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  if (widget.controller.text.isNotEmpty)
                    _buildPasswordStrengthIndicator(),

                  sp.AppSpacing.gapVsm,

                  Text(
                    'Use 8 or more letters, numbers and symbols',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: .w600,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),

          sp.AppSpacing.gapVxl,

          // --- Password tips---
          if (widget.controller.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: .centerLeft,
                child: GestureDetector(
                  onTap: _buildPasswordTipsSheet,
                  child: Row(
                    mainAxisSize: .min,
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .center,
                    children: [
                      Text(
                        'Password tips',
                        style: TextStyle(fontWeight: .w600),
                      ),
                      sp.AppSpacing.gapHxs,
                      Icon(Symbols.info, size: 17, weight: 600),
                    ],
                  ),
                ),
              ),
            ),
        ],
      );
    }
    // ===================================
    // Normal Text Field
    // ===================================
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: _isObscured,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: _buildSuffixIcon(),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    widget.controller.addListener(_onTextChanged);
  }

  Widget _buildPasswordStrengthIndicator() {
    // -- determine strength ---
    Color barColor = AppPalette.red500;
    String helperText = 'Make it more complicated';
    double progressionPercentage = 0.3;
    switch (widget.controller.text.length) {
      case 4:
      case 5:
      case 6:
      case 7:
        barColor = AppPalette.green500;
        helperText = 'Looking good';
        progressionPercentage = 0.6;
        break;
      case >= 8:
        barColor = AppPalette.green500;
        helperText = 'Perfection!';
        progressionPercentage = 1;
    }
    return LayoutBuilder(
      builder: (context, constraint) {
        return Column(
          crossAxisAlignment: .start,
          children: [
            // --- linear progressor ---
            SizedBox(
              height: 10,
              child: Stack(
                alignment: .centerLeft,
                children: [
                  // --- base ---
                  Container(
                    decoration: BoxDecoration(
                      color: AppPalette.marshmallow0,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  // --- progression slider ---
                  Container(
                    decoration: BoxDecoration(
                      color: barColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 700),
                      curve: Curves.decelerate,
                      width: constraint.maxWidth * progressionPercentage,
                    ),
                  ),
                ],
              ),
            ),

            // --- Helper ---
            sp.AppSpacing.gapVsm,
            Text(
              helperText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: .w600,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        );
      },
    );
  }

  void _buildPasswordTipsSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 335,
          child: DefaultTextStyle(
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: .w600),
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                Text('Password tips'),
                sp.AppSpacing.gapVlg,
                Text(
                  'A strong password keep your account safe.\nUse at least 8 letters, numbers and symbols.',
                  style: TextStyle(height: 1.15),
                ),
                sp.AppSpacing.gapVmd,
                Text("What to avoid"),
                sp.AppSpacing.gapVsm,
                Text('• Common passwords, words and names'),
                sp.AppSpacing.gapVsm,
                Text('• Recent dates or dates associated with you'),
                sp.AppSpacing.gapVsm,
                Text('• Simple patterns and repeated text'),
                sp.AppSpacing.gapVlg,
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: Text(
                      'OK',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPassword) {
      return IconButton(
        onPressed: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
        icon: Icon(
          _isObscured
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
      );
    }

    if (_isFocused && widget.controller.text.isNotEmpty) {
      return IconButton(
        onPressed: () {
          setState(() {
            widget.controller.clear();
          });
        },
        icon: Icon(Icons.cancel_outlined),
      );
    }

    return null;
  }

  void _onTextChanged() {
    setState(() {});
  }
}
