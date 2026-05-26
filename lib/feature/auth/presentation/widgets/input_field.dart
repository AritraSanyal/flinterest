import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  const InputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
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
  }

  @override
  void dispose() {
    _focusNode.dispose();
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

    if (_isFocused) {
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
}
