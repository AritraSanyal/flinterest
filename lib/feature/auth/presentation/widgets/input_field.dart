import 'package:flutter/material.dart';
import 'package:flinterest/core/const/app_spacing.dart' as sp;
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

  void _onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
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
                children: [
                  if (widget.controller.text.isNotEmpty)
                    _buildStrengthIndicator(),
                  Text(
                    'Use 8 or more letters, numbers and symbols',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: .w600,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
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
                  onTap: _buildPasswordTipsDrawer,
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

  Widget _buildStrengthIndicator() {
    // -- determine strength ---
    Color barColor;
    String helperText;
    return Text('hi');
  }

  void _buildPasswordTipsDrawer() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [],
          ),
        );
      },
    );
  }
}
