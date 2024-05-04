import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillSecondaryContainer => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder125 => BorderRadius.circular(
        125.h,
      );
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16.h,
      );
// Custom borders
  static BorderRadius get customBorderBL15 => BorderRadius.vertical(
        bottom: Radius.circular(15.h),
      );
}
