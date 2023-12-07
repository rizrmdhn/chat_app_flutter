import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// colors
const Color kColorPrimary = Color(0xFF222831);
const Color kColorSecondary = Color(0xFF393e46);
const Color kMutedSecondaryColor = Color.fromRGBO(57, 62, 70, 0.5);
const Color kAccentColor = Color(0xFF00adb5);
const Color kTextColor = Color(0xFFeeeeee);
const Color kErrorColor = Color(0xFFff3f34);

// text styles
final TextStyle kHeadingTextStyle = GoogleFonts.roboto(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: kTextColor,
);
final TextStyle kSubHeadingTextStyle = GoogleFonts.roboto(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: kTextColor,
);
final TextStyle kBodyTextStyle = GoogleFonts.roboto(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: kTextColor,
);
final TextStyle kCaptionTextStyle = GoogleFonts.roboto(
  fontSize: 14,
  fontWeight: FontWeight.w300,
  color: kTextColor,
);
final TextStyle kButtonTextStyle = GoogleFonts.roboto(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: kTextColor,
);

// text theme
final TextTheme kTextTheme = TextTheme(
  headlineSmall: kSubHeadingTextStyle,
  titleLarge: kHeadingTextStyle,
  titleMedium: kSubHeadingTextStyle,
  bodyMedium: kBodyTextStyle,
  bodySmall: kCaptionTextStyle,
  labelLarge: kButtonTextStyle,
);

// color scheme
const kColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: kColorPrimary,
  onPrimary: kTextColor,
  secondary: kColorSecondary,
  onSecondary: kTextColor,
  error: kErrorColor,
  onError: kTextColor,
  background: kColorPrimary,
  onBackground: kTextColor,
  surface: kColorSecondary,
  onSurface: kTextColor,
);
