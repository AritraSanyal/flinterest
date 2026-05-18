import 'package:flutter/material.dart';

class AppSpacing {
  // ==========================
  // size def
  // ==========================
  static const double xs = 2.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  // ==========================
  // Horizontal spacing
  // ==========================
  // between button and text; image and text
  static const SizedBox gapHsm = SizedBox(width: sm);
  // between buttons, images and text, comment/search/send field and buttons
  static const SizedBox gapHmd = SizedBox(width: md);

  // ==========================
  // Vertical spacing
  // ==========================
  // between content blocks
  static const SizedBox gapVxs = SizedBox(height: xs);
  // between pins reps(without matadata) on grid
  // between elements/text within same content block
  static const SizedBox gapVsm = SizedBox(height: sm);
  // between content blocka nd actions (eg banners)
  // between items in a list
  static const SizedBox gapVmd = SizedBox(height: md);
  //between pin reps(with metadata) on grid
  // and board reps on profile
  static const SizedBox gapVlg = SizedBox(height: lg);
  // between content blocks
  static const SizedBox gapVxl = SizedBox(height: xl);
}
