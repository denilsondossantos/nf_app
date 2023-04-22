import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() {
  ColorScheme defaultColors = const ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xffe65100),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffffcc80),
  onPrimaryContainer: Color(0xff282317),
  secondary: Color(0xff2979ff),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffe4eaff),
  onSecondaryContainer: Color(0xff262728),
  tertiary: Color(0xff2962ff),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffcbd6ff),
  onTertiaryContainer: Color(0xff222428),
  error: Color(0xffb00020),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfffcd8df),
  onErrorContainer: Color(0xff282526),
  outline: Color(0xff625c5c),
  background: Color(0xfffdf1eb),
  onBackground: Color(0xff131212),
  surface: Color(0xfffef8f5),
  onSurface: Color(0xff090909),
  surfaceVariant: Color(0xfffdf1eb),
  onSurfaceVariant: Color(0xff131212),
  inverseSurface: Color(0xff191310),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xffffcf99),
  shadow: Color(0xff000000),
);


  TextTheme basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1?.copyWith(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'DDin',
        color: defaultColors.onSurface,
      ),
      headline5: base.headline4?.copyWith(
        fontSize: 18.0,
        fontFamily: 'DDin',
        color: defaultColors.onSurface,
      ),
      caption: base.headline5?.copyWith(
        fontSize: 12.0,
        fontFamily: 'DDin',
      ),
      headline6: base.headline6?.copyWith(
        fontSize: 23.0,
        fontFamily: 'DDin',
      ),
      bodyText1: base.bodyText1?.copyWith(
        color: defaultColors.onSurface,
        fontFamily: 'DDin',
        fontSize: 14,
      ),
    );
  }

  InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    helperMaxLines: 1,
    focusColor: defaultColors.onSurface,
    errorMaxLines: 1,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    isDense: false,
    contentPadding: const EdgeInsets.all(0),
    isCollapsed: false,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: defaultColors.onSurface, width: 0.5),
    ),
    filled: false,
    alignLabelWithHint: false,
  );

  TextButtonThemeData textButtonTheme = TextButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.fromLTRB(0, 0, 0, 0))));

  return ThemeData(
    brightness: Brightness.light,
    primaryColor: defaultColors.primary,
    primaryColorLight: const Color(0xFFfffd50),
    primaryColorDark: const Color(0xFFc79a00),
    scaffoldBackgroundColor: defaultColors.background,
    dialogBackgroundColor: defaultColors.background,
    toggleableActiveColor: defaultColors.primary,
    highlightColor: defaultColors.secondary,
    indicatorColor: defaultColors.secondary,
    fontFamily: 'DDin',
    textTheme: basicTextTheme(const TextTheme()),
    inputDecorationTheme: inputDecorationTheme,
    textButtonTheme: textButtonTheme,
    colorScheme: defaultColors,
    applyElevationOverlayColor: true,
    backgroundColor: defaultColors.background,
    bottomAppBarColor: defaultColors.surface,
    canvasColor: defaultColors.background,
    cardColor: defaultColors.surface,
    disabledColor: defaultColors.onSurfaceVariant,
    dividerColor: defaultColors.shadow,
    errorColor: defaultColors.error,
    focusColor: const Color(0x1f000000),
    hintColor: const Color(0x99000000),
    hoverColor: const Color(0x0a000000),
    // appBarTheme: appBarTheme(const TextTheme()),
  );
}
