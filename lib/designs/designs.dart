import 'package:flutter/material.dart';

class DesignSystem {
  /// Values for padding/margin will be multiple of this `space` value
  static double space = 10;

  /// Colors
  static Color grey0 = Color(0xffFFFFFF);
  static Color grey1 = Color(0xffF6F6F6);
  static Color grey2 = Color(0xff000000).withOpacity(0.7);
  static Color grey3 = Color(0xff000000).withOpacity(0.9);

  /// Font Family
  static String fontHead = 'Sofia Pro';
  static String fontBody = 'Sofia Pro';

  /// Font Styles

  static TextStyle boldHeadingTextStyle(double fontSize) => TextStyle(
        fontSize: fontSize,
        color: grey3,
        fontFamily: fontHead,
        fontWeight: FontWeight.w700,
      );

  static TextStyle regularBodyTextStyle(double fontSize) => TextStyle(
        fontSize: fontSize,
        color: grey2,
        fontFamily: fontBody,
        fontWeight: FontWeight.w400,
        height: 1.3,
      );

  static TextStyle bigHeading = boldHeadingTextStyle(44);
  static TextStyle heading4 = boldHeadingTextStyle(24);
  static TextStyle heading5 = boldHeadingTextStyle(18);
  static TextStyle bodyTextIntro = boldHeadingTextStyle(20);
  static TextStyle bodyMainText = regularBodyTextStyle(17);

  static TextTheme textTheme = TextTheme(
    headline1: bigHeading,
    headline4: heading4,
    headline5: heading5,
    bodyText1: bodyTextIntro,
    bodyText2: bodyMainText,
  );
}
